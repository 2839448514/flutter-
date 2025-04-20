import 'package:flutter/material.dart';
import '../widget_demo.dart';

class NavigationBarWidgetDemo extends WidgetDemo {
  NavigationBarWidgetDemo()
    : super(
        name: 'NavigationBar',
        description: 'NavigationBar 是 Material 3 设计中的新导航组件，提供了更现代的外观和交互体验。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''NavigationBar({
  Key? key,
  required List<Widget> destinations,       // 导航目的地列表
  int? selectedIndex,                       // 选中项的索引
  ValueChanged<int>? onDestinationSelected, // 选中项变化回调
  Color? backgroundColor,                   // 背景颜色
  Color? indicatorColor,                    // 指示器颜色
  double? elevation,                        // 阴影高度
  double? height,                           // 高度
  AnimationStyle? animationStyle,           // 动画风格
  IconThemeData? iconTheme,                 // 图标主题
  LabelBehavior? labelBehavior,             // 标签行为
  // 其他参数...
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基础使用',
            code: r'''
StatefulBuilder(
  builder: (context, setState) {
    int selectedIndex = 0;
    
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: '主页',
        ),
        NavigationDestination(
          icon: Icon(Icons.search_outlined),
          selectedIcon: Icon(Icons.search),
          label: '搜索',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_outline),
          selectedIcon: Icon(Icons.favorite),
          label: '收藏',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: '我的',
        ),
      ],
    );
  },
)''',
            demo: StatefulBuilder(
              builder: (context, setState) {
                int selectedIndex = 0;

                return NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: '主页',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.search_outlined),
                      selectedIcon: Icon(Icons.search),
                      label: '搜索',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.favorite_outline),
                      selectedIcon: Icon(Icons.favorite),
                      label: '收藏',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.person_outline),
                      selectedIcon: Icon(Icons.person),
                      label: '我的',
                    ),
                  ],
                );
              },
            ),
          ),

          DemoItem(
            description: '自定义颜色',
            code: r'''
StatefulBuilder(
  builder: (context, setState) {
    int selectedIndex = 0;
    
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      backgroundColor: Colors.purple[50],
      indicatorColor: Colors.purple,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.inbox_outlined),
          selectedIcon: Icon(Icons.inbox, color: Colors.white),
          label: '收件箱',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat_outlined),
          selectedIcon: Icon(Icons.chat, color: Colors.white),
          label: '聊天',
        ),
        NavigationDestination(
          icon: Icon(Icons.group_outlined),
          selectedIcon: Icon(Icons.group, color: Colors.white),
          label: '通讯录',
        ),
      ],
    );
  },
)''',
            demo: StatefulBuilder(
              builder: (context, setState) {
                int selectedIndex = 0;

                return NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  backgroundColor: Colors.purple[50],
                  indicatorColor: Colors.purple,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.inbox_outlined),
                      selectedIcon: Icon(Icons.inbox, color: Colors.white),
                      label: '收件箱',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.chat_outlined),
                      selectedIcon: Icon(Icons.chat, color: Colors.white),
                      label: '聊天',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.group_outlined),
                      selectedIcon: Icon(Icons.group, color: Colors.white),
                      label: '通讯录',
                    ),
                  ],
                );
              },
            ),
          ),

          DemoItem(
            description: '带徽章的导航栏',
            code: r'''
StatefulBuilder(
  builder: (context, setState) {
    int selectedIndex = 0;
    
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home),
          label: '主页',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('3'),
            child: Icon(Icons.notifications_outlined),
          ),
          selectedIcon: Badge(
            label: Text('3'),
            child: Icon(Icons.notifications),
          ),
          label: '通知',
        ),
        NavigationDestination(
          icon: Badge(
            isLabelVisible: true,
            child: Icon(Icons.messenger_outline),
          ),
          selectedIcon: Badge(
            isLabelVisible: true,
            child: Icon(Icons.messenger),
          ),
          label: '消息',
        ),
      ],
    );
  },
)''',
            demo: StatefulBuilder(
              builder: (context, setState) {
                int selectedIndex = 0;

                return NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  destinations: [
                    const NavigationDestination(
                      icon: Icon(Icons.home),
                      label: '主页',
                    ),
                    NavigationDestination(
                      icon: Badge(
                        label: const Text('3'),
                        child: const Icon(Icons.notifications_outlined),
                      ),
                      selectedIcon: Badge(
                        label: const Text('3'),
                        child: const Icon(Icons.notifications),
                      ),
                      label: '通知',
                    ),
                    NavigationDestination(
                      icon: const Badge(
                        isLabelVisible: true,
                        child: Icon(Icons.messenger_outline),
                      ),
                      selectedIcon: const Badge(
                        isLabelVisible: true,
                        child: Icon(Icons.messenger),
                      ),
                      label: '消息',
                    ),
                  ],
                );
              },
            ),
          ),

          DemoItem(
            description: '标签行为设置',
            code: r'''
Column(
  children: [
    Text('仅显示选中项标签：'),
    StatefulBuilder(
      builder: (context, setState) {
        int selectedIndex = 0;
        
        return NavigationBar(
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: '主页',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: '探索',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              selectedIcon: Icon(Icons.add_circle),
              label: '创建',
            ),
            NavigationDestination(
              icon: Icon(Icons.subscriptions_outlined),
              selectedIcon: Icon(Icons.subscriptions),
              label: '订阅',
            ),
          ],
        );
      },
    ),
    SizedBox(height: 20),
    Text('始终显示标签：'),
    StatefulBuilder(
      builder: (context, setState) {
        int selectedIndex = 0;
        
        return NavigationBar(
          height: 60,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: '主页',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: '探索',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              selectedIcon: Icon(Icons.add_circle),
              label: '创建',
            ),
            NavigationDestination(
              icon: Icon(Icons.subscriptions_outlined),
              selectedIcon: Icon(Icons.subscriptions),
              label: '订阅',
            ),
          ],
        );
      },
    ),
  ],
)''',
            demo: Column(
              children: [
                const Text('仅显示选中项标签：'),
                StatefulBuilder(
                  builder: (context, setState) {
                    int selectedIndex = 0;

                    return NavigationBar(
                      height: 60,
                      labelBehavior:
                          NavigationDestinationLabelBehavior.onlyShowSelected,
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      destinations: const [
                        NavigationDestination(
                          icon: Icon(Icons.home_outlined),
                          selectedIcon: Icon(Icons.home),
                          label: '主页',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.explore_outlined),
                          selectedIcon: Icon(Icons.explore),
                          label: '探索',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.add_circle_outline),
                          selectedIcon: Icon(Icons.add_circle),
                          label: '创建',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.subscriptions_outlined),
                          selectedIcon: Icon(Icons.subscriptions),
                          label: '订阅',
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text('始终显示标签：'),
                StatefulBuilder(
                  builder: (context, setState) {
                    int selectedIndex = 0;

                    return NavigationBar(
                      height: 60,
                      labelBehavior:
                          NavigationDestinationLabelBehavior.alwaysShow,
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      destinations: const [
                        NavigationDestination(
                          icon: Icon(Icons.home_outlined),
                          selectedIcon: Icon(Icons.home),
                          label: '主页',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.explore_outlined),
                          selectedIcon: Icon(Icons.explore),
                          label: '探索',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.add_circle_outline),
                          selectedIcon: Icon(Icons.add_circle),
                          label: '创建',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.subscriptions_outlined),
                          selectedIcon: Icon(Icons.subscriptions),
                          label: '订阅',
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
        icon: Icons.navigation,
        color: Colors.indigo,
      );
}
