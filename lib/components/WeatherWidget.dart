import 'package:flutter/material.dart';
import 'package:gnews/models/WeatherResponse.dart';
import 'package:gnews/network/RestApis.dart';
import 'package:gnews/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

import '../AppLocalizations.dart';
import '../main.dart';
import 'AppWidgets.dart';

class WeatherWidget extends StatelessWidget {
  static String tag = '/WeatherWidget';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return FutureBuilder<WeatherResponse>(
      future: weatherMemoizer.runOnce(() => getWeatherApi()),
      builder: (_, snap) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
          decoration: BoxDecoration(
            color: getAppBarWidgetBackGroundColor(),
            boxShadow: [
              BoxShadow(
                  color: gray.withOpacity(0.5),
                  blurRadius: 0.6,
                  spreadRadius: 1.0),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snap.hasData ? snap.data.location.region.validate() : '-',
                    style: boldTextStyle(
                        color: getAppBarWidgetTextColor(), size: 28),
                    overflow: TextOverflow.ellipsis,
                  ).paddingLeft(8),
                  4.height,
                  Text(
                    appLocalization.translate('feed'),
                    style:
                        secondaryTextStyle(color: getAppBarWidgetTextColor()),
                  ).paddingLeft(8),
                ],
              ).expand(),
              Row(
                children: [
                  snap.hasData
                      ? cachedImage(
                          'https:${snap.data.current.condition?.icon?.validate()}',
                          height: 50,
                          usePlaceholderIfUrlEmpty: false,
                        ).paddingRight(8)
                      : SizedBox(),
                  Text(
                    (snap.hasData
                        ? '${snap.data.current.temp_c.validate().toInt().toString()}°'
                        : '-'),
                    style: boldTextStyle(
                        size: 30, color: getAppBarWidgetTextColor()),
                  ).paddingRight(8),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
