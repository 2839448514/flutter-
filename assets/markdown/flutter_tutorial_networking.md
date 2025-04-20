# Flutter 教程: 构建一个网络请求应用

Category: 网络请求

在本教程中，我们将学习如何使用 Flutter 构建一个网络请求应用。这个应用将展示如何使用 Flutter 进行网络请求并解析 JSON 数据。

## 设置开发环境

在开始之前，请确保你已经安装了 Flutter SDK 和一个支持 Flutter 开发的 IDE（如 Android Studio 或 Visual Studio Code）。你可以参考 [Flutter 官方文档](https://flutter.dev/docs/get-started/install) 进行安装。

## 创建 Flutter 项目

打开终端并运行以下命令来创建一个新的 Flutter 项目：

```sh
flutter create networking_app
```

进入项目目录：

```sh
cd networking_app
```

## 添加依赖

在 `pubspec.yaml` 文件中添加 `http` 依赖：

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.3
```

运行以下命令来安装依赖：

```sh
flutter pub get
```

## 构建网络请求应用

打开 `lib/main.dart` 文件，并将其内容替换为以下代码：

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网络请求',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '网络请求示例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _data = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_data[index]['title']),
                  subtitle: Text(_data[index]['body']),
                );
              },
            ),
    );
  }
}
```

## 运行应用

在终端中运行以下命令来启动应用：

```sh
flutter run
```

你应该会看到一个网络请求应用。应用会从网络获取数据并显示在列表中。

## 小结

在本教程中，我们学习了如何使用 Flutter 构建一个网络请求应用。我们介绍了如何进行网络请求并解析 JSON 数据。希望这个教程对你有所帮助！

---

*这是一篇关于 Flutter 网络请求 的教程文章*
