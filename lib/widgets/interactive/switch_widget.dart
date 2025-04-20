import 'package:flutter/material.dart';
import '../widget_demo.dart';

class SwitchWidgetDemo extends WidgetDemo {
  SwitchWidgetDemo()
      : super(
          name: 'Switch',
          description: 'Switch 是一个切换开关组件，允许用户在两种状态之间切换。常用于设置或偏好的开启/关闭。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: r'''Switch({
  Key? key,
  required bool value,                   // 当前值
  required ValueChanged<bool>? onChanged, // 值改变时的回调
  Color? activeColor,                    // 激活状态的主要颜色
  Color? activeTrackColor,               // 激活状态的轨道颜色
  Color? inactiveThumbColor,             // 未激活状态的拇指颜色
  Color? inactiveTrackColor,             // 未激活状态的轨道颜色
  ImageProvider<Object>? activeThumbImage, // 激活状态的拇指图片
  ImageErrorListener? onActiveThumbImageError, // 激活拇指图片加载错误回调
  ImageProvider<Object>? inactiveThumbImage, // 未激活状态的拇指图片
  ImageErrorListener? onInactiveThumbImageError, // 未激活拇指图片加载错误回调
  MaterialStateProperty<Color?>? thumbColor, // 拇指颜色
  MaterialStateProperty<Color?>? trackColor, // 轨道颜色
  MaterialStateProperty<Icon?>? thumbIcon, // 拇指图标
  MaterialTapTargetSize? materialTapTargetSize, // 轻触目标尺寸
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, // 拖拽开始行为
  MouseCursor? mouseCursor,              // 鼠标指针样式
  Color? focusColor,                     // 获取焦点时的颜色
  Color? hoverColor,                     // 鼠标悬停时的颜色
  MaterialStateProperty<Color?>? overlayColor, // 水波纹颜色
  double? splashRadius,                  // 水波纹半径
  FocusNode? focusNode,                  // 焦点节点
  bool autofocus = false,                // 是否自动获取焦点
})''')],
          examples: [
            DemoItem(
              description: '基本使用',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool isOn = true;
    
    return Row(
      children: [
        Switch(
          value: isOn,
          onChanged: (bool value) {
            setState(() {
              isOn = value;
            });
          },
        ),
        SizedBox(width: 8),
        Text(isOn ? '开启' : '关闭'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool isOn = true;
                  
                  return Row(
                    children: [
                      Switch(
                        value: isOn,
                        onChanged: (bool value) {
                          setState(() {
                            isOn = value;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(isOn ? '开启' : '关闭'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '自定义颜色',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool isNightMode = false;
    
    return Row(
      children: [
        Switch(
          value: isNightMode,
          onChanged: (bool value) {
            setState(() {
              isNightMode = value;
            });
          },
          activeColor: Colors.blue,       // 激活状态下的拇指颜色
          activeTrackColor: Colors.blue.withOpacity(0.4), // 激活状态下的轨道颜色
          inactiveThumbColor: Colors.grey, // 未激活状态下的拇指颜色
          inactiveTrackColor: Colors.grey.withOpacity(0.4), // 未激活状态下的轨道颜色
        ),
        SizedBox(width: 8),
        Text(isNightMode ? '夜间模式' : '日间模式'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool isNightMode = false;
                  
                  return Row(
                    children: [
                      Switch(
                        value: isNightMode,
                        onChanged: (bool value) {
                          setState(() {
                            isNightMode = value;
                          });
                        },
                        activeColor: Colors.blue,
                        activeTrackColor: Colors.blue.withOpacity(0.4),
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey.withOpacity(0.4),
                      ),
                      const SizedBox(width: 8),
                      Text(isNightMode ? '夜间模式' : '日间模式'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '使用 SwitchListTile',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool notificationsEnabled = true;
    bool darkModeEnabled = false;
    bool autoUpdateEnabled = true;
    
    return Column(
      children: [
        SwitchListTile(
          title: Text('通知'),
          subtitle: Text('启用应用通知'),
          value: notificationsEnabled,
          onChanged: (bool value) {
            setState(() {
              notificationsEnabled = value;
            });
          },
          secondary: Icon(Icons.notifications),
        ),
        Divider(),
        SwitchListTile(
          title: Text('深色模式'),
          subtitle: Text('使用深色主题'),
          value: darkModeEnabled,
          onChanged: (bool value) {
            setState(() {
              darkModeEnabled = value;
            });
          },
          secondary: Icon(Icons.dark_mode),
        ),
        Divider(),
        SwitchListTile(
          title: Text('自动更新'),
          subtitle: Text('启用应用自动更新'),
          value: autoUpdateEnabled,
          onChanged: (bool value) {
            setState(() {
              autoUpdateEnabled = value;
            });
          },
          secondary: Icon(Icons.system_update),
        ),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool notificationsEnabled = true;
                  bool darkModeEnabled = false;
                  bool autoUpdateEnabled = true;
                  
                  return Column(
                    children: [
                      SwitchListTile(
                        title: const Text('通知'),
                        subtitle: const Text('启用应用通知'),
                        value: notificationsEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            notificationsEnabled = value;
                          });
                        },
                        secondary: const Icon(Icons.notifications),
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text('深色模式'),
                        subtitle: const Text('使用深色主题'),
                        value: darkModeEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            darkModeEnabled = value;
                          });
                        },
                        secondary: const Icon(Icons.dark_mode),
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text('自动更新'),
                        subtitle: const Text('启用应用自动更新'),
                        value: autoUpdateEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            autoUpdateEnabled = value;
                          });
                        },
                        secondary: const Icon(Icons.system_update),
                      ),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '自定义 SwitchListTile',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool wifiEnabled = true;
    bool bluetoothEnabled = false;
    bool locationEnabled = true;
    
    return Column(
      children: [
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SwitchListTile(
            title: Text('Wi-Fi'),
            subtitle: Text(wifiEnabled ? '已连接' : '未连接'),
            value: wifiEnabled,
            onChanged: (bool value) {
              setState(() {
                wifiEnabled = value;
              });
            },
            secondary: Icon(
              Icons.wifi,
              color: wifiEnabled ? Colors.blue : Colors.grey,
            ),
            activeColor: Colors.blue,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            selected: wifiEnabled,
            selectedTileColor: Colors.blue.withOpacity(0.05),
          ),
        ),
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SwitchListTile(
            title: Text('蓝牙'),
            subtitle: Text(bluetoothEnabled ? '已开启' : '已关闭'),
            value: bluetoothEnabled,
            onChanged: (bool value) {
              setState(() {
                bluetoothEnabled = value;
              });
            },
            secondary: Icon(
              Icons.bluetooth,
              color: bluetoothEnabled ? Colors.blue : Colors.grey,
            ),
            activeColor: Colors.blue,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            selected: bluetoothEnabled,
            selectedTileColor: Colors.blue.withOpacity(0.05),
          ),
        ),
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SwitchListTile(
            title: Text('位置服务'),
            subtitle: Text(locationEnabled ? '已开启' : '已关闭'),
            value: locationEnabled,
            onChanged: (bool value) {
              setState(() {
                locationEnabled = value;
              });
            },
            secondary: Icon(
              Icons.location_on,
              color: locationEnabled ? Colors.blue : Colors.grey,
            ),
            activeColor: Colors.blue,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            selected: locationEnabled,
            selectedTileColor: Colors.blue.withOpacity(0.05),
          ),
        ),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool wifiEnabled = true;
                  bool bluetoothEnabled = false;
                  bool locationEnabled = true;
                  
                  return Column(
                    children: [
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: SwitchListTile(
                          title: const Text('Wi-Fi'),
                          subtitle: Text(wifiEnabled ? '已连接' : '未连接'),
                          value: wifiEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              wifiEnabled = value;
                            });
                          },
                          secondary: Icon(
                            Icons.wifi,
                            color: wifiEnabled ? Colors.blue : Colors.grey,
                          ),
                          activeColor: Colors.blue,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          selected: wifiEnabled,
                          selectedTileColor: Colors.blue.withOpacity(0.05),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: SwitchListTile(
                          title: const Text('蓝牙'),
                          subtitle: Text(bluetoothEnabled ? '已开启' : '已关闭'),
                          value: bluetoothEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              bluetoothEnabled = value;
                            });
                          },
                          secondary: Icon(
                            Icons.bluetooth,
                            color: bluetoothEnabled ? Colors.blue : Colors.grey,
                          ),
                          activeColor: Colors.blue,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          selected: bluetoothEnabled,
                          selectedTileColor: Colors.blue.withOpacity(0.05),
                        ),
                      ),
                      Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: SwitchListTile(
                          title: const Text('位置服务'),
                          subtitle: Text(locationEnabled ? '已开启' : '已关闭'),
                          value: locationEnabled,
                          onChanged: (bool value) {
                            setState(() {
                              locationEnabled = value;
                            });
                          },
                          secondary: Icon(
                            Icons.location_on,
                            color: locationEnabled ? Colors.blue : Colors.grey,
                          ),
                          activeColor: Colors.blue,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          selected: locationEnabled,
                          selectedTileColor: Colors.blue.withOpacity(0.05),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
          icon: Icons.toggle_on,
          color: Colors.green,
        );
}
