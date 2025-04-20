import 'package:flutter/material.dart';
import '../widget_demo.dart';

class AlertDialogWidgetDemo extends WidgetDemo {
  AlertDialogWidgetDemo()
    : super(
        name: 'AlertDialog',
        description: 'AlertDialog 是一种标准的对话框，用于显示紧急信息、简单选择或需要用户确认的操作。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''AlertDialog({
  Key? key,
  Widget? icon,                              // 图标
  EdgeInsetsGeometry? iconPadding,           // 图标内边距
  Color? iconColor,                          // 图标颜色
  Widget? title,                             // 标题
  EdgeInsetsGeometry? titlePadding,          // 标题内边距
  TextStyle? titleTextStyle,                 // 标题文本样式
  Widget? content,                           // 内容
  EdgeInsetsGeometry? contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), // 内容内边距
  TextStyle? contentTextStyle,               // 内容文本样式
  List<Widget>? actions,                     // 操作按钮列表
  EdgeInsetsGeometry? actionsPadding,        // 操作区域内边距
  MainAxisAlignment? actionsAlignment,       // 操作按钮对齐方式
  OverflowBarAlignment? actionsOverflowAlignment, // 操作按钮溢出对齐方式
  VerticalDirection? actionsOverflowDirection,  // 操作按钮溢出方向
  double? actionsOverflowButtonSpacing,      // 操作按钮溢出间距
  EdgeInsetsGeometry? buttonPadding,         // 按钮内边距
  Color? backgroundColor,                    // 背景颜色
  double? elevation,                         // 阴影高度
  Color? shadowColor,                        // 阴影颜色
  Color? surfaceTintColor,                   // 表面色调颜色
  EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0), // 内边距
  Clip clipBehavior = Clip.none,             // 裁剪行为
  ShapeBorder? shape,                        // 形状
  AlignmentGeometry? alignment,              // 对齐方式
  bool scrollable = false,                   // 是否可滚动
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基本确认对话框',
            code: r'''
showDialog<void>(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('确认删除'),
      content: Text('您确定要删除这个项目吗？此操作无法撤销。'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('取消'),
        ),
        TextButton(
          onPressed: () {
            // 执行删除操作
            Navigator.of(context).pop();
          },
          child: Text('删除'),
        ),
      ],
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('确认删除'),
                        content: const Text('您确定要删除这个项目吗？此操作无法撤销。'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('取消'),
                          ),
                          TextButton(
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop();
                            },
                            child: const Text('删除'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('显示确认对话框'),
            ),
          ),

          DemoItem(
            description: '带图标的警告对话框',
            code: r'''
showDialog<void>(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.warning, color: Colors.orange, size: 50),
      title: Text('警告'),
      content: Text('您的账号安全级别较低，建议立即修改密码。'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('以后再说'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('现在修改'),
        ),
      ],
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        icon: const Icon(
                          Icons.warning,
                          color: Colors.orange,
                          size: 50,
                        ),
                        title: const Text('警告'),
                        content: const Text('您的账号安全级别较低，建议立即修改密码。'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('以后再说'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('现在修改'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('显示警告对话框'),
            ),
          ),

          DemoItem(
            description: '带单选项的选择对话框',
            code: r'''
// 声明变量保存选择结果
String selectedOption = '选项A';

showDialog<void>(
  context: context,
  builder: (BuildContext context) {
    // 创建一个局部State用于对话框内的状态管理
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Text('选择一个选项'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text('选项A'),
                value: '选项A',
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('选项B'),
                value: '选项B',
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('选项C'),
                value: '选项C',
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // 使用选择的结果
                Navigator.of(context).pop();
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  String selectedOption = '选项A';

                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return AlertDialog(
                            title: const Text('选择一个选项'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RadioListTile<String>(
                                  title: const Text('选项A'),
                                  value: '选项A',
                                  groupValue: selectedOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('选项B'),
                                  value: '选项B',
                                  groupValue: selectedOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: const Text('选项C'),
                                  value: '选项C',
                                  groupValue: selectedOption,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('取消'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // 使用选择的结果
                                  Navigator.of(context).pop();
                                },
                                child: const Text('确定'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }
              },
              child: const Text('显示选择对话框'),
            ),
          ),

          DemoItem(
            description: '自定义样式的对话框',
            code: r'''
showDialog<void>(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text('自定义样式', style: TextStyle(color: Colors.purple)),
      titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Divider(color: Colors.purple[200]),
            SizedBox(height: 10),
            Text('这是一个具有自定义样式的对话框示例'),
            SizedBox(height: 10),
            Icon(
              Icons.palette,
              size: 50,
              color: Colors.purple[300],
            ),
          ],
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.purple),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('取消', style: TextStyle(color: Colors.purple)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('确定'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.purple[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: const Text(
                          '自定义样式',
                          style: TextStyle(color: Colors.purple),
                        ),
                        titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        content: SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              Divider(color: Colors.purple[200]),
                              const SizedBox(height: 10),
                              const Text('这是一个具有自定义样式的对话框示例'),
                              const SizedBox(height: 10),
                              Icon(
                                Icons.palette,
                                size: 50,
                                color: Colors.purple[300],
                              ),
                            ],
                          ),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(
                          16,
                          10,
                          16,
                          10,
                        ),
                        actions: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.purple),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              '取消',
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('确定'),
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actionsPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示自定义样式对话框'),
            ),
          ),
        ],
        icon: Icons.help_outline,
        color: Colors.orange,
      );
}
