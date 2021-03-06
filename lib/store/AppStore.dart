import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gnews/models/CurrencyStoreModel.dart';
import 'package:gnews/utils/Colors.dart';
import 'package:gnews/utils/Common.dart';
import 'package:gnews/utils/Constants.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../main.dart';

part 'AppStore.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isLoggedIn = false;

  @observable
  bool isNotificationOn = true;

  @observable
  bool isDarkMode = false;

  @observable
  bool isLoading = false;

  @observable
  String selectedLanguageCode = defaultLanguage;

  @observable
  String userProfileImage = '';

  @observable
  String userFirstName = '';

  @observable
  String userLastName = '';

  @observable
  String userEmail = '';

  @observable
  int userId = -1;

  @observable
  List<int> myTopics = [];

  @observable
  String languageForTTS = '';

  @observable
  CurrencyStoreModel currencyStoreModel;

  @observable
  AppBarTheme appBarTheme = AppBarTheme();

  @action
  void setCurrencyStoreModel() {
    currencyStoreModel = CurrencyStoreModel(
      bitcoinPrice: getDoubleAsync(BITCOIN_PRICE),
      bitcoinChange: getDoubleAsync(BITCOIN_CHANGE),
      ethereumPrice: getDoubleAsync(ETHEREUM_PRICE),
      ethereumChange: getDoubleAsync(ETHEREUM_CHANGE),
    );
  }

  @action
  void setTTSLanguage(String lang) {
    languageForTTS = lang;
    setValue(TEXT_TO_SPEECH_LANG, lang);
  }

  @action
  void setMyTopics(List<int> val) {
    myTopics.clear();
    myTopics.addAll(val);
  }

  @action
  void addToMyTopics(int val) {
    myTopics.add(val);
  }

  @action
  void removeFromMyTopics(int val) {
    myTopics.remove(val);
  }

  @action
  void setUserProfile(String image) {
    userProfileImage = image;
  }

  @action
  void setUserId(int val) {
    userId = val;
  }

  @action
  void setUserEmail(String email) {
    userEmail = email;
  }

  @action
  void setFirstName(String name) {
    userFirstName = name;
  }

  @action
  void setLastName(String name) {
    userLastName = name;
  }

  @action
  Future<void> setLoggedIn(bool val) async {
    isLoggedIn = val;
    await setValue(IS_LOGGED_IN, val);
  }

  @action
  void setLoading(bool val) {
    isLoading = val;
  }

  @action
  void setNotification(bool val) {
    isNotificationOn = val;

    setValue(IS_NOTIFICATION_ON, val);

    if (isMobile) {
      OneSignal.shared.setSubscription(val);
    }
  }

  @action
  Future<void> setDarkMode(bool aIsDarkMode) async {
    isDarkMode = aIsDarkMode;

    if (isDarkMode) {
      textPrimaryColorGlobal = Colors.white;
      textSecondaryColorGlobal = textSecondaryColor;

      defaultLoaderBgColorGlobal = scaffoldSecondaryDark;
      appButtonBackgroundColorGlobal = appButtonColorDark;
      shadowColorGlobal = Colors.white12;
    } else {
      textPrimaryColorGlobal = textPrimaryColor;
      textSecondaryColorGlobal = textSecondaryColor;

      defaultLoaderBgColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = Colors.white;
      shadowColorGlobal = Colors.black12;
    }

    appBarTheme = AppBarTheme(
      brightness: getSystemBrightness(),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: getSystemIconBrightness()),
    );

    setDynamicStatusBarColor();
  }

  @action
  Future<void> setLanguage(String aSelectedLanguageCode) async {
    selectedLanguageCode = aSelectedLanguageCode;

    language = languages
        .firstWhere((element) => element.languageCode == aSelectedLanguageCode);
    await setValue(LANGUAGE, aSelectedLanguageCode);
  }
}
