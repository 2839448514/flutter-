import 'package:flutter/material.dart';
import '../widget_demo.dart';

class CheckboxWidgetDemo extends WidgetDemo {
  CheckboxWidgetDemo()
      : super(
          name: 'Checkbox',
          description: 'Checkbox 是一个允许用户从一组中选择多个选项的组件。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: r'''const Checkbox({
  Key? key,
  required bool? value,                     // 复选框的值（true: 选中, false: 未选中, null: 不确定状态）
  required ValueChanged<bool?>? onChanged,  // 值变化时的回调函数
  MouseCursor? mouseCursor,                 // 鼠标指针样式
  Color? activeColor,                       // 选中时的颜色
  Color? fillColor,                         // 填充颜色
  Color? checkColor,                        // 勾选标记的颜色
  Color? focusColor,                        // 获取焦点时的颜色
  Color? hoverColor,                        // 悬停时的颜色
  MaterialStateProperty<Color?>? overlayColor, // 水波纹颜色
  double? splashRadius,                     // 水波纹半径
  FocusNode? focusNode,                     // 焦点节点
  bool autofocus = false,                   // 是否自动获取焦点
  MaterialTapTargetSize? materialTapTargetSize, // 触摸目标大小
  VisualDensity? visualDensity,             // 视觉密度
  bool tristate = false,                    // 是否允许三种状态
  OutlinedBorder? shape,                    // 形状
  BorderSide? side,                         // 边框
})''')],
          examples: [
            DemoItem(
              description: '基本用法',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool isChecked = false;
    
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool isChecked = false;
                  
                  return Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '带标签的 Checkbox',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool isAccepted = false;
    
    return Row(
      children: [
        Checkbox(
          value: isAccepted,
          onChanged: (bool? value) {
            setState(() {
              isAccepted = value!;
            });
          },
        ),
        const Text('我同意服务条款和隐私政策'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool isAccepted = false;
                  
                  return Row(
                    children: [
                      Checkbox(
                        value: isAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            isAccepted = value!;
                          });
                        },
                      ),
                      const Text('我同意服务条款和隐私政策'),
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
    bool isChecked = true;
    
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      activeColor: Colors.green,  // 选中时的背景颜色
      checkColor: Colors.white,   // 对勾的颜色
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool isChecked = true;
                  
                  return Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '三态 Checkbox',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool? tristateValue = true;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          tristate: true,
          value: tristateValue,
          onChanged: (bool? value) {
            setState(() {
              // null -> true -> false -> null 循环
              if (tristateValue == null) {
                tristateValue = true;
              } else if (tristateValue == true) {
                tristateValue = false;
              } else {
                tristateValue = null;
              }
            });
          },
        ),
        const SizedBox(height: 8),
        Text(
          'Checkbox 状态: ${tristateValue == null ? "不确定" : (tristateValue! ? "选中" : "未选中")}'
        ),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool? tristateValue = true;
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        tristate: true,
                        value: tristateValue,
                        onChanged: (bool? value) {
                          setState(() {
                            // null -> true -> false -> null 循环
                            if (tristateValue == null) {
                              tristateValue = true;
                            } else if (tristateValue == true) {
                              tristateValue = false;
                            } else {
                              tristateValue = null;
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Checkbox 状态: ${tristateValue == null ? "不确定" : (tristateValue! ? "选中" : "未选中")}'
                      ),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '带 ListTile 的 Checkbox',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    bool isSelected = false;
    
    return CheckboxListTile(
      title: const Text('通知'),
      subtitle: const Text('是否接收应用通知'),
      value: isSelected,
      onChanged: (bool? value) {
        setState(() {
          isSelected = value!;
        });
      },
      secondary: const Icon(Icons.notifications),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  bool isSelected = false;
                  
                  return CheckboxListTile(
                    title: const Text('通知'),
                    subtitle: const Text('是否接收应用通知'),
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelected = value!;
                      });
                    },
                    secondary: const Icon(Icons.notifications),
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '多个复选框列表',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    List<bool> values = [true, false, true];
    List<String> items = ['苹果 🍎', '香蕉 🍌', '樱桃 🍒'];
    
    return Column(
      children: List<Widget>.generate(
        items.length,
        (index) => CheckboxListTile(
          title: Text(items[index]),
          value: values[index],
          onChanged: (bool? value) {
            setState(() {
              values[index] = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading, // 将复选框放在前面
        ),
      ),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  List<bool> values = [true, false, true];
                  List<String> items = ['苹果 🍎', '香蕉 🍌', '樱桃 🍒'];
                  
                  return Column(
                    children: List<Widget>.generate(
                      items.length,
                      (index) => CheckboxListTile(
                        title: Text(items[index]),
                        value: values[index],
                        onChanged: (bool? value) {
                          setState(() {
                            values[index] = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading, // 将复选框放在前面
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          icon: Icons.check_box,
          color: Colors.blue,
        );
}
