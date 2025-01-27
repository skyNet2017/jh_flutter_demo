import 'package:flutter/material.dart';
import '/jh_common/jh_form/jh_textfield.dart';
import '/project/configs/colors.dart';
import '/project/routes/jh_nav_utils.dart';

class SearchTest2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:

//      cursorColor: Colors.white, // 设置光标
          AppBar(
        backgroundColor: KColors.kThemeColor,
        titleSpacing: 0,
        title: _searchBar(context),
        actions: <Widget>[
          IconButton(
              icon:
//              ImageIcon(AssetImage("images/more.png",),color: Colors.white,size: 30,),
                  Icon(Icons.more_horiz, color: Colors.white),
              onPressed: () {}),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: ElevatedButton(
        child: Text("返回"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  _searchBar(context) {
    return GestureDetector(
      child: Container(
        decoration: new BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0), // 灰色的一层边框
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        alignment: Alignment.center,
        height: 38,
//           padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: JhTextField(
          enabled: false,
          leftWidget: Icon(
            Icons.search,
            size: 30,
          ),
          hintText: '请输入搜索信息',
        ),
      ),
      onTap: () {
        JhNavUtils.pushNamed(context, 'SiteSearchPage');
      },
    );
  }
}
