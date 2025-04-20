# Flutter 高级教程: 构建一个待办事项应用

Category: 高级教程

在本教程中，我们将学习如何使用 Flutter 构建一个待办事项应用。这个应用将展示如何使用 Flutter 的高级组件和状态管理。

## 设置开发环境

在开始之前，请确保你已经安装了 Flutter SDK 和一个支持 Flutter 开发的 IDE（如 Android Studio 或 Visual Studio Code）。你可以参考 [Flutter 官方文档](https://flutter.dev/docs/get-started/install) 进行安装。

## 创建 Flutter 项目

打开终端并运行以下命令来创建一个新的 Flutter 项目：

```sh
flutter create todo_app
```

进入项目目录：

```sh
cd todo_app
```

## 构建待办事项应用

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
      title: '待办事项',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '待办事项'),
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
  final List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _todoItems.add(task);
      });
    }
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptAddTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('添加新任务'),
          content: TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeTodoItem(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _promptAddTodoItem,
        tooltip: '添加任务',
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

你应该会看到一个待办事项应用。你可以添加和删除任务。

## 小结

在本教程中，我们学习了如何使用 Flutter 构建一个待办事项应用。我们介绍了 Flutter 的高级组件和状态管理。希望这个教程对你有所帮助！

---

*这是一篇关于 Flutter 高级 的教程文章*
