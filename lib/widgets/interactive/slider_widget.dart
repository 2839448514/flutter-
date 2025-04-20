import 'package:flutter/material.dart';
import '../widget_demo.dart';

class SliderWidgetDemo extends WidgetDemo {
  SliderWidgetDemo()
      : super(
          name: 'Slider',
          description: 'Slider 是一个允许用户通过滑动选择一个范围内的值的组件。',
    constructors: [
    ConstructorItem(
    name: 'TabBar',
    code: r'''Slider({
  Key? key,
  required double value,                 // 当前值
  required ValueChanged<double>? onChanged, // 值改变时的回调
  ValueChanged<double>? onChangeStart,   // 开始改变值的回调
  ValueChanged<double>? onChangeEnd,     // 结束改变值的回调
  double min = 0.0,                      // 最小值
  double max = 1.0,                      // 最大值
  int? divisions,                        // 分段数
  String? label,                         // 标签文本
  Color? activeColor,                    // 激活部分颜色
  Color? inactiveColor,                  // 未激活部分颜色
  Color? thumbColor,                     // 滑块颜色
  MouseCursor? mouseCursor,              // 鼠标指针样式
  SemanticFormatterCallback? semanticFormatterCallback, // 语义格式化回调
  FocusNode? focusNode,                  // 焦点节点
  bool autofocus = false,                // 是否自动获取焦点
  // 其他参数...
})''')],
          examples: [
            DemoItem(
              description: '基本使用',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    double _value = 0.5;
    
    return Column(
      children: [
        Slider(
          value: _value,
          onChanged: (double value) {
            setState(() {
              _value = value;
            });
          },
        ),
        Text('当前值：${(_value * 100).round()}%'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  double _value = 0.5;
                  
                  return Column(
                    children: [
                      Slider(
                        value: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      Text('当前值：${(_value * 100).round()}%'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '带分段的滑块',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    double _value = 20;
    
    return Column(
      children: [
        Slider(
          value: _value,
          min: 0,
          max: 100,
          divisions: 10, // 将范围平均分成10份
          label: '${_value.round()}',
          onChanged: (double value) {
            setState(() {
              _value = value;
            });
          },
        ),
        Text('当前温度：${_value.round()}°C'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  double _value = 20;
                  
                  return Column(
                    children: [
                      Slider(
                        value: _value,
                        min: 0,
                        max: 100,
                        divisions: 10,
                        label: '${_value.round()}',
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      Text('当前温度：${_value.round()}°C'),
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
    double _value = 50;
    
    return Column(
      children: [
        Slider(
          value: _value,
          min: 0,
          max: 100,
          activeColor: Colors.purple,     // 已滑过的轨道颜色
          inactiveColor: Colors.purple.withOpacity(0.2), // 未滑过的轨道颜色
          thumbColor: Colors.deepPurple,  // 滑块颜色
          onChanged: (double value) {
            setState(() {
              _value = value;
            });
          },
        ),
        Text('当前值：${_value.round()}'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  double _value = 50;
                  
                  return Column(
                    children: [
                      Slider(
                        value: _value,
                        min: 0,
                        max: 100,
                        activeColor: Colors.purple,
                        inactiveColor: Colors.purple.withOpacity(0.2),
                        thumbColor: Colors.deepPurple,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      Text('当前值：${_value.round()}'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '带回调函数的滑块',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    double _value = 50;
    String _status = '拖动滑块';
    
    return Column(
      children: [
        Slider(
          value: _value,
          min: 0,
          max: 100,
          onChanged: (double value) {
            setState(() {
              _value = value;
            });
          },
          onChangeStart: (double value) {
            setState(() {
              _status = '开始拖动';
            });
          },
          onChangeEnd: (double value) {
            setState(() {
              _status = '结束拖动，当前值: ${value.round()}';
            });
          },
        ),
        Text('状态：$_status'),
        Text('当前值：${_value.round()}'),
      ],
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  double _value = 50;
                  String _status = '拖动滑块';
                  
                  return Column(
                    children: [
                      Slider(
                        value: _value,
                        min: 0,
                        max: 100,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        onChangeStart: (double value) {
                          setState(() {
                            _status = '开始拖动';
                          });
                        },
                        onChangeEnd: (double value) {
                          setState(() {
                            _status = '结束拖动，当前值: ${value.round()}';
                          });
                        },
                      ),
                      Text('状态：$_status'),
                      Text('当前值：${_value.round()}'),
                    ],
                  );
                },
              ),
            ),
            
            DemoItem(
              description: '自定义滑块组合示例',
              code: r'''
StatefulBuilder(
  builder: (context, setState) {
    double _volume = 30;
    double _brightness = 70;
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.volume_down, color: Colors.blue),
              Expanded(
                child: Slider(
                  value: _volume,
                  min: 0,
                  max: 100,
                  activeColor: Colors.blue,
                  label: '${_volume.round()}',
                  onChanged: (value) {
                    setState(() {
                      _volume = value;
                    });
                  },
                ),
              ),
              Icon(Icons.volume_up, color: Colors.blue),
              SizedBox(width: 8),
              Container(
                width: 40,
                child: Text('${_volume.round()}%'),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.brightness_low, color: Colors.orange),
              Expanded(
                child: Slider(
                  value: _brightness,
                  min: 0,
                  max: 100,
                  activeColor: Colors.orange,
                  label: '${_brightness.round()}',
                  onChanged: (value) {
                    setState(() {
                      _brightness = value;
                    });
                  },
                ),
              ),
              Icon(Icons.brightness_high, color: Colors.orange),
              SizedBox(width: 8),
              Container(
                width: 40,
                child: Text('${_brightness.round()}%'),
              ),
            ],
          ),
        ],
      ),
    );
  },
)''',
              demo: StatefulBuilder(
                builder: (context, setState) {
                  double _volume = 30;
                  double _brightness = 70;
                  
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.volume_down, color: Colors.blue),
                            Expanded(
                              child: Slider(
                                value: _volume,
                                min: 0,
                                max: 100,
                                activeColor: Colors.blue,
                                label: '${_volume.round()}',
                                onChanged: (value) {
                                  setState(() {
                                    _volume = value;
                                  });
                                },
                              ),
                            ),
                            const Icon(Icons.volume_up, color: Colors.blue),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 40,
                              child: Text('${_volume.round()}%'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.brightness_low, color: Colors.orange),
                            Expanded(
                              child: Slider(
                                value: _brightness,
                                min: 0,
                                max: 100,
                                activeColor: Colors.orange,
                                label: '${_brightness.round()}',
                                onChanged: (value) {
                                  setState(() {
                                    _brightness = value;
                                  });
                                },
                              ),
                            ),
                            const Icon(Icons.brightness_high, color: Colors.orange),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 40,
                              child: Text('${_brightness.round()}%'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
          icon: Icons.tune,
          color: Colors.orange,
        );
}
