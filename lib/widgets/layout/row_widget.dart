import 'package:flutter/material.dart';
import '../widget_demo.dart';

class RowWidgetDemo extends WidgetDemo {
  RowWidgetDemo()
      : super(
          name: 'Row',
          description: 'Row 组件将子组件水平排列。可以控制子组件的对齐方式和间距。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''const Row({
  Key? key,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,  // 主轴对齐方式
  MainAxisSize mainAxisSize = MainAxisSize.max,                  // 主轴尺寸
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, // 交叉轴对齐方式
  TextDirection? textDirection,                                  // 文本方向
  VerticalDirection verticalDirection = VerticalDirection.down,  // 垂直方向
  TextBaseline? textBaseline,                                   // 文本基线
  List<Widget> children = const <Widget>[],                     // 子组件列表
})''')],
          examples: [
            DemoItem(
              description: '基础水平布局',
              code: '''
Row(
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
  ],
)''',
              demo: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            
            DemoItem(
              description: '主轴对齐方式',
              code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
  ],
)''',
              demo: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            
            DemoItem(
              description: '交叉轴对齐方式',
              code: '''
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 50,
      height: 100,
      color: Colors.red,
    ),
    Container(
      width: 50,
      height: 80,
      color: Colors.green,
    ),
    Container(
      width: 50,
      height: 60,
      color: Colors.blue,
    ),
  ],
)''',
              demo: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 50,
                    height: 80,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 60,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            
            DemoItem(
              description: '带间距的水平布局',
              code: '''
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    SizedBox(width: 10),
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    SizedBox(width: 10),
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
  ],
)''',
              demo: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
          icon: Icons.view_week,
          color: Colors.orange,
        );
} 