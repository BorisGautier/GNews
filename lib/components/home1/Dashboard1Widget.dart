import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gnews/components/BreakingNewsMarqueeWidget.dart';
import 'package:gnews/components/CryptoCurrencyListWidget.dart';
import 'package:gnews/components/VideoListWidget.dart';
import 'package:gnews/models/DashboardResponse.dart';
import 'package:gnews/screens/ViewAllNewsScreen.dart';
import 'package:gnews/screens/ViewAllVideoScreen.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../AppLocalizations.dart';
import '../BreakingNewsListWidget.dart';
import '../NewsListWidget.dart';
import '../QuickReadWidget.dart';
import '../StoryListWidget.dart';
import '../TwitterFeedListWidget.dart';
import '../ViewAllHeadingWidget.dart';

class Dashboard1Widget extends StatefulWidget {
  final AsyncSnapshot<DashboardResponse> snap;

  Dashboard1Widget(this.snap);

  @override
  Dashboard1WidgetState createState() => Dashboard1WidgetState();
}

class Dashboard1WidgetState extends State<Dashboard1Widget>
    with SingleTickerProviderStateMixin {
  String mBreakingNewsMarquee = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //setDynamicStatusBarColor(milliseconds: 400);

    mBreakingNewsMarquee = '';

    widget.snap.data.breaking_post.validate().forEach((element) {
      mBreakingNewsMarquee = mBreakingNewsMarquee + ' | ' + element.post_title;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return Container(
      height: context.height(),
      width: context.width(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BreakingNewsMarqueeWidget(string: mBreakingNewsMarquee),

            StoryListWidget(list: widget.snap.data.story_post),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                20.height,
                ViewAllHeadingWidget(
                  title:
                      appLocalization.translate('breaking_News').toUpperCase(),
                  onTap: () {
                    ViewAllNewsScreen(title: 'breaking_News', req: {
                      'posts_per_page': postsPerPage,
                      FILTER: FILTER_FEATURE
                    }).launch(context);
                  },
                ),
                8.height,
                BreakingNewsListWidget(widget.snap.data.breaking_post),
              ],
            ).visible(widget.snap.data.breaking_post.validate().isNotEmpty),

            // Quick Read
            QuickReadWidget(widget.snap.data.recent_post),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ViewAllHeadingWidget(
                  title: appLocalization.translate('videos').toUpperCase(),
                  onTap: () {
                    ViewAllVideoScreen().launch(context);
                  },
                ),
                8.height,
                VideoListWidget(widget.snap.data.videos.validate(),
                    axis: Axis.horizontal),
                8.height,
              ],
            ).visible(widget.snap.data.videos.validate().isNotEmpty),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ViewAllHeadingWidget(
                  title: appLocalization.translate('recent_News').toUpperCase(),
                  onTap: () {
                    ViewAllNewsScreen(
                        title: 'recent_News',
                        req: {'posts_per_page': postsPerPage}).launch(context);
                  },
                ),
                8.height,
                NewsListWidget(widget.snap.data.recent_post,
                    padding: EdgeInsets.symmetric(horizontal: 8)),
              ],
            ).visible(widget.snap.data.recent_post.validate().isNotEmpty),

            TwitterFeedListWidget(),

            CryptoCurrencyListWidget(),
          ],
        ),
      ),
    );
  }
}
