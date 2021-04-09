import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:gnews/AppLocalizations.dart';
import 'package:gnews/components/AppWidgets.dart';
import 'package:gnews/components/PostCommentDialog.dart';
import 'package:gnews/main.dart';
import 'package:gnews/models/CommentData.dart';
import 'package:gnews/network/RestApis.dart';
import 'package:gnews/screens/LoginScreen.dart';
import 'package:gnews/utils/Common.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class CommentListScreen extends StatefulWidget {
  static String tag = '/CommentListScreen';
  final int id;

  CommentListScreen(this.id);

  @override
  CommentListScreenState createState() => CommentListScreenState();
}

class CommentListScreenState extends State<CommentListScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setDynamicStatusBarColor(milliseconds: 400);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return Observer(
      builder: (_) => SafeArea(
        top: !isIos,
        child: Scaffold(
          appBar: appBarWidget(
            appLocalization.translate('Comments'),
            showBack: true,
            color: getAppBarWidgetBackGroundColor(),
            textColor: getAppBarWidgetTextColor(),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                color:
                    getIntAsync(DASHBOARD_PAGE_VARIANT, defaultValue: 1) == 1 ||
                            appStore.isDarkMode
                        ? Colors.white
                        : Colors.black,
                onPressed: () async {
                  if (appStore.isLoggedIn) {
                    bool res = await showInDialog(context,
                        child: PostCommentDialog(widget.id));

                    if (res ?? false) {
                      setState(() {});
                    }
                  } else {
                    LoginScreen(isNewTask: false).launch(context);
                  }
                },
              ),
            ],
          ),
          body: Container(
            height: context.height(),
            width: context.width(),
            child: Stack(
              children: [
                FutureBuilder<List<CommentData>>(
                  future: getCommentList(widget.id),
                  builder: (_, snap) {
                    if (snap.hasData) {
                      if (snap.data.isNotEmpty) {
                        return Container(
                          margin: EdgeInsets.only(
                              bottom: !getBoolAsync(DISABLE_AD) ? 50 : 0),
                          child: ListView.builder(
                            itemCount: snap.data.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(8),
                            itemBuilder: (_, index) {
                              CommentData data = snap.data[index];

                              String name = data.author_name.validate();
                              if (name.length >= 1) name = name[0];

                              return Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: getPrimaryColor()),
                                      child: Text(name.toUpperCase(),
                                              style: boldTextStyle(
                                                  color: Colors.white,
                                                  size: 22))
                                          .center(),
                                      padding: EdgeInsets.all(14),
                                    ),
                                    16.width,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            parseHtmlString(
                                                data.author_name.validate()),
                                            style: secondaryTextStyle()),
                                        Text(
                                            parseHtmlString(data
                                                .content.rendered
                                                .validate()),
                                            style: primaryTextStyle()),
                                      ],
                                    ).expand(),
                                    8.width,
                                    Text(
                                        DateFormat('dd MMM, yyyy HH:mm').format(
                                            DateTime.parse(
                                                data.date.validate())),
                                        style: secondaryTextStyle(size: 10)),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return noDataWidget(context);
                      }
                    }

                    return snapWidgetHelper(snap);
                  },
                ),
                Loader().visible(appStore.isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
