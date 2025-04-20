import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ChipWidgetDemo extends WidgetDemo {
  ChipWidgetDemo()
      : super(
    name: 'Chip',
    description:
    'Chip 组件用于展示简短的信息，通常用于选择、过滤或操作。它可以包含文本、图标等元素，并且可以设置不同的样式和交互行为。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''
Chip({
  Key? key, // 用于标识组件的唯一标识符
  Widget? avatar, // 显示在标签前面的图标或头像，通常用于展示小图标
  required this.label, // 标签内容，通常是 Text 组件或其他自定义内容
  this.labelStyle, // 标签文字样式，如字体、颜色等
  this.labelPadding = EdgeInsets.zero, // 标签内容的内边距，默认为无内边距
  this.backgroundColor, // 标签背景颜色
  this.deleteIconColor, // 删除图标的颜色
  this.deleteButtonTooltipMessage, // 删除按钮的提示信息
  this.shadowColor, // 阴影颜色
  this.shape, // 标签的形状，例如圆角矩形等
  this.elevation, // 阴影的高度，控制标签的浮动效果
  this.onDeleted, // 删除按钮的回调函数，点击删除时触发
  this.deleteIcon = Icons.cancel, // 删除图标，默认为取消图标
})
''')],
    examples: [
      DemoItem(
        description: '基础按钮样式',
        code: '''
ElevatedButton(
  onPressed: () {},
  child: Text('Elevated Button'),
)
''',
        demo: ElevatedButton(
          onPressed: () {},
          child: const Text('Elevated Button'),
        ),
      ),
      DemoItem(
        description: '文本按钮',
        code: '''
TextButton(
  onPressed: () {},
  child: Text('Text Button'),
)''',
        demo: TextButton(
          onPressed: () {},
          child: const Text('Text Button'),
        ),
      ),
      DemoItem(
        description: '轮廓按钮',
        code: '''
OutlinedButton(
  onPressed: () {},
  child: Text('Outlined Button'),
)''',
        demo: OutlinedButton(
          onPressed: () {},
          child: const Text('Outlined Button'),
        ),
      ),
    ],
    icon: Icons.smart_button,
    color: Colors.red,
  );
}
