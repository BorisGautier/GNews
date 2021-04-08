import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_news/components/CryptoCurrencyWidget.dart';
import 'package:mighty_news/utils/Colors.dart';
import 'package:mighty_news/utils/Constants.dart';
import 'package:mighty_news/utils/Marquee2Custom.dart' as m2;
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class CryptoCurrencyListWidget extends StatefulWidget {
  static String tag = '/CryptoCurrencyListWidget';

  @override
  CryptoCurrencyListWidgetState createState() => CryptoCurrencyListWidgetState();
}

class CryptoCurrencyListWidgetState extends State<CryptoCurrencyListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (getBoolAsync(DISABLE_CRYPTO_CURRENCY_WIDGET)) return SizedBox();

    return Observer(
      builder: (_) => m2.Marquee(
        child: Container(
          child: Row(
            children: [
              CryptoCurrencyWidget(
                image: 'assets/bitcoin.png',
                price: appStore.currencyStoreModel.bitcoinPrice.validate().toStringAsFixed(2),
                change: appStore.currencyStoreModel.bitcoinChange.toStringAsFixed(2),
                color: appStore.currencyStoreModel.bitcoinChange.isNegative ? colorPrimary : Colors.green,
              ),
              16.width,
              CryptoCurrencyWidget(
                image: 'assets/ethereum.png',
                price: appStore.currencyStoreModel.ethereumPrice.toStringAsFixed(2),
                change: appStore.currencyStoreModel.ethereumChange.toStringAsFixed(2),
                color: appStore.currencyStoreModel.ethereumChange.isNegative ? colorPrimary : Colors.green,
              ),
              16.width,
            ],
          ),
        ),
      ).withHeight(80.0),
    );
  }
}
