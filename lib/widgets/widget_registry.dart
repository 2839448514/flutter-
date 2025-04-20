import 'interactive/checkboxwidget.dart';
import 'layout/expandedwidget.dart';
import 'layout/gridviewwidget.dart';
import 'layout/listviewwidget.dart';
import 'layout/row_widget.dart';
import 'layout/stackwidget.dart';
import 'widget_demo.dart';
import 'display/text_widget.dart';
import 'display/image_widget.dart';
import 'display/icon_widget.dart';
import 'display/button_widget.dart';
import 'display/textfield_widget.dart';
import 'layout/column_widget.dart';
import 'layout/container_widget.dart';
import 'interactive/gesture_detector_widget.dart';
import 'display/chip_widget.dart';
// 导入导航组件
import 'navigation/appbar_widget.dart';
import 'navigation/drawer_widget.dart';
import 'navigation/navigation_bar_widget.dart';
import 'navigation/tab_bar_widget.dart';
// 导入弹出组件
import 'overlay/dialog_widget.dart';
import 'overlay/alert_dialog_widget.dart';
import 'overlay/bottom_sheet_widget.dart';
import 'overlay/snackbar_widget.dart';
import 'overlay/tooltip_widget.dart';
// 导入新增交互组件
import 'interactive/radio_widget.dart';
import 'interactive/switch_widget.dart';
import 'interactive/slider_widget.dart';
import 'interactive/dropdown_button_widget.dart';


class WidgetRegistry {
  // 基础组件
  static final List<WidgetDemo> showWidgets = [
    TextWidgetDemo(),
    ImageWidgetDemo(),
    IconWidgetDemo(),
    ButtonWidgetDemo(),
    TextFieldWidgetDemo(),
    ChipWidgetDemo(),
  ];

  // 布局组件
  static final List<WidgetDemo> layoutWidgets = [
    ColumnWidgetDemo(),
    ContainerWidgetDemo(),
    RowWidgetDemo(),
    GridViewWidgetDemo(),
    StackWidgetDemo(),
    ExpandedWidgetDemo(),
    ListViewWidgetDemo(),
  ];

  // 交互组件
  static final List<WidgetDemo> interactiveWidgets = [
    GestureDetectorWidgetDemo(),
    TextFieldWidgetDemo(),
    CheckboxWidgetDemo(),
    RadioWidgetDemo(),         // 添加 Radio 组件
    SwitchWidgetDemo(),        // 添加 Switch 组件
    SliderWidgetDemo(),        // 添加 Slider 组件
    DropdownButtonWidgetDemo(), // 添加 DropdownButton 组件
  ];
  
  // 导航组件列表
  static final List<WidgetDemo> navigationWidgets = [
    AppBarWidgetDemo(),
    DrawerWidgetDemo(),
    NavigationBarWidgetDemo(),
    TabBarWidgetDemo(),
  ];

  // 弹出组件列表
  static final List<WidgetDemo> overlayWidgets = [
    DialogWidgetDemo(),
    AlertDialogWidgetDemo(),
    BottomSheetWidgetDemo(),
    SnackBarWidgetDemo(),
    TooltipWidgetDemo(),
  ];

  // 获取所有组件
  static List<WidgetDemo> getAllWidgets() {
    return [
      ...showWidgets,
      ...layoutWidgets,
      ...interactiveWidgets,
      ...navigationWidgets,
      ...overlayWidgets,
    ];
  }

  // 根据名称查找组件
  static WidgetDemo findWidgetByName(String name) {
    return getAllWidgets().firstWhere(
      (widget) => widget.name == name,
      orElse: () => throw Exception('Widget not found: $name'),
    );
  }

  // 根据类别获取组件
  static List<WidgetDemo> getWidgetsByCategory(String category) {
    switch (category) {
      case 'display':
        return showWidgets;
      case 'layout':
        return layoutWidgets;
      case 'interactive':
        return interactiveWidgets;
      case 'navigation':
        return navigationWidgets;
      case 'overlay':
        return overlayWidgets;
      default:
        throw Exception('Invalid category: $category');
    }
  }
}