import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ButtonWidgetDemo extends WidgetDemo {
  ButtonWidgetDemo()
    : super(
        name: 'Button',
        description:
            'Flutter 提供了多种按钮组件，包括 ElevatedButton、TextButton、OutlinedButton 等，用于处理用户点击交互。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: '''
ElevatedButton({
  Key? key, // 按钮的唯一标识
  required VoidCallback? onPressed, // 按钮点击时触发的回调函数
  VoidCallback? onLongPress, // 按钮长按时触发的回调函数
  ButtonStyle? style, // 按钮的样式，例如颜色、形状等
  FocusNode? focusNode, // 按钮的焦点管理
  bool autofocus = false, // 是否自动获取焦点
  Clip clipBehavior = Clip.none, // 按钮的剪裁行为
  required Widget child, // 按钮的子组件，通常是文本或图标
})
''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基础按钮样式',
            code: '''
ElevatedButton(
  onPressed: () {},
  child: Text('Elevated Button'),
)''',
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
