///  three_page.dart
///
///  Created by iotjin on 2019/08/14.
///  description: 发现

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:jhtoast/jhtoast.dart';
import '/jh_common/jh_form/jh_set_cell.dart';
import '/project/configs/project_config.dart';

class ThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context, KStrings.threeTabTitle, backgroundColor: Colors.transparent),
      body: _body(context),
      backgroundColor: KColors.dynamicColor(context, KColors.wxBgColor, KColors.kBgDarkColor),
    );
  }
}

double _cellH = 55.0;
double _leftSpace = 50.0;
double _rowSpace = 6;

Widget _body(context) {
  return ListView(
    children: <Widget>[
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_social_circle.png",
        title: '朋友圈',
        hiddenLine: true,
//      rightWidget: Image.network('https://gitee.com/iotjh/Picture/raw/master/lufei.png',width: 50,height: 50,),
        rightWidget: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Badge(
                padding: EdgeInsets.all(4),
                position: BadgePosition.topEnd(top: -4, end: -4),
                child: Image.asset('assets/images/lufei.png', width: 30, height: 30, fit: BoxFit.fill))),
        clickCallBack: () => _clickCell(context, '朋友圈'),
      ),
      SizedBox(height: _rowSpace),
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_video_number.png",
        title: '视频号',
        hiddenLine: true,
        clickCallBack: () => _clickCell(context, '视频号'),
      ),
      SizedBox(height: _rowSpace),
      JhSetCell(
        cellHeight: _cellH,
        lineLeftEdge: _leftSpace,
        leftImgPath: "assets/wechat/discover/ic_quick_scan.png",
        title: '扫一扫',
        clickCallBack: () => _clickCell(context, '扫一扫'),
      ),
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_shake_phone.png",
        title: '摇一摇',
        hiddenLine: true,
        clickCallBack: () => _clickCell(context, '摇一摇'),
      ),
      SizedBox(height: _rowSpace),
      JhSetCell(
        cellHeight: _cellH,
        lineLeftEdge: _leftSpace,
        leftImgPath: "assets/wechat/discover/ic_feeds.png",
        title: '看一看',
        clickCallBack: () => _clickCell(context, '看一看'),
      ),
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_quick_search.png",
        title: '搜一搜',
        hiddenLine: true,
        clickCallBack: () => _clickCell(context, '搜一搜'),
      ),
      SizedBox(height: _rowSpace),
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_people_nearby.png",
        title: '附近的人',
        hiddenLine: true,
        clickCallBack: () => _clickCell(context, '附近的人'),
      ),
      SizedBox(height: _rowSpace),
      JhSetCell(
        cellHeight: _cellH,
        lineLeftEdge: _leftSpace,
        leftImgPath: "assets/wechat/discover/ic_shopping.png",
        title: '购物',
        clickCallBack: () => _clickCell(context, '购物'),
      ),
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_game_entry.png",
        title: '游戏',
        hiddenLine: true,
        clickCallBack: () => _clickCell(context, '游戏'),
      ),
      SizedBox(height: _rowSpace),
      JhSetCell(
        cellHeight: _cellH,
        leftImgPath: "assets/wechat/discover/ic_mini_program.png",
        title: '小程序',
        hiddenLine: true,
        clickCallBack: () => _clickCell(context, '小程序'),
      ),
      SizedBox(height: 15),
    ],
  );
}

// 点击cell
_clickCell(context, text) {
  // JhToast.showText(context, msg: '点击 $text');

  if (text == '朋友圈') {
    JhNavUtils.pushNamed(context, 'WxFriendsCirclePage');
  }
}

Widget testBtn(context) {
  return Container(
      alignment: Alignment.center,
      // 子组件将以何种方式进行排列
      margin: EdgeInsets.all(20),
      // 容器外补白
      color: Colors.yellow,
      width: 200,
      height: 200,
      child: ElevatedButton(
//        color: Colors.red,
        child: Text("点击跳转"),
        onPressed: () {
          print('onPressed');
          JhNavUtils.pushNamed(context, "UIDemoListsPage");
//          Navigator.push(context, MaterialPageRoute(builder: (context) => (UIDemoListsPage())));// 普通路由
//          Navigator.push(context, MaterialPageRoute(builder: (context) => (testPage(content: "这是route传递的参数",))));// 普通路由
//          JhNavUtils.pushNamed(context,'/Test');// 命名路由
        },
      ));
}
