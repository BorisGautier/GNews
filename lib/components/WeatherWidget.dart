import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gnews/models/WeatherResponse.dart';
import 'package:gnews/network/RestApis.dart';
import 'package:gnews/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

import '../AppLocalizations.dart';
import '../main.dart';
import 'AppWidgets.dart';

class WeatherWidget extends StatefulWidget {
  static String tag = '/WeatherWidget';

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String location = "";
  Future<String> getLocation() async {
    Position position = await Geolocator.getLastKnownPosition();
    if (position == null) {
      position = await Geolocator.getCurrentPosition();
    }
    print(position);
    final searchResult = await Nominatim.reverseSearch(
      lat: position.latitude,
      lon: position.longitude,
      addressDetails: true,
      extraTags: true,
      nameDetails: true,
    );
    setState(() {
      location = searchResult.displayName;
      print(location);
    });
    return location;
  }

  @override
  void initState() {
    super.initState();
    print("1");
    getLocation();
  }

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
                    snap.hasData ? location : '-',
                    style: boldTextStyle(
                        color: getAppBarWidgetTextColor(), size: 20),
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
