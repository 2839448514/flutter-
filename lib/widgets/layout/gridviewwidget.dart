import 'package:flutter/material.dart';
import '../widget_demo.dart';

class GridViewWidgetDemo extends WidgetDemo {
  GridViewWidgetDemo()
    : super(
        name: 'GridView',
        description: 'GridView 组件以网格形式排列子组件。可以指定网格的列数、间距以及滚动方向等属性。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: '''GridView({
  Key? key,
  Axis scrollDirection = Axis.vertical,                // 滚动方向
  bool reverse = false,                               // 是否反向滚动
  ScrollController? controller,                       // 滚动控制器
  bool? primary,                                      // 是否是主滚动视图
  ScrollPhysics? physics,                             // 滚动物理效果
  bool shrinkWrap = false,                            // 是否根据内容收缩尺寸
  EdgeInsetsGeometry? padding,                        // 内边距
  required SliverGridDelegate gridDelegate,           // 网格布局委托
  bool addAutomaticKeepAlives = true,                 // 是否自动保持状态
  bool addRepaintBoundaries = true,                   // 是否添加重绘边界
  bool addSemanticIndexes = true,                     // 是否添加语义索引
  double? cacheExtent,                                // 缓存区域
  List<Widget> children = const <Widget>[],           // 子组件列表
  int? semanticChildCount,                            // 语义子组件计数
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, // 拖拽开始行为
  Clip clipBehavior = Clip.hardEdge,                  // 裁剪行为
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, // 键盘消失行为
  String? restorationId,                              // 恢复 ID
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基础网格布局',
            code: r'''
GridView.count(
  crossAxisCount: 3,
  children: List.generate(9, (index) {
    return Container(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Text('Item $index', style: TextStyle(color: Colors.white)),
      ),
    );
  }),
)''',
            demo: SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) => Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          DemoItem(
            description: '带间距的网格布局',
            code: r'''
GridView.count(
  crossAxisCount: 2,
  mainAxisSpacing: 10.0,
  crossAxisSpacing: 10.0,
  padding: EdgeInsets.all(10.0),
  children: List.generate(6, (index) {
    return Container(
      color: Colors.blue[(index + 1) * 100],
      child: Center(
        child: Text('Item $index', style: TextStyle(color: Colors.white)),
      ),
    );
  }),
)''',
            demo: SizedBox(
              height: 250,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                padding: const EdgeInsets.all(10.0),
                children: List.generate(
                  6,
                  (index) => Container(
                    color: Colors.blue[(index + 1) * 100],
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          DemoItem(
            description: '使用GridView.builder构建大量子项',
            code: r'''
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
  ),
  itemCount: 12,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.green[(index % 8 + 1) * 100],
      child: Center(
        child: Text('$index', style: TextStyle(color: Colors.white)),
      ),
    );
  },
)''',
            demo: SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.green[(index % 8 + 1) * 100],
                    child: Center(
                      child: Text(
                        '$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          DemoItem(
            description: '不同宽高比的网格布局',
            code: r'''
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.5,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemCount: 6,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.orange[(index + 1) * 100],
      child: Center(
        child: Text('宽高比 1.5', style: TextStyle(color: Colors.white)),
      ),
    );
  },
)''',
            demo: SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.orange[(index + 1) * 100],
                    child: Center(
                      child: const Text(
                        '宽高比 1.5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        icon: Icons.grid_on,
        color: Colors.orange,
      );
}
