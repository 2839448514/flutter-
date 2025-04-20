import 'package:flutter/material.dart';
import '../widget_demo.dart';

class ImageWidgetDemo extends WidgetDemo {
  ImageWidgetDemo()
      : super(
    name: 'Image',
    description: 'Image 组件用于显示图片，支持多种来源的图片显示，包括资源图片、网络图片、文件图片等。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: '''
// Image 组件用于显示图片
Image(
  {Key? key, // 唯一标识符
  required ImageProvider image, // 必填，图片来源（例如AssetImage、NetworkImage等）
  double? width, // 图片宽度
  double? height, // 图片高度
  BoxFit? fit, // 图片填充方式，控制图片如何适应容器大小
  AlignmentGeometry alignment = Alignment.center, // 图片对齐方式
  ImageRepeat repeat = ImageRepeat.noRepeat, // 是否重复显示图片
  bool? gaplessPlayback, // 是否使用无间隙播放
  FilterQuality filterQuality = FilterQuality.low, // 图片滤镜质量
  double scale = 1.0, // 图片缩放比例
})
''')],
    examples: [
      DemoItem(
        description: '网络图片',
        code: '''
Image.network(
  'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
  width: 200,
  height: 100,
  fit: BoxFit.contain,
)''',
        demo: Image.network(
          'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
          width: 200,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),

      DemoItem(
        description: '不同的填充模式',
        code: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Container(
      width: 100,
      height: 100,
      color: Colors.grey[200],
      child: Image.network(
        'https://picsum.photos/200',
        fit: BoxFit.cover,
      ),
    ),
    Container(
      width: 100,
      height: 100,
      color: Colors.grey[200],
      child: Image.network(
        'https://picsum.photos/200',
        fit: BoxFit.contain,
      ),
    ),
  ],
)''',
        demo: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: Image.network(
                'https://picsum.photos/200',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),

      DemoItem(
        description: '圆形图片',
        code: '''
ClipOval(
  child: Image.network(
    'https://picsum.photos/200',
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  ),
)''',
        demo: ClipOval(
          child: Image.network(
            'https://picsum.photos/200',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
    icon: Icons.image,
    color: Colors.green,
  );
}
