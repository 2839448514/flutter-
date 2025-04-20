import 'package:flutter/material.dart';
import '../widget_demo.dart';

class DrawerWidgetDemo extends WidgetDemo {
  DrawerWidgetDemo()
    : super(
        name: 'Drawer',
        description: 'Drawer 是一个从屏幕边缘水平滑入的面板，通常用于显示应用的导航菜单。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''Drawer({
  Key? key,
  Color? backgroundColor,              // 背景颜色
  double? elevation,                   // 阴影高度
  ShapeBorder? shape,                  // 形状
  double? width,                       // 宽度
  Widget? child,                       // 子组件
  String? semanticLabel,               // 语义标签
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基础抽屉菜单',
            code: r'''
Scaffold(
  appBar: AppBar(title: Text('Drawer示例')),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            '抽屉标题',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('主页'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('设置'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('帮助'),
          onTap: () {},
        ),
      ],
    ),
  ),
  body: Center(
    child: Text('滑动屏幕边缘或点击左上角图标打开抽屉'),
  ),
)''',
            demo: SizedBox(
              height: 400,
              child: Builder(
                builder:
                    (context) => Scaffold(
                      appBar: AppBar(title: const Text('Drawer示例')),
                      drawer: Drawer(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            const DrawerHeader(
                              decoration: BoxDecoration(color: Colors.blue),
                              child: Text(
                                '抽屉标题',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.home),
                              title: const Text('主页'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.settings),
                              title: const Text('设置'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.help),
                              title: const Text('帮助'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      body: const Center(child: Text('滑动屏幕边缘或点击左上角图标打开抽屉')),
                    ),
              ),
            ),
          ),

          DemoItem(
            description: '带用户信息的抽屉',
            code: r'''
Drawer(
  child: Column(
    children: [
      UserAccountsDrawerHeader(
        accountName: Text('张三'),
        accountEmail: Text('zhangsan@example.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
        otherAccountsPictures: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('李'),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('王'),
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.blueAccent,
        ),
      ),
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('收件箱'),
              trailing: Chip(
                label: Text('11'),
                backgroundColor: Colors.blue[100],
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('已加星标'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('已发送'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置与账户'),
              onTap: () {},
            ),
          ],
        ),
      ),
    ],
  ),
)''',
            demo: SizedBox(
              height: 500,
              width: 280, // 模拟抽屉宽度
              child: Drawer(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: const Text('张三'),
                      accountEmail: const Text('zhangsan@example.com'),
                      currentAccountPicture: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150',
                        ),
                      ),
                      otherAccountsPictures: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('李'),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('王'),
                        ),
                      ],
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.inbox),
                            title: const Text('收件箱'),
                            trailing: Chip(
                              label: const Text('11'),
                              backgroundColor: Colors.blue[100],
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.star),
                            title: const Text('已加星标'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.send),
                            title: const Text('已发送'),
                            onTap: () {},
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: const Text('设置与账户'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          DemoItem(
            description: '自定义样式的抽屉',
            code: r'''
Drawer(
  width: 280,
  elevation: 16.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
  ),
  child: Container(
    color: Colors.grey[100],
    child: Column(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 60, color: Colors.deepPurple),
              ),
              SizedBox(height: 10),
              Text(
                'Flutter 用户',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerTile(icon: Icons.dashboard, title: '控制面板'),
              DrawerTile(icon: Icons.person, title: '个人资料'),
              DrawerTile(icon: Icons.notifications, title: '通知'),
              DrawerTile(icon: Icons.shopping_cart, title: '购物车'),
              Divider(color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '其他选项',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              DrawerTile(icon: Icons.settings, title: '设置'),
              DrawerTile(icon: Icons.help, title: '帮助和反馈'),
              DrawerTile(icon: Icons.exit_to_app, title: '退出'),
            ],
          ),
        ),
      ],
    ),
  ),
)

// 自定义ListTile组件
class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  
  const DrawerTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: () {},
    );
  }
}''',
            demo: SizedBox(
              height: 500,
              width: 280,
              child: Drawer(
                elevation: 16.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.deepPurple, Colors.purpleAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Flutter 用户',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _DrawerTile(icon: Icons.dashboard, title: '控制面板'),
                            _DrawerTile(icon: Icons.person, title: '个人资料'),
                            _DrawerTile(icon: Icons.notifications, title: '通知'),
                            _DrawerTile(
                              icon: Icons.shopping_cart,
                              title: '购物车',
                            ),
                            Divider(color: Colors.grey),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Text(
                                '其他选项',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            _DrawerTile(icon: Icons.settings, title: '设置'),
                            _DrawerTile(icon: Icons.help, title: '帮助和反馈'),
                            _DrawerTile(icon: Icons.exit_to_app, title: '退出'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
        icon: Icons.menu,
        color: Colors.indigo,
      );
}

// Helper class for the demo
class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _DrawerTile({Key? key, required this.icon, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: () {},
    );
  }
}
