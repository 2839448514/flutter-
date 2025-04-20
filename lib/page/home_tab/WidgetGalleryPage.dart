import 'package:flutter/material.dart';
import '../../widgets/widget_demo.dart';

import '../../widgets/widget_registry.dart';


class  WidgetGalleryPage extends StatefulWidget {
  const  WidgetGalleryPage({super.key});

  @override
  State<WidgetGalleryPage> createState() => _WidgetGalleryPage();
}

class _WidgetGalleryPage extends State< WidgetGalleryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // 修改为5个选项卡，添加弹出组件
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
/*
布局类组件：用于控制元素排列。
交互类组件：处理用户输入和交互事件。
显示类组件：用于显示内容。
导航组件：用于页面导航和路由管理。
弹出组件：用于显示浮动在应用其他部分上的内容。
状态管理类组件：帮助管理和同步应用状态。
对话框和弹出层：用于弹出信息、提示或确认。
动画类组件：用于实现动画效果。
工具类组件：提供附加功能，帮助简化常见任务。
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 组件'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true, // 设置为可滚动
          tabs: const [
            Tab(text: '布局组件'),
            Tab(text: '显示组件'),
            Tab(text: '交互组件'),
            Tab(text: '导航组件'),
            Tab(text: '弹出组件'), // 添加弹出组件选项卡
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // 布局组件页
          _buildLayoutWidgetsGrid(),
          // 显示组件页
          _buildShowWidgetsGrid(),
          // 交互组件页
          _buildInteractiveWidgetsGrid(),
          // 导航组件页
          _buildNavigationWidgetsGrid(),
          // 弹出组件页
          _buildOverlayWidgetsGrid(), // 添加弹出组件页面
        ],
      ),
    );
  }

  Widget _buildLayoutWidgetsGrid() {
    return _buildWidgetGrid(WidgetRegistry.layoutWidgets);
  }

  Widget _buildShowWidgetsGrid() {
    return _buildWidgetGrid(WidgetRegistry.showWidgets);
  }

  Widget _buildInteractiveWidgetsGrid() {
    return _buildWidgetGrid(WidgetRegistry.interactiveWidgets);
  }

  // 添加导航组件网格构建方法
  Widget _buildNavigationWidgetsGrid() {
    return _buildWidgetGrid(WidgetRegistry.navigationWidgets);
  }
  
  // 添加弹出组件网格构建方法
  Widget _buildOverlayWidgetsGrid() {
    return _buildWidgetGrid(WidgetRegistry.overlayWidgets);
  }

  Widget _buildWidgetGrid(List<WidgetDemo> widgets) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // 网格最大宽度 200px，自动计算列数
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        final widget = widgets[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              _showWidgetDetails(context, widget);
            },
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 32,
                  color: widget.color,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showWidgetDetails(BuildContext context, WidgetDemo widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WidgetDetailPage(widget: widget),
      ),
    );
  }
}

class WidgetDetailPage extends StatelessWidget {
  final WidgetDemo widget;
  
  const WidgetDetailPage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return widget.buildDetailPage();
  }
}
