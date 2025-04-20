import 'package:flutter/material.dart';
import '../widget_demo.dart';

class TooltipWidgetDemo extends WidgetDemo {
  TooltipWidgetDemo()
    : super(
        name: 'Tooltip',
        description: 'Tooltip 是一个气泡提示组件，当用户长按或悬停在目标组件上时显示简短的帮助文本。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''const Tooltip({
  Key? key,
  required String message,                // 提示消息
  double? height,                         // 高度
  EdgeInsetsGeometry? padding,            // 内边距
  EdgeInsetsGeometry? margin,             // 外边距
  double? verticalOffset,                 // 垂直偏移
  bool? preferBelow,                      // 是否优先显示在下方
  bool? excludeFromSemantics,             // 是否从语义树中排除
  Decoration? decoration,                 // 装饰
  TextStyle? textStyle,                   // 文本样式
  Duration? waitDuration,                 // 等待时间
  Duration? showDuration,                 // 显示时间
  TooltipTriggerMode? triggerMode,        // 触发模式
  bool? enableFeedback,                   // 是否启用反馈
  Widget? child,                          // 子组件
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基本用法',
            code: r'''
Tooltip(
  message: '这是一个按钮',
  child: ElevatedButton(
    onPressed: () {},
    child: Text('长按显示提示'),
  ),
)''',
            demo: const Tooltip(
              message: '这是一个按钮',
              child: ElevatedButton(onPressed: null, child: Text('长按显示提示')),
            ),
          ),

          DemoItem(
            description: '自定义Tooltip样式',
            code: r'''
Tooltip(
  message: '自定义样式的提示信息',
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ),
  textStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  padding: EdgeInsets.all(10),
  preferBelow: false,
  verticalOffset: 20,
  waitDuration: Duration(milliseconds: 500),
  showDuration: Duration(seconds: 2),
  child: Icon(
    Icons.info,
    size: 30,
    color: Colors.blue,
  ),
)''',
            demo: Tooltip(
              message: '自定义样式的提示信息',
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              padding: const EdgeInsets.all(10),
              preferBelow: false,
              verticalOffset: 20,
              waitDuration: const Duration(milliseconds: 500),
              showDuration: const Duration(seconds: 2),
              child: const Icon(Icons.info, size: 30, color: Colors.blue),
            ),
          ),

          DemoItem(
            description: '不同触发模式的Tooltip',
            code: r'''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Column(
      children: [
        Tooltip(
          message: '长按显示',
          triggerMode: TooltipTriggerMode.longPress,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('长按'),
          ),
        ),
        SizedBox(height: 4),
        Text('长按'),
      ],
    ),
    Column(
      children: [
        Tooltip(
          message: '点击显示',
          triggerMode: TooltipTriggerMode.tap,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('点击'),
          ),
        ),
        SizedBox(height: 4),
        Text('点击'),
      ],
    ),
    Column(
      children: [
        Tooltip(
          message: '悬停时显示',
          triggerMode: TooltipTriggerMode.manual,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('悬停'),
          ),
        ),
        SizedBox(height: 4),
        Text('悬停'),
      ],
    ),
  ],
)''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Tooltip(
                      message: '长按显示',
                      triggerMode: TooltipTriggerMode.longPress,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('长按'),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('长按'),
                  ],
                ),
                Column(
                  children: [
                    Tooltip(
                      message: '点击显示',
                      triggerMode: TooltipTriggerMode.tap,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('点击'),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('点击'),
                  ],
                ),
                Column(
                  children: [
                    Tooltip(
                      message: '悬停时显示',
                      // 注：在移动设备上，manual 实际上等同于 longPress
                      // 在桌面设备上才表现为悬停
                      triggerMode: TooltipTriggerMode.manual,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('悬停'),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text('悬停'),
                  ],
                ),
              ],
            ),
          ),

          DemoItem(
            description: '在表单中使用Tooltip',
            code: r'''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Text('姓名'),
        SizedBox(width: 8),
        Tooltip(
          message: '请输入您的真实姓名',
          child: Icon(Icons.help_outline, size: 16),
        ),
      ],
    ),
    TextField(
      decoration: InputDecoration(
        hintText: '请输入姓名',
      ),
    ),
    SizedBox(height: 16),
    Row(
      children: [
        Text('密码'),
        SizedBox(width: 8),
        Tooltip(
          message: '密码长度至少为8位，包含大小写字母和数字',
          child: Icon(Icons.help_outline, size: 16),
        ),
      ],
    ),
    TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: '请输入密码',
      ),
    ),
  ],
)''',
            demo: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('姓名'),
                      const SizedBox(width: 8),
                      Tooltip(
                        message: '请输入您的真实姓名',
                        child: Icon(Icons.help_outline, size: 16),
                      ),
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(hintText: '请输入姓名'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text('密码'),
                      const SizedBox(width: 8),
                      Tooltip(
                        message: '密码长度至少为8位，包含大小写字母和数字',
                        child: Icon(Icons.help_outline, size: 16),
                      ),
                    ],
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: '请输入密码'),
                  ),
                ],
              ),
            ),
          ),
        ],
        icon: Icons.info_outline,
        color: Colors.green,
      );
}
