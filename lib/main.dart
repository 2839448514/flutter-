import 'package:flutter/material.dart';
import 'package:flutterdose/page/MainPage.dart';
import 'package:flutterdose/router/Routers.dart';
import 'package:flutterdose/widgets/widget_demo.dart'; // 导入 widget_demo.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
      navigatorKey: WidgetDemo.navigatorKey,
    );
  }
}
