import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ContainerWidgetDemo extends WidgetDemo {
  ContainerWidgetDemo()
      : super(
          name: 'Container',
          description: 'Container 是一个多功能的容器组件，可以设置装饰、边距、尺寸等属性。它是 Flutter 中最常用的布局组件之一。',
      constructors: [
      ConstructorItem(
      name: 'TabBar',
      code
      : '''const Container({
  Key? key,
  this.alignment,          // 子组件对齐方式
  this.padding,           // 内边距
  this.color,             // 背景色
  this.decoration,        // 装饰（边框、圆角、渐变等）
  this.foregroundDecoration, // 前景装饰
  this.width,             // 宽度
  this.height,            // 高度
  this.constraints,       // 约束（最大/最小宽高）
  this.margin,            // 外边距
  this.transform,         // 变换矩阵
  this.transformAlignment,// 变换对齐方式
  this.child,            // 子组件
  this.clipBehavior = Clip.none, // 裁剪行为
})''')],
          examples: [
            DemoItem(
              description: '基础容器',
              code: '''
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
)''',
              demo: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            
            DemoItem(
              description: '带边距和内边距的容器',
              code: '''
Container(
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(16),
  color: Colors.orange,
  child: Text(
    '这是一个带边距的容器',
    style: TextStyle(color: Colors.white),
  ),
)''',
              demo: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(16),
                color: Colors.orange,
                child: const Text(
                  '这是一个带边距的容器',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            
            DemoItem(
              description: '带装饰的容器',
              code: '''
Container(
  width: 150,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.blue[100],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Center(
    child: Text(
      '带装饰的容器',
      style: TextStyle(color: Colors.blue[900]),
    ),
  ),
)''',
              demo: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '带装饰的容器',
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ),
              ),
            ),
            
            DemoItem(
              description: '渐变背景容器',
              code: '''
Container(
  width: 150,
  height: 100,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Center(
    child: Text(
      '渐变背景',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)''',
              demo: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    '渐变背景',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
          icon: Icons.check_box_outline_blank,
          color: Colors.deepPurple,
        );
} 