import 'package:flutter/material.dart';
import '../widget_demo.dart';

class TextWidgetDemo extends WidgetDemo {
  TextWidgetDemo()
    : super(
        name: 'Text',
        description: 'Text 组件是 Flutter 中最基础的文本显示组件。',

    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''
// Text 组件用于显示文本
Text(
  String data, // 需要显示的文本内容
  {Key? key, // 唯一标识
  TextStyle? style, // 文本样式，如字体大小、颜色、粗细等
  StrutStyle? strutStyle, // 控制文本行的高度
  TextAlign? textAlign, // 文本对齐方式
  TextDirection? textDirection, // 文字方向（LTR / RTL）
  Locale? locale, // 语言环境
  bool? softWrap, // 是否允许自动换行
  TextOverflow? overflow, // 溢出时的处理方式，如省略号
  double? textScaleFactor, // 文字缩放比例
  int? maxLines, // 最大行数
  String? semanticsLabel, // 语义标签，辅助无障碍功能
  TextWidthBasis? textWidthBasis, // 计算宽度的基准
  TextHeightBehavior? textHeightBehavior, // 控制文本的高度行为
})
''')],

        examples: [
          DemoItem(
            description: '基础用法',
            code: '''
Text('Hello Flutter')
''',
            demo: const Text('Hello Flutter'),
            parameter: 'data[String]:需要显示的文本内容',
          ),
          DemoItem(
            description: '改变样式',
            code: '''
Text(
  'Hello, Flutter!',
  style: TextStyle(
    color: Colors.blue, // 文字颜色
    fontSize: 20, // 字体大小
    fontWeight: FontWeight.bold, // 字体加粗
    fontStyle: FontStyle.italic, // 斜体
    letterSpacing: 2.0, // 字符间距
    wordSpacing: 4.0, // 单词间距
    decoration: TextDecoration.underline, // 下划线
    decorationColor: Colors.red, // 下划线颜色
    decorationStyle: TextDecorationStyle.dashed, // 虚线下划线
  ),
)
''',
            parameter: '''
color[Color]: 文字颜色，默认继承主题色
fontSize[double]: 字体大小，默认 14
fontWeight[FontWeight]: 字体粗细，默认正常
fontStyle[FontStyle]: 文字样式（正常/斜体），默认 FontStyle.normal
letterSpacing[double]: 字符间距，默认无
wordSpacing[double]: 单词间距，默认无
decoration[TextDecoration]: 文本装饰（下划线、删除线等），默认无
decorationColor[Color]: 文本装饰颜色，默认无
decorationStyle[TextDecorationStyle]: 文本装饰样式（如虚线），默认实线
''',
            demo: const Text(
              'Hello, Flutter!',
              style: TextStyle(
                color: Colors.blue,
                // 文字颜色
                fontSize: 20,
                // 字体大小
                fontWeight: FontWeight.bold,
                // 字体加粗
                fontStyle: FontStyle.italic,
                // 斜体
                letterSpacing: 2.0,
                // 字符间距
                wordSpacing: 4.0,
                // 单词间距
                decoration: TextDecoration.underline,
                // 下划线
                decorationColor: Colors.red,
                // 下划线颜色
                decorationStyle: TextDecorationStyle.dashed, // 虚线下划线
              ),
            ),
          ),
          DemoItem(
            description: '文本行的高度',
            code: '''
Text(
  'Hello, Flutter!',
  style: TextStyle(
    fontSize: 20, // 字体大小
    height: 2.0, // 行高
  ),
  strutStyle: StrutStyle(
    fontSize: 20, // 影响行高计算
    height: 2.0, // 行高
    leading: 0.5, // 额外行高（0.5 表示增加 50% 的行间距）
  ),
),
''',
            demo: Text(
              '你好，Flutter！我们正在学习文本组件的使用。这是一个示例文本，用于演示如何设置文本的行高和样式。',
              style: TextStyle(fontSize: 20, height: 2.0),
              strutStyle: StrutStyle(
                fontSize: 20,
                height: 2.0,
                leading: 0.5, // 这里直接用 double 值
              ),
            ),
            parameter: '''
fontSize[double]: 字体大小，影响文本高度
height[double]: 行高倍数，默认 1.0
strutStyle[StrutStyle]: 用于自定义行高的精确控制
leading[double]: 额外行高，值越大行距越宽
''',
          ),

          DemoItem(
            description: '文本对齐方式',
            code: '''
Container(
  width: double.infinity, // 设置宽度占满父容器
  color: Colors.grey[100], // 添加背景色以显示边界
  child: Text(
    'Left Align Text',
    textAlign: TextAlign.left, // 左对齐
  ),
),
SizedBox(height: 8),
Container(
  width: double.infinity, // 设置宽度占满父容器
  color: Colors.grey[100], // 添加背景色以显示边界
  child: Text(
    'Center Align Text',
    textAlign: TextAlign.center, // 居中对齐
  ),
),
SizedBox(height: 8),
Container(
  width: double.infinity, // 设置宽度占满父容器
  color: Colors.grey[100], // 添加背景色以显示边界
  child: Text(
    'Right Align Text',
    textAlign: TextAlign.right, // 右对齐
  ),
),''',
            demo: Column(
              children: [
                Container(
                  width: double.infinity, // 设置宽度占满父容器
                  color: Colors.grey[100], // 添加背景色以显示边界
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Left Align Text',
                    textAlign: TextAlign.left, // 左对齐
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity, // 设置宽度占满父容器
                  color: Colors.grey[100], // 添加背景色以显示边界
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Center Align Text',
                    textAlign: TextAlign.center, // 居中对齐
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity, // 设置宽度占满父容器
                  color: Colors.grey[100], // 添加背景色以显示边界
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Right Align Text',
                    textAlign: TextAlign.right, // 右对齐
                  ),
                ),
              ],
            ),
            parameter: '''
textAlign [TextAlign]: 文本的对齐方式，常见取值：
TextAlign.left: 左对齐
TextAlign.center: 居中对齐
TextAlign.right: 右对齐
TextAlign.justify: 两端对齐
TextAlign.start: 根据文本方向开始对齐
TextAlign.end: 根据文本方向结束对齐

注意: 只有当文本所处容器宽度大于文本内容宽度时，textAlign 属性的效果才明显。
''',
          ),

          DemoItem(
            description: '文字方向',
            code: '''
// 阿拉伯语示例 (RTL文本)
Container(
  width: double.infinity,
  padding: EdgeInsets.all(8),
  color: Colors.grey[100],
  child: Text(
    'مرحبا بالعالم', // 阿拉伯语: "Hello World"
    textDirection: TextDirection.rtl, // 从右到左
    style: TextStyle(fontSize: 18),
  ),
),
SizedBox(height: 8),

// 混合文本方向示例
Container(
  width: double.infinity,
  padding: EdgeInsets.all(8),
  color: Colors.grey[100],
  child: Text(
    'English text مع نص عربي', // 英语和阿拉伯语混合
    textDirection: TextDirection.ltr, // 从左到右的基本方向
    style: TextStyle(fontSize: 18),
  ),
),
SizedBox(height: 8),

// 相同混合文本，但基本方向不同
Container(
  width: double.infinity,
  padding: EdgeInsets.all(8),
  color: Colors.grey[100],
  child: Text(
    'English text مع نص عربي', // 英语和阿拉伯语混合
    textDirection: TextDirection.rtl, // 从右到左的基本方向
    style: TextStyle(fontSize: 18),
  ),
),''',
            demo: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[100],
                  child: const Text(
                    'مرحبا بالعالم', // 阿拉伯语: "Hello World"
                    textDirection: TextDirection.rtl, // 从右到左
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[100],
                  child: const Text(
                    'English text مع نص عربي', // 英语和阿拉伯语混合
                    textDirection: TextDirection.ltr, // 从左到右的基本方向
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[100],
                  child: const Text(
                    'English text مع نص عربي', // 英语和阿拉伯语混合
                    textDirection: TextDirection.rtl, // 从右到左的基本方向
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                // 添加一个中英混合示例，以展示对比
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[100],
                  child: const Text(
                    '中文和English混合',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            parameter: '''
textDirection [TextDirection]: 文本的方向，常见取值：
TextDirection.ltr: 从左到右 (拉丁文、中文等)
TextDirection.rtl: 从右到左 (阿拉伯文、希伯来文等)

注意:
1. 对于纯英文或中文，文字方向变化不明显
2. 对于阿拉伯语、希伯来语等RTL语言，或混合语言文本，方向设置很重要
3. 在国际化应用中，应根据语言自动设置适当的文字方向
''',
          ),

          // 添加文本溢出处理示例
          DemoItem(
            description: '文本溢出处理',
            code: '''
Container(
  width: 150, // 限制宽度
  color: Colors.grey[100],
  child: Text(
    '这是一段很长的文本，演示溢出省略号效果',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
  ),
),
SizedBox(height: 10),
Container(
  width: 150, // 限制宽度
  color: Colors.grey[100],
  child: Text(
    '这是一段很长的文本，演示溢出剪裁效果',
    overflow: TextOverflow.clip,
    maxLines: 1,
  ),
),
SizedBox(height: 10),
Container(
  width: 150, // 限制宽度
  color: Colors.grey[100],
  child: Text(
    '这是一段很长的文本，演示溢出淡出效果',
    overflow: TextOverflow.fade,
    maxLines: 1,
  ),
),''',
            demo: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150, // 限制宽度
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(4),
                  child: const Text(
                    '这是一段很长的文本，演示溢出省略号效果',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 150, // 限制宽度
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(4),
                  child: const Text(
                    '这是一段很长的文本，演示溢出剪裁效果',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 150, // 限制宽度
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(4),
                  child: const Text(
                    '这是一段很长的文本，演示溢出淡出效果',
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            parameter: '''
overflow [TextOverflow]: 文本溢出时的处理方式:
TextOverflow.ellipsis: 显示省略号(最常用)
TextOverflow.clip: 直接裁剪
TextOverflow.fade: 淡出效果
TextOverflow.visible: 可见(超出边界)

maxLines [int]: 最大显示行数，超过则触发溢出处理
softWrap [bool]: 是否自动换行，默认为true
''',
          ),
          DemoItem(
            description: '自动换行',
            code: '''
Text(
  '这是一段很长的文本，演示自动换行效果。'
  '这是一段很长的文本，演示自动换行效果。',
  style: TextStyle(fontSize: 20),
  softWrap: true, // 是否自动换行
  maxLines: 2, // 最大行数
  overflow: TextOverflow.ellipsis, // 溢出处理，使用省略号
  textAlign: TextAlign.start, // 文本对齐方式
  textDirection: TextDirection.ltr, // 文本方向
)
''',
            demo: const Text(
              '这是一段很长的文本，演示自动换行效果。'
              '这是一段很长的文本，演示自动换行效果。',
              style: TextStyle(fontSize: 20),
              softWrap: true,
              // 是否自动换行
              maxLines: 2,
              // 最大行数
              overflow: TextOverflow.ellipsis,
              // 溢出处理，使用省略号
              textAlign: TextAlign.start, // 文本对齐方式
            ),
            parameter: '''
softWrap [bool]: 是否自动换行，默认值是 true
maxLines [int]: 最大行数，超过此行数的文本将被截断
''',
          ),
        ],
        icon: Icons.text_fields,
        color: Colors.orange,
      );
}
