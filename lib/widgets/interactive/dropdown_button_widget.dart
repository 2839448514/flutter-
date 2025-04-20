import 'package:flutter/material.dart';
import '../widget_demo.dart';

class DropdownButtonWidgetDemo extends WidgetDemo {
  DropdownButtonWidgetDemo()
      : super(
          name: 'DropdownButton',
          description: 'DropdownButton 显示一个下拉菜单，让用户从多个选项中选择一个。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: r'''DropdownButton<T>({
  Key? key,
  required List<DropdownMenuItem<T>> items, // 下拉菜单项列表
  DropdownButtonBuilder? selectedItemBuilder, // 自定义选中项的构建器
  T? value,                               // 当前选中值
  Widget? hint,                           // 未选择时的提示
  Widget? disabledHint,                   // 禁用时的提示
  required ValueChanged<T?>? onChanged,   // 值改变时的回调
  VoidCallback? onTap,                    // 点击回调
  int elevation = 8,                      // 阴影高度
  TextStyle? style,                       // 文本样式
  Widget? icon,                           // 图标
  Color? iconDisabledColor,               // 禁用时图标颜色
  Color? iconEnabledColor,                // 启用时图标颜色
  double iconSize = 24.0,                 // 图标大小
  bool isDense = false,                   // 是否紧凑
  bool isExpanded = false,                // 是否扩展以填充父级
  double? itemHeight = kMinInteractiveDimension, // 项目高度
  Color? focusColor,                      // 获取焦点时颜色
  FocusNode? focusNode,                   // 焦点节点
  bool autofocus = false,                 // 是否自动获取焦点
  Color? dropdownColor,                   // 下拉菜单背景色
  double? menuMaxHeight,                  // 菜单最大高度
  bool? enableFeedback,                   // 是否启用反馈
  AlignmentGeometry alignment = AlignmentDirectional.centerStart, // 对齐方式
  BorderRadius? borderRadius,             // 边框圆角
  // 其他参数...
})''')],
          examples: [
            DemoItem(
              description: '基本用法',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String dropdownValue = '苹果';
    
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['苹果', '香蕉', '橙子', '西瓜']
        .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String dropdownValue = '苹果';
                  
                  return DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['苹果', '香蕉', '橙子', '西瓜']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '带有提示的下拉框',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String? selectedCity;
    
    return DropdownButton<String>(
      value: selectedCity,
      hint: Text('请选择城市'),
      onChanged: (String? newValue) {
        setState(() {
          selectedCity = newValue!;
        });
      },
      items: <String>['北京', '上海', '广州', '深圳', '成都']
        .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String? selectedCity;
                  
                  return DropdownButton<String>(
                    value: selectedCity,
                    hint: const Text('请选择城市'),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue!;
                      });
                    },
                    items: <String>['北京', '上海', '广州', '深圳', '成都']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '自定义样式',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String currentItem = '选项 1';
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple, width: 2),
      ),
      child: DropdownButton<String>(
        value: currentItem,
        icon: Icon(Icons.arrow_drop_down, color: Colors.purple),
        iconSize: 30,
        elevation: 16,
        style: TextStyle(color: Colors.purple, fontSize: 16),
        underline: Container(height: 0), // 去除下划线
        isExpanded: true,
        onChanged: (String? newValue) {
          setState(() {
            currentItem = newValue!;
          });
        },
        items: <String>['选项 1', '选项 2', '选项 3', '选项 4', '选项 5']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
      ),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String currentItem = '选项 1';
                  
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.purple, width: 2),
                    ),
                    child: DropdownButton<String>(
                      value: currentItem,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.purple),
                      iconSize: 30,
                      elevation: 16,
                      style: const TextStyle(color: Colors.purple, fontSize: 16),
                      underline: Container(height: 0), // 去除下划线
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          currentItem = newValue!;
                        });
                      },
                      items: <String>['选项 1', '选项 2', '选项 3', '选项 4', '选项 5']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    ),
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '下拉菜单带图标',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String selectedFruit = 'Apple';
    
    Map<String, IconData> fruits = {
      'Apple': Icons.apple,
      'Banana': Icons.emoji_food_beverage,
      'Orange': Icons.circle,
      'Mango': Icons.square,
      'Grapes': Icons.scatter_plot,
    };
    
    return DropdownButton<String>(
      value: selectedFruit,
      onChanged: (String? newValue) {
        setState(() {
          selectedFruit = newValue!;
        });
      },
      items: fruits.entries
        .map<DropdownMenuItem<String>>((entry) {
          return DropdownMenuItem<String>(
            value: entry.key,
            child: Row(
              children: [
                Icon(entry.value, color: Colors.amber),
                SizedBox(width: 10),
                Text(entry.key),
              ],
            ),
          );
        }).toList(),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String selectedFruit = 'Apple';
                  
                  Map<String, IconData> fruits = {
                    'Apple': Icons.apple,
                    'Banana': Icons.emoji_food_beverage,
                    'Orange': Icons.circle,
                    'Mango': Icons.square,
                    'Grapes': Icons.scatter_plot,
                  };
                  
                  return DropdownButton<String>(
                    value: selectedFruit,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFruit = newValue!;
                      });
                    },
                    items: fruits.entries
                      .map<DropdownMenuItem<String>>((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.key,
                          child: Row(
                            children: [
                              Icon(entry.value, color: Colors.amber),
                              const SizedBox(width: 10),
                              Text(entry.key),
                            ],
                          ),
                        );
                      }).toList(),
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '在表单中使用',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    String? selectedCategory;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('选择产品类别：'),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCategory,
              hint: Text('请选择类别'),
              icon: Icon(Icons.keyboard_arrow_down),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              items: <String>['电子产品', '服装', '家居', '食品', '图书']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text('选择产品名称：'),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '请输入产品名称',
          ),
        ),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  String? selectedCategory;
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('选择产品类别：'),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCategory,
                            hint: const Text('请选择类别'),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            },
                            items: <String>['电子产品', '服装', '家居', '食品', '图书']
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('选择产品名称：'),
                      const SizedBox(height: 8),
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '请输入产品名称',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
          icon: Icons.arrow_drop_down_circle,
          color: Colors.deepPurple,
        );
}
