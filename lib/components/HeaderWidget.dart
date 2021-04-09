import 'package:flutter/material.dart';
import 'package:gnews/main.dart';
import 'package:gnews/utils/Common.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class HeaderWidget extends StatelessWidget {
  static String tag = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: defaultBoxShadow(shadowColor: Colors.transparent)),
      margin: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        children: [
          8.width,
          Container(
            child: Image.asset('assets/logoNews.png', height: 40),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: appStore.isDarkMode ? Colors.white : Colors.white,
                shape: BoxShape.circle),
          ),
          16.width,
          Text(mAppName,
                  style: boldTextStyle(
                      size: 22, color: getAppBarWidgetTextColor()))
              .expand(),
          8.width,
        ],
      ),
    );
  }
}
