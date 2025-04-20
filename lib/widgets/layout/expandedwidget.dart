import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ExpandedWidgetDemo extends WidgetDemo {
  ExpandedWidgetDemo()
    : super(
        name: 'Expanded',
        description: 'Expanded 组件可以使子组件在 Row、Column 或 Flex 中按比例拉伸，填充可用空间。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''const Expanded({
  Key? key,
  int flex = 1,                  // 弹性系数，决定子组件占用剩余空间的比例
  Widget? child,                 // 子组件
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '在 Row 中等比例分配空间',
            code: r'''
Row(
  children: [
    Expanded(
      child: Container(
        height: 50,
        color: Colors.red,
        child: Center(
          child: Text('1', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    Expanded(
      child: Container(
        height: 50,
        color: Colors.green,
        child: Center(
          child: Text('1', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    Expanded(
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Center(
          child: Text('1', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  ],
)''',
            demo: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(
                      child: Text('1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: const Center(
                      child: Text('1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          DemoItem(
            description: '在 Row 中按比例分配空间',
            code: r'''
Row(
  children: [
    Expanded(
      flex: 1,
      child: Container(
        height: 50,
        color: Colors.red,
        child: Center(
          child: Text('flex: 1', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        height: 50,
        color: Colors.green,
        child: Center(
          child: Text('flex: 2', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Center(
          child: Text('flex: 3', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  ],
)''',
            demo: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'flex: 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'flex: 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'flex: 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          DemoItem(
            description: '在 Column 中使用 Expanded',
            code: r'''
SizedBox(
  height: 200,
  child: Column(
    children: [
      Container(
        height: 50,
        color: Colors.grey,
        child: Center(child: Text('固定高度：50')),
      ),
      Expanded(
        child: Container(
          color: Colors.amber,
          child: Center(child: Text('填充剩余空间')),
        ),
      ),
      Container(
        height: 50,
        color: Colors.grey,
        child: Center(child: Text('固定高度：50')),
      ),
    ],
  ),
)''',
            demo: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.grey,
                    child: const Center(child: Text('固定高度：50')),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                      child: const Center(child: Text('填充剩余空间')),
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.grey,
                    child: const Center(child: Text('固定高度：50')),
                  ),
                ],
              ),
            ),
          ),

          DemoItem(
            description: '多个 Expanded 在 Column 中按比例分配空间',
            code: r'''
SizedBox(
  height: 300,
  child: Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.purple[200],
          child: Center(child: Text('flex: 2')),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.purple[400],
          child: Center(child: Text('flex: 1')),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          color: Colors.purple[600],
          child: Center(child: Text('flex: 3')),
        ),
      ),
    ],
  ),
)''',
            demo: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.purple[200],
                      child: const Center(child: Text('flex: 2')),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.purple[400],
                      child: const Center(child: Text('flex: 1')),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.purple[600],
                      child: const Center(child: Text('flex: 3')),
                    ),
                  ),
                ],
              ),
            ),
          ),

          DemoItem(
            description: '结合其他组件使用',
            code: r'''
Column(
  children: [
    Container(
      height: 50,
      color: Colors.grey[300],
      child: Center(child: Text('Header')),
    ),
    Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue[100],
              child: Center(child: Text('侧边栏')),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Center(child: Text('主内容区')),
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 50,
      color: Colors.grey[300],
      child: Center(child: Text('Footer')),
    ),
  ],
)''',
            demo: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Header')),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.blue[100],
                            child: const Center(child: Text('侧边栏')),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.white,
                            child: const Center(child: Text('主内容区')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Footer')),
                  ),
                ],
              ),
            ),
          ),
        ],
        icon: Icons.format_align_justify,
        color: Colors.teal,
      );
}
