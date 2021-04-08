import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_news/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class AdMobWidget extends StatefulWidget {
  static String tag = '/AdModWidget';
  AdSize adSize;
  final double width;

  AdMobWidget({this.adSize, this.width});

  @override
  AdMobWidgetState createState() => AdMobWidgetState();
}

class AdMobWidgetState extends State<AdMobWidget> {
  BannerAd myBanner;

  @override
  void initState() {
    super.initState();

    if (widget.adSize == null) widget.adSize = AdSize.smartBanner;
    init();
  }

  Future<void> init() async {
    if (isMobile && !getBoolAsync(DISABLE_AD)) {
      myBanner = BannerAd(
        adUnitId: kReleaseMode ? mAdMobBannerId : BannerAd.testAdUnitId,
        size: widget.adSize,
        listener: AdListener(onAdLoaded: (ad) {
          log('Ad loaded');
          setState(() {});
        }),
        request: AdRequest(),
      )..load();
    }
  }

  @override
  void dispose() {
    myBanner?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AdWidget(ad: myBanner);

    return (myBanner != null)
        ? Container(
            color: Colors.white,
            height: 50,
            width: context.width(),
            //width: (widget.width != null && myBanner != null) ? widget.adSize.width : context.width(),
            child: AdWidget(ad: myBanner),
          )
        : SizedBox();
  }
}
