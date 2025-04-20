import 'package:flutter/material.dart';
import '../widget_demo.dart';

class BottomSheetWidgetDemo extends WidgetDemo {
  BottomSheetWidgetDemo()
    : super(
        name: 'BottomSheet',
        description: 'BottomSheet 是一个从屏幕底部向上滑出的面板，可以用于显示更多选项或内容。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''// 模态底部菜单
showModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,                // 背景颜色
  double? elevation,                     // 阴影高度
  ShapeBorder? shape,                    // 形状
  bool isScrollControlled = false,       // 是否可以全屏展示
  // 其他参数...
})

// 持久性底部菜单
showBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,                // 背景颜色
  double? elevation,                     // 阴影高度
  ShapeBorder? shape,                    // 形状
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基本模态底部菜单',
            code: r'''
showModalBottomSheet<void>(
  context: context,
  builder: (BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('这是一个基本的模态底部菜单'),
            ElevatedButton(
              child: const Text('关闭'),
              onPressed: () => Navigator.pop(context),
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
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('这是一个基本的模态底部菜单'),
                              ElevatedButton(
                                child: const Text('关闭'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示基本底部菜单'),
            ),
          ),

          DemoItem(
            description: '带圆角的底部菜单',
            code: r'''
showModalBottomSheet<void>(
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          Text(
            '选择付款方式',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.credit_card, color: Colors.blue),
            title: Text('信用卡'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pop(context),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance, color: Colors.green),
            title: Text('银行卡'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pop(context),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.orange),
            title: Text('电子钱包'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        height: 300,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 40,
                                height: 5,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2.5),
                                ),
                              ),
                            ),
                            const Text(
                              '选择付款方式',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ListTile(
                              leading: const Icon(
                                Icons.credit_card,
                                color: Colors.blue,
                              ),
                              title: const Text('信用卡'),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () => Navigator.pop(context),
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(
                                Icons.account_balance,
                                color: Colors.green,
                              ),
                              title: const Text('银行卡'),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () => Navigator.pop(context),
                            ),
                            const Divider(),
                            ListTile(
                              leading: const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.orange,
                              ),
                              title: const Text('电子钱包'),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示带圆角的底部菜单'),
            ),
          ),

          DemoItem(
            description: '可拖动的底部菜单',
            code: r'''
showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  builder: (BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,  // 初始高度为屏幕的一半
      minChildSize: 0.25,     // 最小高度为屏幕的四分之一
      maxChildSize: 0.9,      // 最大高度为屏幕的90%
      builder: (context, scrollController) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('选项 $index'),
                onTap: () => Navigator.pop(context),
              );
            },
          ),
        );
      },
    );
  },
);''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.5,
                        minChildSize: 0.25,
                        maxChildSize: 0.9,
                        builder: (context, scrollController) {
                          return Container(
                            color: Colors.white,
                            child: ListView.builder(
                              controller: scrollController,
                              itemCount: 25,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('选项 $index'),
                                  onTap: () => Navigator.pop(context),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
              child: const Text('显示可拖动的底部菜单'),
            ),
          ),

          DemoItem(
            description: '自定义底部菜单',
            code: r'''
showModalBottomSheet<void>(
  context: context,
  backgroundColor: Colors.transparent,
  builder: (BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.share, color: Colors.blue),
                ),
                SizedBox(width: 16),
                Text(
                  '分享',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ShareOption(icon: Icons.message, label: '短信'),
                ShareOption(icon: Icons.email, label: '邮件'),
                ShareOption(icon: Icons.chat, label: '聊天'),
                ShareOption(icon: Icons.more_horiz, label: '更多'),
              ],
            ),
          ),
          Divider(),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('取消', style: TextStyle(color: Colors.red)),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              minimumSize: Size(double.infinity, 0),
            ),
          ),
        ],
      ),
    );
  },
);

// 自定义分享选项组件
class ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const ShareOption({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}''',
            demo: ElevatedButton(
              onPressed: () {
                final context = WidgetDemo.navigatorKey.currentContext;
                if (context != null) {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Text(
                                    '分享',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _ShareOption(
                                    icon: Icons.message,
                                    label: '短信',
                                  ),
                                  _ShareOption(icon: Icons.email, label: '邮件'),
                                  _ShareOption(icon: Icons.chat, label: '聊天'),
                                  _ShareOption(
                                    icon: Icons.more_horiz,
                                    label: '更多',
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                minimumSize: const Size(double.infinity, 0),
                              ),
                              child: const Text(
                                '取消',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('显示自定义底部菜单'),
            ),
          ),
        ],
        icon: Icons.arrow_upward,
        color: Colors.teal,
      );
}

// Helper class for the demo
class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ShareOption({Key? key, required this.icon, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
