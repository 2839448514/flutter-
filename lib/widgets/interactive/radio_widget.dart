import 'package:flutter/material.dart';
import '../widget_demo.dart';

class RadioWidgetDemo extends WidgetDemo {
  RadioWidgetDemo()
      : super(
          name: 'Radio',
          description: 'Radio 是一个单选组件，允许用户从一组选项中选择一个。通常和 RadioListTile 配合使用，或者组合成 RadioGroup。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: r'''const Radio({
  Key? key,
  required T value,                      // 此单选按钮的值
  required T? groupValue,                // 当前组选中的值
  required ValueChanged<T?>? onChanged,  // 选中状态改变时的回调
  MouseCursor? mouseCursor,              // 鼠标指针样式
  bool toggleable = false,               // 是否可以切换到null状态
  Color? activeColor,                    // 选中时的颜色
  Color? fillColor,                      // 填充颜色
  Color? focusColor,                     // 获取焦点时的颜色
  Color? hoverColor,                     // 鼠标悬停时的颜色
  MaterialStateProperty<Color?>? overlayColor, // 水波纹颜色
  double? splashRadius,                  // 水波纹半径
  MaterialTapTargetSize? materialTapTargetSize, // 轻触目标大小
  VisualDensity? visualDensity,          // 视觉密度
  FocusNode? focusNode,                  // 焦点节点
  bool autofocus = false,                // 是否自动获取焦点
})''')],
          examples: [
            DemoItem(
              description: '基本使用',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String selectedValue = 'Option A';
    
    return Column(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Option A',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            Text('选项 A'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Option B',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            Text('选项 B'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Option C',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
            Text('选项 C'),
          ],
        ),
        SizedBox(height: 16),
        Text('当前选中: $selectedValue'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String selectedValue = 'Option A';
                  
                  return Column(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Option A',
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          const Text('选项 A'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Option B',
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          const Text('选项 B'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Option C',
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          const Text('选项 C'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text('当前选中: $selectedValue'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '使用 RadioListTile',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    int selectedValue = 1;
    
    return Column(
      children: [
        RadioListTile<int>(
          title: Text('企业用户'),
          subtitle: Text('适用于公司和组织'),
          value: 1,
          groupValue: selectedValue,
          onChanged: (int? value) {
            setState(() {
              selectedValue = value!;
            });
          },
          secondary: Icon(Icons.business),
        ),
        RadioListTile<int>(
          title: Text('个人用户'),
          subtitle: Text('适用于个人使用'),
          value: 2,
          groupValue: selectedValue,
          onChanged: (int? value) {
            setState(() {
              selectedValue = value!;
            });
          },
          secondary: Icon(Icons.person),
        ),
        RadioListTile<int>(
          title: Text('开发者'),
          subtitle: Text('适用于开发人员'),
          value: 3,
          groupValue: selectedValue,
          onChanged: (int? value) {
            setState(() {
              selectedValue = value!;
            });
          },
          secondary: Icon(Icons.code),
        ),
        SizedBox(height: 16),
        Text('当前选中: ${selectedValue == 1 ? "企业用户" : selectedValue == 2 ? "个人用户" : "开发者"}'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  int selectedValue = 1;
                  
                  return Column(
                    children: [
                      RadioListTile<int>(
                        title: const Text('企业用户'),
                        subtitle: const Text('适用于公司和组织'),
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        secondary: const Icon(Icons.business),
                      ),
                      RadioListTile<int>(
                        title: const Text('个人用户'),
                        subtitle: const Text('适用于个人使用'),
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        secondary: const Icon(Icons.person),
                      ),
                      RadioListTile<int>(
                        title: const Text('开发者'),
                        subtitle: const Text('适用于开发人员'),
                        value: 3,
                        groupValue: selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        secondary: const Icon(Icons.code),
                      ),
                      const SizedBox(height: 16),
                      Text('当前选中: ${selectedValue == 1 ? "企业用户" : selectedValue == 2 ? "个人用户" : "开发者"}'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '自定义样式',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String selectedValue = 'Apple';
    
    return Column(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'Apple',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              activeColor: Colors.red,
            ),
            Text('苹果'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Banana',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              activeColor: Colors.yellow[700],
            ),
            Text('香蕉'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Grape',
              groupValue: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value!;
                });
              },
              activeColor: Colors.purple,
            ),
            Text('葡萄'),
          ],
        ),
        SizedBox(height: 16),
        Text('当前选中: $selectedValue'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String selectedValue = 'Apple';
                  
                  return Column(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Apple',
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors.red,
                          ),
                          const Text('苹果'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Banana',
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors.yellow[700],
                          ),
                          const Text('香蕉'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Grape',
                            groupValue: selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                            activeColor: Colors.purple,
                          ),
                          const Text('葡萄'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text('当前选中: $selectedValue'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '自定义 RadioListTile',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String selectedPayment = 'credit_card';
    
    return Column(
      children: <Widget>[
        Card(
          child: RadioListTile<String>(
            title: Row(
              children: [
                Icon(Icons.credit_card),
                SizedBox(width: 8),
                Text('信用卡'),
              ],
            ),
            value: 'credit_card',
            groupValue: selectedPayment,
            onChanged: (String? value) {
              setState(() {
                selectedPayment = value!;
              });
            },
            selected: selectedPayment == 'credit_card',
            activeColor: Colors.blue,
            selectedTileColor: Colors.blue.withOpacity(0.1),
          ),
        ),
        Card(
          child: RadioListTile<String>(
            title: Row(
              children: [
                Icon(Icons.account_balance),
                SizedBox(width: 8),
                Text('银行转账'),
              ],
            ),
            value: 'bank_transfer',
            groupValue: selectedPayment,
            onChanged: (String? value) {
              setState(() {
                selectedPayment = value!;
              });
            },
            selected: selectedPayment == 'bank_transfer',
            activeColor: Colors.blue,
            selectedTileColor: Colors.blue.withOpacity(0.1),
          ),
        ),
        Card(
          child: RadioListTile<String>(
            title: Row(
              children: [
                Icon(Icons.account_balance_wallet),
                SizedBox(width: 8),
                Text('电子钱包'),
              ],
            ),
            value: 'e_wallet',
            groupValue: selectedPayment,
            onChanged: (String? value) {
              setState(() {
                selectedPayment = value!;
              });
            },
            selected: selectedPayment == 'e_wallet',
            activeColor: Colors.blue,
            selectedTileColor: Colors.blue.withOpacity(0.1),
          ),
        ),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String selectedPayment = 'credit_card';
                  
                  return Column(
                    children: <Widget>[
                      Card(
                        child: RadioListTile<String>(
                          title: Row(
                            children: [
                              const Icon(Icons.credit_card),
                              const SizedBox(width: 8),
                              const Text('信用卡'),
                            ],
                          ),
                          value: 'credit_card',
                          groupValue: selectedPayment,
                          onChanged: (String? value) {
                            setState(() {
                              selectedPayment = value!;
                            });
                          },
                          selected: selectedPayment == 'credit_card',
                          activeColor: Colors.blue,
                          selectedTileColor: Colors.blue.withOpacity(0.1),
                        ),
                      ),
                      Card(
                        child: RadioListTile<String>(
                          title: Row(
                            children: [
                              const Icon(Icons.account_balance),
                              const SizedBox(width: 8),
                              const Text('银行转账'),
                            ],
                          ),
                          value: 'bank_transfer',
                          groupValue: selectedPayment,
                          onChanged: (String? value) {
                            setState(() {
                              selectedPayment = value!;
                            });
                          },
                          selected: selectedPayment == 'bank_transfer',
                          activeColor: Colors.blue,
                          selectedTileColor: Colors.blue.withOpacity(0.1),
                        ),
                      ),
                      Card(
                        child: RadioListTile<String>(
                          title: Row(
                            children: [
                              const Icon(Icons.account_balance_wallet),
                              const SizedBox(width: 8),
                              const Text('电子钱包'),
                            ],
                          ),
                          value: 'e_wallet',
                          groupValue: selectedPayment,
                          onChanged: (String? value) {
                            setState(() {
                              selectedPayment = value!;
                            });
                          },
                          selected: selectedPayment == 'e_wallet',
                          activeColor: Colors.blue,
                          selectedTileColor: Colors.blue.withOpacity(0.1),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
          icon: Icons.radio_button_checked,
          color: Colors.blue,
        );
}
