import 'package:flutter/material.dart';
import '../widget_demo.dart';

class DialogWidgetDemo extends WidgetDemo {
  DialogWidgetDemo()
    : super(
        name: 'Dialog',
        description: 'Dialog 是一个显示在当前页面上方的浮动弹出框，通常用于展示重要信息或请求用户输入。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''Dialog({
  Key? key,
  Color? backgroundColor,               // 背景颜色
  double? elevation,                    // 阴影高度
  EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0), // 内部边距
  Clip clipBehavior = Clip.none,        // 裁剪行为
  ShapeBorder? shape,                   // 形状
  AlignmentGeometry? alignment,         // 对齐方式
  Widget? child,                        // 子组件
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基本对话框',
            code: r'''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '这是一个基本对话框',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('关闭'),
            ),
          ],
        ),
      ),
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '这是一个基本对话框',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('关闭'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示基本对话框'),
            ),
          ),

          DemoItem(
            description: '自定义形状对话框',
            code: r'''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 16,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60,
            ),
            SizedBox(height: 20),
            Text(
              '操作成功!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('确定'),
            ),
          ],
        ),
      ),
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 16,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 220,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 60,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                '操作成功!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('确定'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示自定义形状对话框'),
            ),
          ),

          DemoItem(
            description: '全屏对话框',
            code: r'''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text('全屏对话框'),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('这是一个全屏对话框示例'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('关闭对话框'),
              ),
            ],
          ),
        ),
      ),
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog.fullscreen(
                        child: Scaffold(
                          appBar: AppBar(
                            title: const Text('全屏对话框'),
                            leading: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('这是一个全屏对话框示例'),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('关闭对话框'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示全屏对话框'),
            ),
          ),

          DemoItem(
            description: '自定义内容对话框',
            code: r'''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(16),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue[100],
              child: Icon(
                Icons.notifications,
                size: 40,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '新消息提醒',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '您有一条新的消息，是否立即查看？',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Divider(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('稍后', style: TextStyle(color: Colors.grey)),
                  ),
                ),
                VerticalDivider(width: 1),
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('查看', style: TextStyle(color: Colors.blue)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 300,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.blue[100],
                                child: const Icon(
                                  Icons.notifications,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '新消息提醒',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '您有一条新的消息，是否立即查看？',
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              const Divider(height: 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed:
                                          () => Navigator.of(context).pop(),
                                      child: const Text(
                                        '稍后',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(width: 1),
                                  Expanded(
                                    child: TextButton(
                                      onPressed:
                                          () => Navigator.of(context).pop(),
                                      child: const Text(
                                        '查看',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示自定义内容对话框'),
            ),
          ),
        ],
        icon: Icons.chat_bubble_outline,
        color: Colors.blue,
      );
}
