import 'package:flutter/material.dart';
import '../widget_demo.dart';

class TabBarWidgetDemo extends WidgetDemo {
  TabBarWidgetDemo()
      : super(
          name: 'TabBar',
          description: 'TabBar 是一个水平选项卡组件，通常与 TabBarView 结合使用来实现标签页切换。',
          // 使用新的 List<ConstructorItem> 结构
          constructors: [
            ConstructorItem(
              name: 'TabBar',
              code: '''const TabBar({
  Key? key,
  required List<Widget> tabs,                 // 标签列表
  TabController? controller,                  // 标签控制器
  bool isScrollable = false,                  // 是否可滚动
  EdgeInsetsGeometry? padding,                // 内边距
  Color? indicatorColor,                      // 指示器颜色
  double indicatorWeight = 2.0,               // 指示器线条粗细
  EdgeInsetsGeometry? indicatorPadding,       // 指示器内边距
  Decoration? indicator,                      // 自定义指示器
  TabBarIndicatorSize? indicatorSize,         // 指示器大小
  Color? labelColor,                          // 选中标签文本颜色
  TextStyle? labelStyle,                      // 选中标签文本样式
  EdgeInsetsGeometry? labelPadding,           // 标签内边距
  Color? unselectedLabelColor,                // 未选中标签文本颜色
  TextStyle? unselectedLabelStyle,            // 未选中标签文本样式
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, // 拖拽开始行为
  MaterialStateProperty<Color?>? overlayColor, // 水波纹颜色
  MouseCursor? mouseCursor,                   // 鼠标指针样式
  bool? enableFeedback,                       // 是否启用反馈
  ValueChanged<int>? onTap,                   // 点击回调
  ScrollPhysics? physics,                     // 滋动物理效果
})''',
              description: '基本的标签栏构造函数',
            ),
            ConstructorItem(
              name: 'DefaultTabController',
              code: '''DefaultTabController({
  Key? key,
  required int length,                        // 标签数量
  int initialIndex = 0,                       // 初始选中的标签索引
  required Widget child,                      // 子组件
  Duration? animationDuration,                // 动画持续时间
})''',
              description: '提供 TabController 的包装组件',
            ),
            ConstructorItem(
              name: 'TabBarView',
              code: '''TabBarView({
  Key? key,
  required List<Widget> children,             // 子视图列表
  TabController? controller,                  // 标签控制器
  ScrollPhysics? physics,                     // 滚动物理效果
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, // 拖拽开始行为
})''',
              description: '与 TabBar 配合使用的页面容器',
            ),
            ConstructorItem(
              name: 'TabController',
              code: '''TabController({
  required int length,                        // 标签数量
  int initialIndex = 0,                       // 初始选中的标签索引
  required TickerProvider vsync,              // 提供Ticker的对象
})''',
              description: '管理标签页状态的控制器',
            ),
          ],
          examples: [
            DemoItem(
              description: '基本使用',
              code: r'''
DefaultTabController(
  length: 3,
  child: Column(
    children: [
      TabBar(
        tabs: [
          Tab(text: '标签一'),
          Tab(text: '标签二'),
          Tab(text: '标签三'),
        ],
      ),
      Expanded(
        child: TabBarView(
          children: [
            Center(child: Text('内容一')),
            Center(child: Text('内容二')),
            Center(child: Text('内容三')),
          ],
        ),
      ),
    ],
  ),
)''',
              demo: SizedBox(
                height: 200,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: '标签一'),
                          Tab(text: '标签二'),
                          Tab(text: '标签三'),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Text('内容一')),
                            Center(child: Text('内容二')),
                            Center(child: Text('内容三')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            DemoItem(
              description: '带图标的标签页',
              code: r'''
DefaultTabController(
  length: 4,
  child: Scaffold(
    appBar: AppBar(
      title: Text('带图标的标签页'),
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car), text: '汽车'),
          Tab(icon: Icon(Icons.directions_transit), text: '公交'),
          Tab(icon: Icon(Icons.directions_bike), text: '自行车'),
          Tab(icon: Icon(Icons.directions_walk), text: '步行'),
        ],
      ),
    ),
    body: TabBarView(
      children: [
        Center(child: Text('汽车内容')),
        Center(child: Text('公交内容')),
        Center(child: Text('自行车内容')),
        Center(child: Text('步行内容')),
      ],
    ),
  ),
)''',
              demo: SizedBox(
                height: 300,
                child: DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text('带图标的标签页'),
                      bottom: const TabBar(
                        tabs: [
                          Tab(icon: Icon(Icons.directions_car), text: '汽车'),
                          Tab(icon: Icon(Icons.directions_transit), text: '公交'),
                          Tab(icon: Icon(Icons.directions_bike), text: '自行车'),
                          Tab(icon: Icon(Icons.directions_walk), text: '步行'),
                        ],
                      ),
                    ),
                    body: const TabBarView(
                      children: [
                        Center(child: Text('汽车内容')),
                        Center(child: Text('公交内容')),
                        Center(child: Text('自行车内容')),
                        Center(child: Text('步行内容')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            DemoItem(
              description: '自定义TabBar样式',
              code: r'''
DefaultTabController(
  length: 3,
  child: Column(
    children: [
      Container(
        color: Colors.deepPurple,
        child: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 4,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.white.withOpacity(0.6),
          tabs: [
            Tab(text: '热门'),
            Tab(text: '推荐'),
            Tab(text: '关注'),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          children: [
            Container(
              color: Colors.purple[50],
              child: Center(child: Text('热门内容')),
            ),
            Container(
              color: Colors.purple[100],
              child: Center(child: Text('推荐内容')),
            ),
            Container(
              color: Colors.purple[200],
              child: Center(child: Text('关注内容')),
            ),
          ],
        ),
      ),
    ],
  ),
)''',
              demo: SizedBox(
                height: 200,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.deepPurple,
                        child: TabBar(
                          indicatorColor: Colors.white,
                          indicatorWeight: 4,
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.white.withOpacity(0.6),
                          tabs: const [
                            Tab(text: '热门'),
                            Tab(text: '推荐'),
                            Tab(text: '关注'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              color: Colors.purple[50],
                              child: const Center(child: Text('热门内容')),
                            ),
                            Container(
                              color: Colors.purple[100],
                              child: const Center(child: Text('推荐内容')),
                            ),
                            Container(
                              color: Colors.purple[200],
                              child: const Center(child: Text('关注内容')),
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
              description: '可滚动的TabBar',
              code: r'''
DefaultTabController(
  length: 8,
  child: Column(
    children: [
      TabBar(
        isScrollable: true,  // 设置为可滚动
        tabs: [
          Tab(text: '新闻'),
          Tab(text: '体育'),
          Tab(text: '娱乐'),
          Tab(text: '财经'),
          Tab(text: '科技'),
          Tab(text: '教育'),
          Tab(text: '健康'),
          Tab(text: '旅游'),
        ],
      ),
      Expanded(
        child: TabBarView(
          children: [
            Center(child: Text('新闻内容')),
            Center(child: Text('体育内容')),
            Center(child: Text('娱乐内容')),
            Center(child: Text('财经内容')),
            Center(child: Text('科技内容')),
            Center(child: Text('教育内容')),
            Center(child: Text('健康内容')),
            Center(child: Text('旅游内容')),
          ],
        ),
      ),
    ],
  ),
)''',
              demo: SizedBox(
                height: 200,
                child: DefaultTabController(
                  length: 8,
                  child: Column(
                    children: [
                      const TabBar(
                        isScrollable: true,  // 设置为可滚动
                        tabs: [
                          Tab(text: '新闻'),
                          Tab(text: '体育'),
                          Tab(text: '娱乐'),
                          Tab(text: '财经'),
                          Tab(text: '科技'),
                          Tab(text: '教育'),
                          Tab(text: '健康'),
                          Tab(text: '旅游'),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Text('新闻内容')),
                            Center(child: Text('体育内容')),
                            Center(child: Text('娱乐内容')),
                            Center(child: Text('财经内容')),
                            Center(child: Text('科技内容')),
                            Center(child: Text('教育内容')),
                            Center(child: Text('健康内容')),
                            Center(child: Text('旅游内容')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            DemoItem(
              description: '自定义指示器',
              code: r'''
DefaultTabController(
  length: 3,
  child: Column(
    children: [
      TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),  // 圆角矩形
          color: Colors.green,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(text: '音乐'),
          Tab(text: '视频'),
          Tab(text: '图片'),
        ],
      ),
      Expanded(
        child: TabBarView(
          children: [
            Center(child: Text('音乐内容')),
            Center(child: Text('视频内容')),
            Center(child: Text('图片内容')),
          ],
        ),
      ),
    ],
  ),
)''',
              demo: SizedBox(
                height: 200,
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),  // 圆角矩形
                          color: Colors.green,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text: '音乐'),
                          Tab(text: '视频'),
                          Tab(text: '图片'),
                        ],
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: Text('音乐内容')),
                            Center(child: Text('视频内容')),
                            Center(child: Text('图片内容')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          icon: Icons.tab,
          color: Colors.purple,
        );
}
