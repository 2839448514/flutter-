import 'package:flutter/material.dart';
import '../widget_demo.dart';

class TextFieldWidgetDemo extends WidgetDemo {
  TextFieldWidgetDemo()
    : super(
        name: 'TextField',
        description: 'TextField 是一个允许用户使用键盘输入文本的组件。可以自定义外观、验证规则和各种行为。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: r'''TextField({
  Key? key,
  TextEditingController? controller,          // 控制器，用于获取/设置文本内容
  FocusNode? focusNode,                       // 焦点节点，用于控制焦点
  InputDecoration? decoration,                // 装饰，定义外观
  TextInputType? keyboardType,                // 键盘类型
  TextInputAction? textInputAction,           // 键盘动作按钮类型
  TextStyle? style,                           // 文本样式
  TextDirection? textDirection,               // 文本方向
  TextAlign textAlign = TextAlign.start,      // 文本对齐方式
  bool autofocus = false,                     // 自动获取焦点
  bool obscureText = false,                   // 是否隐藏文本（密码模式）
  int? maxLines = 1,                          // 最大行数
  int? minLines,                              // 最小行数
  bool expands = false,                       // 是否扩展填充父容器
  int? maxLength,                             // 最大输入长度
  ValueChanged<String>? onChanged,            // 文本变化回调
  VoidCallback? onEditingComplete,            // 编辑完成回调
  ValueChanged<String>? onSubmitted,          // 提交回调
  List<TextInputFormatter>? inputFormatters,  // 输入格式化器
  bool? enabled,                              // 是否启用
  // 其他参数...
})''')],
        examples: [
          DemoItem(
            description: '基础文本输入框',
            code: r'''
TextField(
  decoration: InputDecoration(
    labelText: '用户名',
    hintText: '请输入用户名',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
)''',
            demo: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '请输入用户名',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),

          DemoItem(
            description: '密码输入框',
            code: r'''
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
            demo: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
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
          ),

          DemoItem(
            description: '带验证的输入框',
            code: r'''
// 状态管理代码略，这里只展示 TextField 部分
TextField(
  decoration: InputDecoration(
    labelText: '电子邮箱',
    hintText: '请输入有效的邮箱地址',
    prefixIcon: Icon(Icons.email),
    errorText: _isValidEmail ? null : '请输入有效的邮箱地址',
    border: OutlineInputBorder(),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
  ),
  keyboardType: TextInputType.emailAddress,
  onChanged: (value) {
    // 验证邮箱格式
    setState(() {
      _isValidEmail = value.contains('@') && value.contains('.');
    });
  },
)''',
            demo: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                bool isValidEmail = true;

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '电子邮箱',
                      hintText: '请输入有效的邮箱地址',
                      prefixIcon: const Icon(Icons.email),
                      errorText: isValidEmail ? null : '请输入有效的邮箱地址',
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      // 验证邮箱格式
                      setState(() {
                        isValidEmail =
                            value.isEmpty ||
                            (value.contains('@') && value.contains('.'));
                      });
                    },
                  ),
                );
              },
            ),
          ),

          DemoItem(
            description: '数字输入框',
            code: r'''
TextField(
  decoration: InputDecoration(
    labelText: '年龄',
    hintText: '请输入您的年龄',
    border: OutlineInputBorder(),
  ),
  keyboardType: TextInputType.number,
)''',
            demo: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '年龄',
                  hintText: '请输入您的年龄',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),

          DemoItem(
            description: '多行文本输入',
            code: r'''
TextField(
  decoration: InputDecoration(
    labelText: '描述',
    hintText: '请输入描述信息',
    border: OutlineInputBorder(),
    alignLabelWithHint: true, // 让 label 和 hint 顶部对齐
  ),
  maxLines: 3,
)''',
            demo: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '描述',
                  hintText: '请输入描述信息',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true, // 让 label 和 hint 顶部对齐
                ),
                maxLines: 3,
              ),
            ),
          ),

          DemoItem(
            description: '带计数器的输入框',
            code: r'''
TextField(
  decoration: InputDecoration(
    labelText: '留言',
    hintText: '请输入留言内容',
    border: OutlineInputBorder(),
    counterText: '0/50 个字符',
  ),
  maxLength: 50,
)''',
            demo: const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '留言',
                  hintText: '请输入留言内容',
                  border: OutlineInputBorder(),
                ),
                maxLength: 50,
              ),
            ),
          ),

          DemoItem(
            description: '不同样式的输入框',
            code: r'''
Column(
  children: [
    TextField(
      decoration: InputDecoration(
        labelText: '默认边框',
        hintText: '带有默认边框',
        border: OutlineInputBorder(),
      ),
    ),
    SizedBox(height: 16),
    TextField(
      decoration: InputDecoration(
        labelText: '填充样式',
        hintText: '带有填充背景',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    SizedBox(height: 16),
    TextField(
      decoration: InputDecoration(
        labelText: '无边框样式',
        hintText: '底部线条样式',
        border: UnderlineInputBorder(),
      ),
    ),
    SizedBox(height: 16),
    TextField(
      decoration: InputDecoration(
        labelText: '圆角样式',
        hintText: '带有圆角边框',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    ),
  ],
)''',
            demo: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: '默认边框',
                      hintText: '带有默认边框',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '填充样式',
                      hintText: '带有填充背景',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: '无边框样式',
                      hintText: '底部线条样式',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '圆角样式',
                      hintText: '带有圆角边框',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        icon: Icons.text_fields,
        color: Colors.purple,
      );
}
