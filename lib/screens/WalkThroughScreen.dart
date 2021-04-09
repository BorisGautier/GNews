import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gnews/AppLocalizations.dart';
import 'package:gnews/models/WalkThroughModel.dart';
import 'package:gnews/utils/Colors.dart';
import 'package:gnews/utils/Common.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

import 'DashboardScreen.dart';

class WalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController();

  List<WalkThroughModel> list = [];
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(colorPrimary);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);
    list.clear();
    list.add(
      WalkThroughModel(
        image: 'assets/walk_1.png',
        title: appLocalization.translate('walk_Title1'),
        subTitle: appLocalization.translate('walk_SubTitle1'),
        color: colorPrimary,
      ),
    );
    list.add(
      WalkThroughModel(
        image: 'assets/walk_3.png',
        title: appLocalization.translate('walk_Title2'),
        subTitle: appLocalization.translate('walk_SubTitle2'),
        color: Color(0xFF6BD19B),
      ),
    );
    list.add(
      WalkThroughModel(
        image: 'assets/walk_2.png',
        title: appLocalization.translate('walk_Title3'),
        subTitle: appLocalization.translate('walk_SubTitle3'),
        color: Color(0xFFA79BFC),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: list.map((e) {
              return Container(
                height: context.height(),
                width: context.width(),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Arc(
                        arcType: ArcType.CONVEY,
                        edge: Edge.TOP,
                        height: 60,
                        child: Container(
                            height: context.height() * 0.5,
                            width: context.width(),
                            color: e.color),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(e.image,
                            height: context.height() * 0.6,
                            width: newsListWidgetSize(context),
                            fit: BoxFit.fitWidth),
                        16.height,
                        Text(e.title,
                            style: boldTextStyle(color: Colors.white, size: 24),
                            textAlign: TextAlign.center),
                        16.height,
                        Text(e.subTitle,
                            style: primaryTextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                      ],
                    ).paddingOnly(left: 16, right: 16),
                  ],
                ),
              );
            }).toList(),
            onPageChanged: (i) {
              currentPage = i;
              setState(() {});

              if (currentPage == 0) {
                setStatusBarColor(colorPrimary);
              } else if (currentPage == 1) {
                setStatusBarColor(Color(0xFF6BD19B),
                    statusBarIconBrightness: Brightness.light);
              } else if (currentPage == 2) {
                setStatusBarColor(Color(0xFFA79BFC),
                    statusBarIconBrightness: Brightness.light);
              }
            },
          ),
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Column(
              children: [
                DotIndicator(
                  pageController: pageController,
                  pages: list,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(appLocalization.translate('skip')),
                      decoration: boxDecorationRoundedWithShadow(30),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                    ).onTap(() async {
                      await setValue(IS_FIRST_TIME, false);

                      DashboardScreen().launch(context, isNewTask: true);
                    }),
                    Container(
                      child: Text(currentPage != 2
                          ? appLocalization.translate('next')
                          : appLocalization.translate('finish')),
                      decoration: boxDecorationRoundedWithShadow(30),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                    ).onTap(() async {
                      if (currentPage == 2) {
                        await setValue(IS_FIRST_TIME, false);

                        DashboardScreen().launch(context, isNewTask: true);
                      } else {
                        pageController.animateToPage(currentPage + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear);
                      }
                    }),
                  ],
                ).paddingOnly(left: 16, right: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
