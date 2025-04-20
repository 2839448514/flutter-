import 'package:flutter/material.dart';
import '../widget_demo.dart';

class TextFieldWidgetDemo extends WidgetDemo {
  TextFieldWidgetDemo()
      : super(
    name: 'TextField',
    description: 'TextField 组件用于接收用户输入的文本。它提供了丰富的自定义选项，如装饰、验证、输入类型等。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''
// TextField 组件用于接收用户输入的文本
TextField(
  {Key? key, // 唯一标识符
  TextInputType keyboardType = TextInputType.text, // 输入类型，例如 text、number 等
  TextEditingController? controller, // 控制器，用于控制输入框的文本内容
  FocusNode? focusNode, // 焦点节点
  TextCapitalization textCapitalization = TextCapitalization.none, // 控制输入框中文本的大小写
  bool obscureText = false, // 是否将输入的文本隐藏（适用于密码输入框）
  bool autocorrect = true, // 是否启用自动校正
  bool autofocus = false, // 是否在加载时自动获取焦点
  int? maxLines, // 最大行数
  int? maxLength, // 最大字符数
  TextInputAction textInputAction = TextInputAction.done, // 输入框的操作按钮（如“完成”）
  InputDecoration decoration = const InputDecoration(), // 装饰，包含标签、提示文本等
  TextStyle style, // 文本样式
  TextAlign textAlign = TextAlign.start, // 文本对齐方式
  TextAlignVertical? textAlignVertical, // 垂直方向的文本对齐方式
  bool? enabled, // 是否禁用输入框
  TextDirection? textDirection, // 文本方向
  TextInputFormatter? inputFormatters, // 输入格式化器
  int? cursorWidth, // 光标宽度
  Color? cursorColor, // 光标颜色
  TextHeightBehavior? textHeightBehavior, // 文本高度行为
})
''')],
    examples: [
      DemoItem(
        description: '基础文本输入框',
        code: '''
TextField(
  decoration: InputDecoration(
    labelText: '用户名',
    hintText: '请输入用户名',
  ),
)''',
        demo: const TextField(
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名',
          ),
        ),
      ),

      DemoItem(
        description: '带图标和边框的输入框',
        code: '''
TextField(
  decoration: InputDecoration(
    labelText: '搜索',
    hintText: '请输入搜索内容',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(),
  ),
)''',
        demo: const TextField(
          decoration: InputDecoration(
            labelText: '搜索',
            hintText: '请输入搜索内容',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
      ),

      DemoItem(
        description: '密码输入框',
        code: '''
TextField(
  obscureText: true,
  decoration: InputDecoration(
    labelText: '密码',
    hintText: '请输入密码',
    prefixIcon: Icon(Icons.lock),
    suffixIcon: Icon(Icons.visibility_off),
    border: OutlineInputBorder(),
  ),
)''',
        demo: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '请输入密码',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility_off),
            border: OutlineInputBorder(),
          ),
        ),
      ),

      DemoItem(
        description: '错误状态的输入框',
        code: '''
TextField(
  decoration: InputDecoration(
    labelText: '电子邮箱',
    hintText: '请输入电子邮箱',
    errorText: '请输入有效的电子邮箱地址',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
)''',
        demo: const TextField(
          decoration: InputDecoration(
            labelText: '电子邮箱',
            hintText: '请输入电子邮箱',
            errorText: '请输入有效的电子邮箱地址',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ],
    icon: Icons.edit,
    color: Colors.purple,
  );
}
