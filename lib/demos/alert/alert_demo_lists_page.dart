import 'package:flutter/material.dart';
import '/jh_common/widgets/jh_text_list.dart';
import '/project/routes/jh_nav_utils.dart';

class AlertDemoListsPage extends StatelessWidget {
  final List titleData = [
    '底部弹框',
    '中间弹框',
    'toast',
    'JhToast',
    'JhDialog',
    '级联选择器（多维数组结构数据）',
    '级级选择器（树形结构数据、支持搜索）',
  ];
  final List routeData = [
    'BottomSheetTest',
    'AlertTestPage',
    'ToastDemoListsPage',
    'ToastTestPage',
    'JhDialogTestPage',
    'CascadePickerTest',
    'CascadeTreePickerTest'
  ];

  @override
  Widget build(BuildContext context) {
    return JhTextList(
      title: 'AlertDemoLists',
      dataArr: titleData,
      callBack: (index, str) {
        JhNavUtils.pushNamed(context, routeData[index]);
      },
    );
  }
}
