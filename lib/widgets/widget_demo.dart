import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 导入用于复制到剪贴板功能

// 定义单个示例的数据结构
class DemoItem {
  final String code;
  final Widget demo;
  final String? description;
  final String? parameter;

  const DemoItem({
    required this.code,
    required this.demo,
    this.description,
    this.parameter,
  });
}

// 新增：定义单个构造函数的数据结构，与 DemoItem 保持一致的设计
class ConstructorItem {
  final String code;
  final String name;
  final String? description;

  const ConstructorItem({
    required this.code,
    required this.name,
    this.description,
  });
}

// 修改 WidgetDemo 类
class WidgetDemo {
  // 添加全局NavigatorKey，用于在没有上下文的情况下访问Navigator
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  final String name;
  final String description;
  final List<DemoItem> examples;
  final IconData icon;
  final Color color;
  // final String? constructor;
  
  // 添加多个构造函数支持，改为与 examples 一致的 List 结构
  final List<ConstructorItem>? constructors;

  final String? parameter;

  const WidgetDemo({
    required this.name,
    required this.description,
    this.parameter,
    required this.examples,
    required this.icon,
    required this.color,
    this.constructors,
  });

  // 构建组件详情页面
  Widget buildDetailPage() {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 组件说明部分
          const Text(
            '组件说明',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(description),
          const SizedBox(height: 16),

          // 构造函数部分 - 支持多个构造函数
          const Text(
            '构造函数',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          // 如果有多个构造函数，使用新的展示方式
          if (constructors != null && constructors!.isNotEmpty)
            _ConstructorCard(constructors: constructors!, color: color),
          // else
          //   _SingleConstructorCard(constructor: constructor ?? '暂无构造函数信息', color: color),

          const SizedBox(height: 16),

          // 示例部分
          const Text(
            '示例',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...examples
              .map(
                (example) => _ExampleCard(example: example),
              ).toList(),
        ],
      ),
    );
  }
}

// 修改：单个构造函数卡片组件
class _SingleConstructorCard extends StatelessWidget {
  final String constructor;
  final Color color;

  const _SingleConstructorCard({required this.constructor, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 构造函数标题行
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '构造函数',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // 添加复制按钮
                IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: '复制构造函数代码',
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: constructor),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('构造函数代码已复制到剪贴板'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // 构造函数选择按钮 - 对单构造函数也显示一个按钮
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ChoiceChip(
              label: const Text('默认构造函数'),
              selected: true,
              onSelected: (_) {},
              selectedColor: color,
              labelStyle: const TextStyle(color: Colors.white),
            ),
          ),
          
          // 构造函数代码显示
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                constructor,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 修改：多构造函数卡片组件，使用 List<ConstructorItem>
class _ConstructorCard extends StatefulWidget {
  final List<ConstructorItem> constructors;
  final Color color;

  const _ConstructorCard({required this.constructors, required this.color});

  @override
  State<_ConstructorCard> createState() => _ConstructorCardState();
}

class _ConstructorCardState extends State<_ConstructorCard> {
  // 默认选中第一个构造函数
  late int selectedIndex;
  
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = widget.constructors[selectedIndex];
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 构造函数选择器标题行
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    '构造函数类型选择',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // 添加一个复制当前选中构造函数的按钮
                IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: '复制当前构造函数代码',
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: selectedItem.code),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('构造函数代码已复制到剪贴板'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // 构造函数选择按钮列表 - 使用 GridView
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180,  // 每个按钮最大宽度
                childAspectRatio: 4.0,    // 宽高比
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: widget.constructors.length,
              itemBuilder: (context, index) {
                final item = widget.constructors[index];
                final isSelected = index == selectedIndex;
                
                return ChoiceChip(
                  label: Text(item.name),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedIndex = index;
                      });
                    }
                  },
                  selectedColor: widget.color,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : null,
                  ),
                );
              },
            ),
          ),
          
          // 显示选中的构造函数代码
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                selectedItem.code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 新增示例卡片组件，用于管理代码区的显示状态
class _ExampleCard extends StatefulWidget {
  final DemoItem example;

  const _ExampleCard({required this.example});

  @override
  State<_ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<_ExampleCard> {
  // 控制代码区域是否显示的状态，默认设为 false 表示初始隐藏
  bool _showCode = false;  // 修改这里，改为 false 使代码区域默认隐藏

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题行，包含描述和控制按钮
          if (widget.example.description != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.example.description!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // 添加展开/收起代码区的按钮
                  IconButton(
                    icon: Icon(
                      _showCode ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                    ),
                    tooltip: _showCode ? '隐藏代码' : '显示代码',
                    onPressed: () {
                      setState(() {
                        _showCode = !_showCode;
                      });
                    },
                  ),
                ],
              ),
            ),
          
          // 可折叠的代码区域
          if (_showCode)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  widget.example.code,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            
          // 效果展示区域
          Container(
            padding: const EdgeInsets.all(16),
            child: Center(child: widget.example.demo),
          ),
          
          // 参数说明区域
          if (widget.example.parameter != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '参数说明',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.example.parameter!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
