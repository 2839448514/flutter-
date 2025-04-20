import 'package:flutter/material.dart';
import '../widget_demo.dart';

class GestureDetectorWidgetDemo extends WidgetDemo {
  GestureDetectorWidgetDemo()
      : super(
          name: 'GestureDetector',
          description: 'GestureDetector 可以检测各种手势，如点击、双击、长按、拖动等。它是一个非常强大的手势识别组件。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''
const GestureDetector({
  Key? key,
  this.child,
  this.onTapDown,          // 手指按下时回调
  this.onTapUp,           // 手指抬起时回调
  this.onTap,             // 点击事件回调
  this.onTapCancel,       // 点击取消时回调
  this.onDoubleTap,       // 双击事件回调
  this.onLongPress,       // 长按事件回调
  this.onLongPressStart,  // 长按开始时回调
  this.onLongPressMoveUpdate, // 长按移动时回调
  this.onLongPressUp,     // 长按抬起时回调
  this.onLongPressEnd,    // 长按结束时回调
  this.onVerticalDragStart,   // 垂直拖动开始时回调
  this.onVerticalDragUpdate,  // 垂直拖动更新时回调
  this.onVerticalDragEnd,     // 垂直拖动结束时回调
  this.onHorizontalDragStart, // 水平拖动开始时回调
  this.onHorizontalDragUpdate,// 水平拖动更新时回调
  this.onHorizontalDragEnd,   // 水平拖动结束时回调
  this.onPanStart,        // 拖动开始时回调
  this.onPanUpdate,       // 拖动更新时回调
  this.onPanEnd,          // 拖动结束时回调
  this.behavior,          // 事件传递行为
  this.excludeFromSemantics = false, // 是否从语义树中排除
})''')],
          examples: [
            DemoItem(
              description: '点击事件',
              code: '''
GestureDetector(
  onTap: () {
    print('Container tapped!');
  },
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    child: Center(
      child: Text(
        '点击我!',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)''',
              demo: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      '点击我!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            
            DemoItem(
              description: '双击和长按',
              code: '''
GestureDetector(
  onDoubleTap: () {
    print('Double tapped!');
  },
  onLongPress: () {
    print('Long pressed!');
  },
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(
        '双击或长按',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  ),
)''',
              demo: GestureDetector(
                onDoubleTap: () {},
                onLongPress: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '双击或长按',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            
            DemoItem(
              description: '拖动检测',
              code: '''
GestureDetector(
  onPanUpdate: (details) {
    print('Dragging: \${details.delta}');
  },
  child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Center(
      child: Text(
        '拖动我',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)''',
              demo: GestureDetector(
                onPanUpdate: (details) {},
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      '拖动我',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
          icon: Icons.touch_app,
          color: Colors.red,
        );
} 