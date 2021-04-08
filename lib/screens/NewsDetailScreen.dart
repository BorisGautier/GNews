import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_news/components/DetailPageVariant1Widget.dart';
import 'package:mighty_news/components/DetailPageVariant2Widget.dart';
import 'package:mighty_news/components/DetailPageVariant3Widget.dart';
import 'package:mighty_news/components/ReadAloudDialog.dart';
import 'package:mighty_news/models/DashboardResponse.dart';
import 'package:mighty_news/network/RestApis.dart';
import 'package:mighty_news/screens/LoginScreen.dart';
import 'package:mighty_news/utils/Common.dart';
import 'package:mighty_news/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

import '../main.dart';

// ignore: must_be_immutable
class NewsDetailScreen extends StatefulWidget {
  static String tag = '/NewsDetailScreen';
  NewsData newsData;
  final String heroTag;
  final String id;
  final bool disableAd;

  NewsDetailScreen({this.newsData, this.heroTag, this.id, this.disableAd = false});

  @override
  NewsDetailScreenState createState() => NewsDetailScreenState();
}

class NewsDetailScreenState extends State<NewsDetailScreen> {
  String postContent = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setDynamicStatusBarColorDetail(milliseconds: 400);

    if (widget.newsData == null) {
      getBlogDetail({'post_id': widget.id.toString()}, appStore.isLoggedIn).then((value) {
        widget.newsData = value;

        setState(() {});
      });
    } else {
      setPostContent(widget.newsData.post_content.validate());
    }
  }

  Future<void> setPostContent(String text) async {
    postContent = widget.newsData.post_content
        .validate()
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('[embed]', '<embed>')
        .replaceAll('[/embed]', '</embed>')
        .replaceAll('[caption]', '<caption>')
        .replaceAll('[/caption]', '</caption>');

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    if (!widget.disableAd) setDynamicStatusBarColor();
  }

  Future<void> addToWishList() async {
    Map req = {
      'post_id': widget.newsData.iD,
    };

    if (!widget.newsData.is_fav.validate()) {
      addWishList(req).then((res) {
        appStore.isLoading = false;

        LiveStream().emit(refreshBookmark, true);

        toast(res['message']);
      }).catchError((error) {
        widget.newsData.is_fav = !widget.newsData.is_fav.validate();

        appStore.isLoading = false;
        toast(error.toString());
      });
    } else {
      removeWishList(req).then((res) {
        appStore.isLoading = false;

        LiveStream().emit(refreshBookmark, true);

        toast(res.message.validate());
      }).catchError((error) {
        widget.newsData.is_fav = !widget.newsData.is_fav.validate();

        appStore.isLoading = false;
        toast(error.toString());
      });
    }

    widget.newsData.is_fav = !widget.newsData.is_fav.validate();

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget getVariant(int postView, List<NewsData> relatedNews) {
      if (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 1) {
        return DetailPageVariant1Widget(widget.newsData, postView: postView, postContent: postContent, relatedNews: relatedNews.validate(), heroTag: widget.heroTag);
      } else if (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 2) {
        return DetailPageVariant2Widget(widget.newsData, postView: postView, postContent: postContent, relatedNews: relatedNews.validate(), heroTag: widget.heroTag);
      } else if (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 3) {
        return DetailPageVariant3Widget(widget.newsData, postView: postView, postContent: postContent, relatedNews: relatedNews.validate());
      } else {
        return DetailPageVariant1Widget(widget.newsData, postView: postView, postContent: postContent, relatedNews: relatedNews.validate(), heroTag: widget.heroTag);
      }
    }

    return SafeArea(
      top: (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 1),
      child: Scaffold(
        appBar: (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 1 && widget.newsData != null)
            ? appBarWidget(
                parseHtmlString(widget.newsData != null ? widget.newsData.post_title.validate() : ''),
                showBack: true,
                color: getIntAsync(DASHBOARD_PAGE_VARIANT, defaultValue: 1) != 1 ? Theme.of(context).cardColor : getPrimaryColor(),
                textColor: getIntAsync(DASHBOARD_PAGE_VARIANT, defaultValue: 1) != 1 ? textPrimaryColorGlobal : Colors.white,
                actions: [
                  if (widget.newsData != null)
                    IconButton(
                      icon: Icon(
                        widget.newsData.is_fav.validate() ? FontAwesome.bookmark : FontAwesome.bookmark_o,
                        color: (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 1 && getIntAsync(DASHBOARD_PAGE_VARIANT, defaultValue: 1) == 1) || appStore.isDarkMode ? Colors.white : Colors.black,
                      ),
                      onPressed: () async {
                        if (!appStore.isLoggedIn) {
                          bool res = await LoginScreen(isNewTask: false).launch(context);

                          if (res ?? false) {
                            addToWishList();
                          }
                        } else {
                          addToWishList();
                        }
                      },
                    ),
                  IconButton(
                    icon: Icon(
                      Icons.share_rounded,
                      color: (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 1 && getIntAsync(DASHBOARD_PAGE_VARIANT, defaultValue: 1) == 1) || appStore.isDarkMode ? Colors.white : Colors.black,
                    ),
                    onPressed: () async {
                      Share.share(widget.newsData.share_url.validate());
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: (getIntAsync(DETAIL_PAGE_VARIANT, defaultValue: 1) == 1 && getIntAsync(DASHBOARD_PAGE_VARIANT, defaultValue: 1) == 1) || appStore.isDarkMode ? Colors.white : Colors.black,
                    ),
                    onPressed: () async {
                      showInDialog(
                        context,
                        child: ReadAloudDialog(parseHtmlString(postContent)),
                        contentPadding: EdgeInsets.zero,
                        barrierDismissible: false,
                      );
                    },
                  ),
                ],
              )
            : null,
        body: widget.newsData != null
            ? Container(
                padding: EdgeInsets.only(bottom: !getBoolAsync(DISABLE_AD) ? AdSize.banner.height.toDouble() : 0),
                height: context.height(),
                width: context.width(),
                child: getVariant(widget.newsData.post_view.validate(), widget.newsData.related_news.validate()),
              )
            : Loader(),
      ),
    );
  }
}
