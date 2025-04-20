import 'package:flutter/material.dart';

import 'home_tab/WidgetGalleryPage.dart';
import 'home_tab/TutorialPage.dart';
import 'home_tab/LearningCenterPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}



class _MainPage extends State<MainPage> {
  int _selectedIndex = 0;
  
  static const List<Widget> _pages = [
    WidgetGalleryPage(),
    TutorialPage(),
    LearningCenterPage(),  
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: '组件',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: '教程',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '学习',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
