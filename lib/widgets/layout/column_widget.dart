import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ColumnWidgetDemo extends WidgetDemo {
  ColumnWidgetDemo()
      : super(
          name: 'Column',
          description: 'Column 组件将子组件垂直排列。可以控制子组件的对齐方式和间距。',
      constructors: [
      ConstructorItem(
      name: 'TabBar',
      code
      : '''const Column({
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
              description: '基础垂直布局',
              code: '''
Column(
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
              demo: Column(
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
Column(
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
              demo: SizedBox(
                height: 200,
                child: Column(
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
            ),

            DemoItem(
              description: '交叉轴对齐方式',
              code: '''
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 100,
      height: 50,
      color: Colors.red,
    ),
    Container(
      width: 80,
      height: 50,
      color: Colors.green,
    ),
    Container(
      width: 60,
      height: 50,
      color: Colors.blue,
    ),
  ],
)''',
              demo: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.red,
                  ),
                  Container(
                    width: 80,
                    height: 50,
                    color: Colors.green,
                  ),
                  Container(
                    width: 60,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            DemoItem(
              description: '带间距的垂直布局',
              code: '''
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
      width: 50,
      height: 50,
      color: Colors.red,
    ),
    SizedBox(height: 10),
    Container(
      width: 50,
      height: 50,
      color: Colors.green,
    ),
    SizedBox(height: 10),
    Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    ),
  ],
)''',
              demo: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
          icon: Icons.view_column,
          color: Colors.blueGrey,
        );
}