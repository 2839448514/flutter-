# Flutter 教程: 构建一个简单的计数器应用

Category: 入门教程

在本教程中，我们将学习如何使用 Flutter 构建一个简单的计数器应用。这个应用将展示如何使用 Flutter 的基本组件和状态管理。

## 设置开发环境

在开始之前，请确保你已经安装了 Flutter SDK 和一个支持 Flutter 开发的 IDE（如 Android Studio 或 Visual Studio Code）。你可以参考 [Flutter 官方文档](https://flutter.dev/docs/get-started/install) 进行安装。

## 创建 Flutter 项目

打开终端并运行以下命令来创建一个新的 Flutter 项目：

```sh
flutter create counter_app
```

进入项目目录：

```sh
cd counter_app
```

## 构建计数器应用

打开 `lib/main.dart` 文件，并将其内容替换为以下代码：

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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

你应该会看到一个带有计数器的应用。每次点击右下角的加号按钮，计数器的值都会增加。

## 添加更多功能

### 重置计数器

我们可以添加一个按钮来重置计数器。修改 `_MyHomePageState` 类如下：

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetCounter,
              child: const Text('重置计数器'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 显示计数器历史记录

我们可以添加一个列表来显示计数器的历史记录。修改 `_MyHomePageState` 类如下：

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> _history = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _history.add(_counter);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetCounter,
              child: const Text('重置计数器'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('计数器值: ${_history[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

## 小结

在本教程中，我们学习了如何使用 Flutter 构建一个简单的计数器应用，并添加了重置计数器和显示计数器历史记录的功能。希望这个教程对你有所帮助！

---

*这是一篇关于 Flutter 入门 的教程文章*
