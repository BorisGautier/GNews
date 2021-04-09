import 'package:flutter/material.dart';
import 'package:gnews/utils/Colors.dart';
import 'package:gnews/utils/Common.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

import '../AppLocalizations.dart';
import '../main.dart';

class AboutAppScreen extends StatelessWidget {
  static String tag = '/AboutAppScreen';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return SafeArea(
      top: !isIos,
      child: Scaffold(
        appBar: appBarWidget('About',
            showBack: true,
            color: getAppBarWidgetBackGroundColor(),
            textColor: getAppBarWidgetTextColor()),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(mAppName, style: primaryTextStyle(size: 30)),
              16.height,
              Container(
                decoration:
                    BoxDecoration(color: colorPrimary, borderRadius: radius(4)),
                height: 4,
                width: 100,
              ),
              16.height,
              Text(appLocalization.translate('version'),
                  style: secondaryTextStyle()),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Text('${snap.data.version.validate()}',
                        style: primaryTextStyle());
                  }
                  return SizedBox();
                },
              ),
              16.height,
              Text('Last Update', style: secondaryTextStyle()),
              Text(getStringAsync(LAST_UPDATE_DATE), style: primaryTextStyle()),
              16.height,
              Text('News Source', style: secondaryTextStyle()),
              Text('InfosNews', style: primaryTextStyle()),
              16.height,
              Text(
                '$mAppName app est une application Mobile intelligente de nouvelles. Il contient de nombreuses fonctionnalités très pratiques et très intuitives.  Profitez dès à présent de la meilleure expérience possible en matière d\'informations',
                style: primaryTextStyle(size: 14),
                textAlign: TextAlign.justify,
              ),
              16.height,
              AppButton(
                color:
                    appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.contact_support_outlined, color: Colors.white),
                    8.width,
                    Text('Contact Us', style: boldTextStyle(color: white)),
                  ],
                ),
                onTap: () {
                  launchUrl('mailto:${getStringAsync(CONTACT_PREF)}');
                },
              ),
              16.height,
              /*  AppButton(
                color: appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/purchase.png', height: 24, color: white),
                    8.width,
                    Text('Purchase', style: boldTextStyle(color: white)),
                  ],
                ),
                onTap: () {
                  launchUrl(codeCanyonURL);
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
