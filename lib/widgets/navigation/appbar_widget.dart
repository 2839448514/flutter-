import 'package:flutter/material.dart';
import '../widget_demo.dart';

class AppBarWidgetDemo extends WidgetDemo {
  AppBarWidgetDemo()
    : super(
        name: 'AppBar',
        description: 'AppBar 是显示在页面顶部的应用栏，通常包含标题、操作按钮和其他小部件。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''AppBar({
  Key? key,
  Widget? leading,                          // 左侧按钮或小部件
  bool automaticallyImplyLeading = true,    // 是否自动添加返回按钮
  Widget? title,                            // 标题
  List<Widget>? actions,                    // 右侧操作按钮
  Widget? flexibleSpace,                    // 可伸缩空间
  PreferredSizeWidget? bottom,              // 底部小部件（如TabBar）
  double? elevation,                        // 阴影高度
  Color? shadowColor,                       // 阴影颜色
  ShapeBorder? shape,                       // 形状
  Color? backgroundColor,                   // 背景颜色
  Color? foregroundColor,                   // 前景颜色
  IconThemeData? iconTheme,                 // 图标主题
  IconThemeData? actionsIconTheme,          // 操作图标主题
  bool primary = true,                      // 是否是主要的AppBar
  bool? centerTitle,                        // 是否居中标题
  double titleSpacing = NavigationToolbar.kMiddleSpacing, // 标题间距
  double toolbarOpacity = 1.0,              // 工具栏透明度
  double bottomOpacity = 1.0,               // 底部透明度
  double? toolbarHeight,                    // 工具栏高度
  double? leadingWidth,                     // 左侧小部件宽度
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基本使用',
            code: r'''
AppBar(
  title: Text('基本AppBar'),
  backgroundColor: Colors.blue,
)''',
            demo: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: AppBar(
                title: const Text('基本AppBar'),
                backgroundColor: Colors.blue,
              ),
            ),
          ),

          DemoItem(
            description: '带有操作按钮的AppBar',
            code: r'''
AppBar(
  title: Text('带操作按钮的AppBar'),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
)''',
            demo: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: AppBar(
                title: const Text('带操作按钮的AppBar'),
                actions: [
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          DemoItem(
            description: '居中标题的AppBar',
            code: r'''
AppBar(
  title: Text('居中标题'),
  centerTitle: true,
  backgroundColor: Colors.purple,
  elevation: 8.0,
  shadowColor: Colors.purpleAccent,
)''',
            demo: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: AppBar(
                title: const Text('居中标题'),
                centerTitle: true,
                backgroundColor: Colors.purple,
                elevation: 8.0,
                shadowColor: Colors.purpleAccent,
              ),
            ),
          ),

          DemoItem(
            description: '带有TabBar的AppBar',
            code: r'''
AppBar(
  title: Text('带TabBar的AppBar'),
  bottom: TabBar(
    tabs: [
      Tab(text: '标签1'),
      Tab(text: '标签2'),
      Tab(text: '标签3'),
    ],
  ),
)''',
            demo: PreferredSize(
              preferredSize: const Size.fromHeight(104.0), // 56.0 + 48.0
              child: AppBar(
                title: const Text('带TabBar的AppBar'),
                bottom: const TabBar(
                  tabs: [Tab(text: '标签1'), Tab(text: '标签2'), Tab(text: '标签3')],
                ),
              ),
            ),
          ),

          DemoItem(
            description: '自定义AppBar',
            code: r'''
AppBar(
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.purple],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
  ),
  title: Text('自定义AppBar'),
  actions: [
    IconButton(
      icon: Icon(Icons.favorite),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.share),
      onPressed: () {},
    ),
  ],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
  ),
)''',
            demo: PreferredSize(
              preferredSize: const Size.fromHeight(56.0),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                title: const Text('自定义AppBar'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                  IconButton(icon: const Icon(Icons.share), onPressed: () {}),
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
        ],
        icon: Icons.web,
        color: Colors.blue,
      );
}
