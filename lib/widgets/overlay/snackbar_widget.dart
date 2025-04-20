import 'package:flutter/material.dart';
import '../widget_demo.dart';

class SnackBarWidgetDemo extends WidgetDemo {
  SnackBarWidgetDemo()
    : super(
        name: 'SnackBar',
        description: 'SnackBar 是在屏幕底部显示的简短消息，用于提供关于应用程序操作的轻量级反馈。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''const SnackBar({
  Key? key,
  required Widget content,                 // 内容
  Color? backgroundColor,                  // 背景颜色
  double? elevation,                       // 阴影高度
  EdgeInsetsGeometry? margin,              // 外边距
  EdgeInsetsGeometry? padding,             // 内边距
  double? width,                           // 宽度
  ShapeBorder? shape,                      // 形状
  Duration duration = const Duration(milliseconds: 4000), // 持续时间
  Animation<double>? animation,            // 动画
  VoidCallback? onVisible,                 // 可见时回调
  SnackBarBehavior? behavior,              // 行为类型
  SnackBarAction? action,                  // 操作按钮
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基本用法',
            code: r'''
// 在小部件树中需要一个 ScaffoldMessenger
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('这是一个基本的SnackBar提示'),
  ),
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('这是一个基本的SnackBar提示')),
                  );
                }
              },
              child: const Text('显示基本SnackBar'),
            ),
          ),

          DemoItem(
            description: '带动作的SnackBar',
            code: r'''
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('您的文件已删除'),
    action: SnackBarAction(
      label: '撤销',
      onPressed: () {
        // 执行撤销操作
      },
    ),
  ),
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('您的文件已删除'),
                      action: SnackBarAction(
                        label: '撤销',
                        onPressed: () {
                          // 执行撤销操作
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('已撤销删除操作'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
              child: const Text('显示带动作的SnackBar'),
            ),
          ),

          DemoItem(
            description: '自定义SnackBar',
            code: r'''
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.info, color: Colors.white),
        SizedBox(width: 16),
        Expanded(child: Text('这是一条重要通知')),
      ],
    ),
    backgroundColor: Colors.indigo,
    duration: Duration(seconds: 5),
    behavior: SnackBarBehavior.floating, // 浮动样式
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
    action: SnackBarAction(
      label: '了解更多',
      textColor: Colors.white,
      onPressed: () {
        // 执行操作
      },
    ),
  ),
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(Icons.info, color: Colors.white),
                          const SizedBox(width: 16),
                          const Expanded(child: Text('这是一条重要通知')),
                        ],
                      ),
                      backgroundColor: Colors.indigo,
                      duration: const Duration(seconds: 5),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(10),
                      action: SnackBarAction(
                        label: '了解更多',
                        textColor: Colors.white,
                        onPressed: () {
                          // 执行操作
                        },
                      ),
                    ),
                  );
                }
              },
              child: const Text('显示自定义SnackBar'),
            ),
          ),

          DemoItem(
            description: '不同样式的SnackBar',
            code: r'''
// 成功提示
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 16),
        Text('操作已成功完成'),
      ],
    ),
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
  ),
);

// 警告提示
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.warning, color: Colors.white),
        SizedBox(width: 16),
        Text('请注意此操作存在风险'),
      ],
    ),
    backgroundColor: Colors.orange,
    behavior: SnackBarBehavior.floating,
  ),
);

// 错误提示
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.error, color: Colors.white),
        SizedBox(width: 16),
        Text('操作失败，请重试'),
      ],
    ),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  ),
);''',
            demo: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final context = WidgetDemo.navigatorKey.currentContext;
                    if (context != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 16),
                              const Text('操作已成功完成'),
                            ],
                          ),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('成功'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final context = WidgetDemo.navigatorKey.currentContext;
                    if (context != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.warning, color: Colors.white),
                              const SizedBox(width: 16),
                              const Text('请注意此操作存在风险'),
                            ],
                          ),
                          backgroundColor: Colors.orange,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('警告'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final context = WidgetDemo.navigatorKey.currentContext;
                    if (context != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Icon(Icons.error, color: Colors.white),
                              const SizedBox(width: 16),
                              const Text('操作失败，请重试'),
                            ],
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('错误'),
                ),
              ],
            ),
          ),
        ],
        icon: Icons.notification_important,
        color: Colors.blueGrey,
      );
}
