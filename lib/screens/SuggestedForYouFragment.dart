import 'package:flutter/material.dart';
import 'package:gnews/AppLocalizations.dart';
import 'package:gnews/components/PaginatedNewsWidget.dart';
import 'package:gnews/screens/ChooseTopicScreen.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class SuggestedForYouFragment extends StatefulWidget {
  static String tag = '/SuggestedForYouFragment';

  @override
  SuggestedForYouFragmentState createState() => SuggestedForYouFragmentState();
}

class SuggestedForYouFragmentState extends State<SuggestedForYouFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  redirect() async {
    bool res = await ChooseTopicScreen().launch(context);

    if (res ?? false) {
      if (appStore.myTopics.isEmpty) {
        toast('Choose any one topic');

        LiveStream().emit(checkMyTopics, true);
      }
      setState(() {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        height: context.height(),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(appLocalization.translate('suggest_for_you'),
                    style: boldTextStyle()),
                Icon(Icons.edit).onTap(() async {
                  redirect();
                }),
              ],
            ).paddingSymmetric(vertical: 20, horizontal: 16),
            Positioned(
              top: 60,
              child: Container(
                height: context.height() - 100,
                child: PaginatedNewsWidget(
                    {'filter': 'suggested', 'posts_per_page': postsPerPage}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
