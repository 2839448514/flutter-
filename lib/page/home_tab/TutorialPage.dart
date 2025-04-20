import 'dart:io'; // 导入 dart:io 库
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart'; // 导入 Markdown 渲染库
import 'package:flutter/services.dart' show rootBundle; // 导入 rootBundle
import 'dart:convert'; // 导入 json 库


class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  // 教程文章数据模型
  List<TutorialArticle> _articles = [];

  @override
  void initState() {
    super.initState();
    _loadArticlesFromAssets('assets/markdown'); // 加载所有分类的文章
  }

  // 从 assets 目录中读取 Markdown 文件并解析为文章数据模型
  Future<void> _loadArticlesFromAssets(String directoryPath) async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final markdownFiles = manifestMap.keys
          .where((String key) => key.startsWith(directoryPath) && key.endsWith('.md'))
          .toList();

      List<TutorialArticle> articles = [];
      for (var filePath in markdownFiles) {
        final content = await rootBundle.loadString(filePath);
        final article = _parseMarkdownToArticle(content, filePath);
        articles.add(article);
      }

      setState(() {
        _articles = articles;
      });
    } catch (e) {
      print('加载文章时出错: $e');
    }
  }

  // 解析 Markdown 内容为文章数据模型
  TutorialArticle _parseMarkdownToArticle(String content, String filePath) {
    // 简单解析 Markdown 文件的标题、描述和分类
    final lines = content.split('\n');
    final title = lines.firstWhere((line) => line.startsWith('# '), orElse: () => '无标题').substring(2);
    final description = lines.skip(1).takeWhile((line) => line.isNotEmpty).join(' ');
    final categoryLine = lines.firstWhere((line) => line.startsWith('Category: '), orElse: () => 'Category: 未分类');
    final category = categoryLine.substring(10);

    return TutorialArticle(
      title: title,
      description: description,
      date: '未知日期',
      image: 'https://flutter.dev/images/flutter-mono-81x100.png',
      category: category,
      readTime: '未知时间',
      author: '未知作者',
      content: content,
      filePath: filePath,
    );
  }

  // 当前选中的分类
  String _selectedCategory = '全部';

  // 获取所有分类
  List<String> get _categories {
    final Set<String> categories = {'全部'};
    for (var article in _articles) {
      categories.add(article.category);
    }
    return categories.toList();
  }

  // 根据当前选中的分类过滤文章
  List<TutorialArticle> get _filteredArticles {
    if (_selectedCategory == '全部') {
      return _articles;
    }
    return _articles
        .where((article) => article.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 教程'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 实现搜索功能
            },
          ),
        ],
      ),
      body: _articles.isEmpty
          ? Center(child: Text('未找到任何文章'))
          : Column(
              children: [
                // 分类选择器
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = category == _selectedCategory;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedCategory = category;
                              });
                            }
                          },
                          selectedColor: Theme.of(context).colorScheme.primary,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // 修改文章网格视图以改善显示问题
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200, // 网格最大宽度 200px，自动计算列数
                      childAspectRatio: 0.8, // 调整卡片宽高比
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: _filteredArticles.length,
                    itemBuilder: (context, index) {
                      final article = _filteredArticles[index];
                      return ArticleCard(article: article);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  // 根据屏幕宽度计算列数的方法
  int _calculateCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // 根据不同宽度返回不同的列数
    if (width > 1200) {
      return 4; // 大屏幕显示4列
    } else if (width > 800) {
      return 3; // 中等屏幕显示3列
    } else if (width > 600) {
      return 2; // 小屏幕显示2列
    } else {
      return 1; // 手机屏幕显示1列
    }
  }
}

// 修改文章卡片组件，添加 Markdown 渲染功能
class ArticleCard extends StatelessWidget {
  final TutorialArticle article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          // 导航到文章详情页，使用 Markdown 详情页
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article: article),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 类别标签
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  article.category,
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // 标题
              Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),
              
              // 描述 - 使用简单文本预览
              Expanded(
                child: Text(
                  article.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ),

              // 底部元信息
              Row(
                children: [
                  // 作者
                  Icon(Icons.person_outline, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 2),
                  Text(
                    article.author,
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                  const Spacer(),
                  // 阅读时间
                  Icon(Icons.access_time, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 2),
                  Text(
                    article.readTime,
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                ],
              ),
              
              const SizedBox(height: 6),
              
              // 日期
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 12, color: Colors.grey[600]),
                  const SizedBox(width: 2),
                  Text(
                    article.date,
                    style: TextStyle(color: Colors.grey[700], fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 新增文章详情页，使用 Markdown 渲染内容
class ArticleDetailPage extends StatelessWidget {
  final TutorialArticle article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 文章头部信息
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // 元信息行
                  Row(
                    children: [
                      // 作者
                      Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        article.author,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      // 日期
                      Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        article.date,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      // 阅读时间
                      Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        article.readTime,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // 分类标签
                  Chip(
                    label: Text(article.category),
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            
            // 分隔线
            const Divider(),
            
            // 文章内容 - 使用 Markdown 渲染
            Padding(
              padding: const EdgeInsets.all(16),
              child: MarkdownBody(
                data: article.content ?? getDefaultMarkdownContent(article),
                styleSheet: MarkdownStyleSheet(
                  h1: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  h2: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  h3: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  p: const TextStyle(fontSize: 16, height: 1.5),
                  code: TextStyle(
                    backgroundColor: Colors.grey[200],
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // 根据文章摘要生成默认的 Markdown 内容（当实际内容不可用时）
  String getDefaultMarkdownContent(TutorialArticle article) {
    return '''
# ${article.title}

${article.description}

## 示例代码

```dart
void main() {
  print('这是一个示例代码块');
}
```

## 小结

本文介绍了关于 ${article.title} 的基本概念和使用技巧。希望这篇教程对你有所帮助！

---

*这是一篇关于 ${article.category} 的教程文章*
''';
  }
}

// 教程文章模型
class TutorialArticle {
  final String title;
  final String description;
  final String date;
  final String image;
  final String category;
  final String readTime;
  final String author;
  final String? content; // 添加 Markdown 内容字段
  final String filePath; // 添加文件路径字段

  TutorialArticle({
    required this.title,
    required this.description,
    required this.date,
    required this.image,
    required this.category,
    required this.readTime,
    required this.author,
    this.content,
    required this.filePath,
  });
}
