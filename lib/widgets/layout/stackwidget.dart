import 'package:flutter/material.dart';
import '../widget_demo.dart';

class StackWidgetDemo extends WidgetDemo {
  StackWidgetDemo()
    : super(
        name: 'Stack',
        description: 'Stack 组件可以将子组件叠加显示。子组件可以通过 Positioned 进行精确定位。',
        constructors: [
          ConstructorItem(
            name: 'TabBar',
            code: r'''const Stack({
  Key? key,
  AlignmentGeometry alignment = AlignmentDirectional.topStart, // 子组件的对齐方式
  TextDirection? textDirection,                               // 文本方向
  StackFit fit = StackFit.loose,                             // 子组件的适应方式
  Clip clipBehavior = Clip.hardEdge,                         // 裁剪方式
  List<Widget> children = const <Widget>[],                   // 子组件列表
})''',
          ),
        ],
        examples: [
          DemoItem(
            description: '基础叠层布局',
            code: r'''
Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.red,
    ),
    Container(
      width: 150,
      height: 150,
      color: Colors.green,
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    ),
  ],
)''',
            demo: Stack(
              children: [
                Container(width: 200, height: 200, color: Colors.red),
                Container(width: 150, height: 150, color: Colors.green),
                Container(width: 100, height: 100, color: Colors.blue),
              ],
            ),
          ),

          DemoItem(
            description: '子组件定位',
            code: r'''
Stack(
  children: [
    Container(
      width: 250,
      height: 250,
      color: Colors.amber,
    ),
    Positioned(
      left: 20,
      top: 20,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    ),
    Positioned(
      right: 20,
      bottom: 20,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    ),
  ],
)''',
            demo: SizedBox(
              width: 300,
              height: 250,
              child: Stack(
                children: [
                  Container(width: 250, height: 250, color: Colors.amber),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),

          DemoItem(
            description: '多层子组件与对齐',
            code: r'''
Stack(
  alignment: Alignment.center,
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.purple[200],
    ),
    Container(
      width: 150,
      height: 150,
      color: Colors.purple[400],
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.purple[600],
    ),
    const Text(
      '居中文本',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
)''',
            demo: Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 200, height: 200, color: Colors.purple[200]),
                Container(width: 150, height: 150, color: Colors.purple[400]),
                Container(width: 100, height: 100, color: Colors.purple[600]),
                const Text(
                  '居中文本',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          DemoItem(
            description: '复杂定位组合',
            code: r'''
Stack(
  fit: StackFit.expand,
  children: [
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue[100]!, Colors.blue[900]!],
        ),
      ),
    ),
    Positioned(
      top: 30,
      left: 20,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '左上角',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Positioned(
      bottom: 30,
      right: 20,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '右下角',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    Center(
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '居中卡片',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ),
  ],
)''',
            demo: SizedBox(
              width: 300,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue[100]!, Colors.blue[900]!],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '左上角',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '右下角',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text('居中卡片', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        icon: Icons.layers,
        color: Colors.deepPurple,
      );
}
