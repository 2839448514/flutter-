import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ListViewWidgetDemo extends WidgetDemo {
  ListViewWidgetDemo()
    : super(
        name: 'ListView',
        description: 'ListView 组件以线性排列方式显示可滚动的子组件列表。常用于显示大量数据。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''ListView({
  Key? key,
  Axis scrollDirection = Axis.vertical,                // 滚动方向
  bool reverse = false,                               // 是否反向滚动
  ScrollController? controller,                       // 滚动控制器
  bool? primary,                                      // 是否是主滚动视图
  ScrollPhysics? physics,                             // 滚动物理效果
  bool shrinkWrap = false,                            // 是否根据内容收缩尺寸
  EdgeInsetsGeometry? padding,                        // 内边距
  double? itemExtent,                                 // 子项固定高度（垂直列表）或宽度（水平列表）
  bool addAutomaticKeepAlives = true,                 // 是否自动保持状态
  bool addRepaintBoundaries = true,                   // 是否添加重绘边界
  bool addSemanticIndexes = true,                     // 是否添加语义索引
  double? cacheExtent,                                // 缓存区域
  List<Widget> children = const <Widget>[],           // 子组件列表
  int? semanticChildCount,                            // 语义子组件计数
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, // 拖拽开始行为
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, // 键盘消失行为
  String? restorationId,                              // 恢复 ID
  Clip clipBehavior = Clip.hardEdge,                  // 裁剪行为
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基础列表',
            code: r'''
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.map),
      title: Text('地图'),
    ),
    ListTile(
      leading: Icon(Icons.photo),
      title: Text('相册'),
    ),
    ListTile(
      leading: Icon(Icons.phone),
      title: Text('电话'),
    ),
    ListTile(
      leading: Icon(Icons.contacts),
      title: Text('联系人'),
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('设置'),
    ),
  ],
)''',
            demo: SizedBox(
              height: 300,
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.map), title: Text('地图')),
                  ListTile(leading: Icon(Icons.photo), title: Text('相册')),
                  ListTile(leading: Icon(Icons.phone), title: Text('电话')),
                  ListTile(leading: Icon(Icons.contacts), title: Text('联系人')),
                  ListTile(leading: Icon(Icons.settings), title: Text('设置')),
                ],
              ),
            ),
          ),

          DemoItem(
            description: '使用 ListView.builder 构建大列表',
            code: r'''
ListView.builder(
  itemCount: 20,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[index % Colors.primaries.length],
        child: Text('${index + 1}'),
      ),
      title: Text('列表项 ${index + 1}'),
      subtitle: Text('这是第 ${index + 1} 个列表项的描述'),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  },
)''',
            demo: SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Colors.primaries[index % Colors.primaries.length],
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('列表项 ${index + 1}'),
                    subtitle: Text('这是第 ${index + 1} 个列表项的描述'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  );
                },
              ),
            ),
          ),

          DemoItem(
            description: '带分隔符的列表',
            code: r'''
ListView.separated(
  itemCount: 10,
  separatorBuilder: (context, index) => const Divider(),
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('列表项 ${index + 1}'),
      trailing: Icon(Icons.info_outline),
      onTap: () {},
    );
  },
)''',
            demo: SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('列表项 ${index + 1}'),
                    trailing: const Icon(Icons.info_outline),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),

          DemoItem(
            description: '水平列表',
            code: r'''
SizedBox(
  height: 150,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 10,
    itemBuilder: (context, index) {
      return Container(
        width: 100,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[(index + 1) * 100],
        ),
        child: Center(
          child: Text(
            '项目 ${index + 1}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    },
  ),
)''',
            demo: SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue[(index + 1) * 100],
                    ),
                    child: Center(
                      child: Text(
                        '项目 ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          DemoItem(
            description: '具有自定义项目的列表',
            code: r'''
ListView.builder(
  itemCount: 5,
  itemBuilder: (context, index) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '用户名 ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '详细信息 ${index + 1}',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '这是列表项 ${index + 1} 的一段比较长的描述文本。列表项可以包含复杂的布局和内容。',
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('取消'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('确定'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
)''',
            demo: SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '用户名 ${index + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '详细信息 ${index + 1}',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '这是列表项 ${index + 1} 的一段比较长的描述文本。列表项可以包含复杂的布局和内容。',
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('取消'),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('确定'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        icon: Icons.list,
        color: Colors.indigo,
      );
}
