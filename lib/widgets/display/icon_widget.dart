import 'package:flutter/material.dart';
import '../widget_demo.dart';

class IconWidgetDemo extends WidgetDemo {
  IconWidgetDemo()
      : super(
    name: 'Icon',
    description: 'Icon 组件用于显示图标。Flutter 提供了大量的内置图标，也支持自定义图标。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''
// Icon 组件用于显示图标
Icon(
  IconData icon, // 必填，定义显示的图标
  {Key? key, // 唯一标识
  double? size, // 图标大小
  Color? color, // 图标颜色
  TextDirection? textDirection, // 文本方向，用于支持RTL
  TextBaseline? textBaseline, // 用于控制图标的基线对齐
  Color? semanticLabel, // 辅助无障碍工具的标签
  MouseRegion? mouseRegion, // 鼠标区域配置，适用于桌面平台
})
''')],
    examples: [
      DemoItem(
        description: '基础图标',
        code: '''
Icon(
  Icons.star,
  size: 30,
  color: Colors.amber,
)''',
        demo: const Icon(
          Icons.star,
          size: 30,
          color: Colors.amber,
        ),
      ),

      DemoItem(
        description: '不同大小的图标',
        code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.favorite, size: 20),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.favorite, size: 40),
  ],
)''',
        demo: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.favorite, size: 20),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.favorite, size: 40),
          ],
        ),
      ),

      DemoItem(
        description: '不同颜色的图标',
        code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.info, color: Colors.blue),
    Icon(Icons.warning, color: Colors.orange),
    Icon(Icons.error, color: Colors.red),
  ],
)''',
        demo: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.info, color: Colors.blue),
            Icon(Icons.warning, color: Colors.orange),
            Icon(Icons.error, color: Colors.red),
          ],
        ),
      ),

      DemoItem(
        description: '常用操作图标',
        code: '''
Wrap(
  spacing: 16,
  runSpacing: 16,
  children: [
    Icon(Icons.home),
    Icon(Icons.settings),
    Icon(Icons.search),
    Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.menu),
  ],
)''',
        demo: const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Icon(Icons.home),
            Icon(Icons.settings),
            Icon(Icons.search),
            Icon(Icons.person),
            Icon(Icons.notifications),
            Icon(Icons.menu),
          ],
        ),
      ),
    ],
    icon: Icons.star,
    color: Colors.amber,
  );
}
