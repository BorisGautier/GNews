import 'package:nb_utils/nb_utils.dart';

const mAppName = 'G News';

//region URLs & Keys
/// Note: /wp-json/ is required after your domain. Ex if your domain is www.abc.com then ${mBaseUrl} will be  https://www.abc.com/wp-json/
const mBaseUrl = 'https://gnews.tbg.cm/wp-json/';

const supportURL = 'https://twitter.com/Boris_Gauty';
const codeCanyonURL = '';

const mCryptoCurrencyBaseUrl = 'https://api.weatherapi.com/v1/current.json';
const mWeatherBaseUrl =
    'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';

/// Obtain your key from https://api.weatherapi.com
const mWeatherAPIKey = 'ad8c5b9dd75b42009dc221740210704';

const mOneSignalAPPKey = '50febdc3-9fdd-4769-9a95-37cf067d94e9';
const mCoinMarketCapKey = 'd88a4fa1-6f5d-49fe-8356-cd18b11c32cf';

var mTwitterApiKey = 'TLdJCJ4IqdRyJyNa9PQxmpvgN';
var mTwitterApiSecretKey = 'RLeKqcKr5JgtHt6iT38lkyYqou4vMLZOzOXZuWgbwKb5267uu4';
var mTwitterApiAccessToken =
    '4406833708-UjveLDljrxWQHq0ZdRvpWt1ei8k7xh7p7WlaI6G';
var mTwitterApiAccessTokenSecret =
    '4MhcxXBQtwiGS14FQ6e9tqqKsURJmssqBd1Vwchq8jdvp';

const mAdMobAppId = 'ca-app-pub-1399327544318575~7586962359';
const mAdMobBannerId = 'ca-app-pub-1399327544318575/7395390664';
const mAdMobInterstitialId = 'ca-app-pub-1399327544318575/2840712768';
//endregion

//App store URL
const appStoreBaseUrl = 'https://www.apple.com/app-store/';

//region LiveStream Keys
const checkMyTopics = 'checkMyTopics';
const refreshBookmark = 'refreshBookmark';
const tokenStream = 'tokenStream';
//endregion

//region Configs
const defaultLanguage = 'fr';
const defaultTTSLanguage = 'fr-FR';
const postsPerPage = 15;
const dashboard3ItemTwitterLine = 7;
const enableSocialLogin = true;

const dashboard3Item = 280.0;

const dashboard1ComponentHeight = 200.0;
const dashboard2ComponentHeight = 230.0;
const dashboard3ComponentHeight = 280.0;

const DASHBOARD2_Video = 200.0;

//endregion

//region Messages
var passwordLengthMsg =
    'Password length should be more than $passwordLengthGlobal';
//endregion

/* Theme Mode Type */
const ThemeModeLight = 0;
const ThemeModeDark = 1;
const ThemeModeSystem = 2;

/* Video Type */
const VideoTypeCustom = 'custom_url';
const VideoTypeYouTube = 'youtube';
const VideoTypeIFrame = 'iframe';

/* Login Type */
const LoginTypeApp = 'app';
const LoginTypeGoogle = 'google';
const LoginTypeApple = 'apple';
const LoginTypeOTP = 'otp';

/* Firebase Remote Config Keys */
const LAST_UPDATE_DATE = 'lastUpdateDate';
const FORCE_UPDATE_VERSION_CODE = 'forceUpdateVersionCode';

//region SharedPreferences Keys
const IS_FIRST_TIME = 'IsFirstTime';
const IS_LOGGED_IN = 'IS_LOGGED_IN';
const IS_TWITTER_LOGGED_IN = 'IS_TWITTER_LOGGED_IN';
const TWITTER_USERNAME = 'TWITTER_USERNAME';
const TWITTER_ACCESS_TOKEN = 'TWITTER_ACCESS_TOKEN';
const TOKEN = 'TOKEN';
const USER_ID = 'USER_ID';
const USERNAME = 'USERNAME';
const FIRST_NAME = 'FIRST_NAME';
const LAST_NAME = 'LAST_NAME';
const USER_DISPLAY_NAME = 'USER_DISPLAY_NAME';
const USER_EMAIL = 'USER_EMAIL';
const USER_ROLE = 'USER_ROLE';
const AVATAR = 'AVATAR';
const PASSWORD = 'PASSWORD';
const PROFILE_IMAGE = 'PROFILE_IMAGE';
const THEME_MODE_INDEX = "THEME_MODE_INDEX";
const IS_NOTIFICATION_ON = "IS_NOTIFICATION_ON";
const IS_REMEMBERED = "IS_REMEMBERED";
const LANGUAGE = 'LANGUAGE';
const PLAYER_ID = 'playerId';
const FONT_SIZE = 'FONT_SIZE';
const MY_TOPICS = 'MY_TOPICS';
const TERMS_AND_CONDITION_PREF = 'TermsAndConditionPref';
const PRIVACY_POLICY_PREF = 'PrivacyPolicyPref';
const CONTACT_PREF = 'ContactPref';
const DISABLE_LOCATION_WIDGET = 'DISABLE_LOCATION_WIDGET';
const DISABLE_TWITTER_WIDGET = 'DISABLE_TWITTER_WIDGET';
const DISABLE_QUICK_READ_WIDGET = 'DISABLE_QUICK_READ_WIDGET';
const DISABLE_STORY_WIDGET = 'DISABLE_STORY_WIDGET';
const DISABLE_CRYPTO_CURRENCY_WIDGET = 'DISABLE_CRYPTOCURRENCY_WIDGET';
const DISABLE_HEADLINE_WIDGET = 'DISABLE_HEADLINE_WIDGET';
const DISABLE_AD = 'DisableAd';
const FONT_SIZE_PREF = 'FontSizePref';
const IS_SOCIAL_LOGIN = 'IsSocialLogin';
const DETAIL_PAGE_VARIANT = 'DetailPageVariant';
const LOGIN_TYPE = 'LOGIN_TYPE';
const MY_PREFERENCE = 'my_preference';
const DASHBOARD_PAGE_VARIANT = 'DashboardPageVariant';

const TEXT_TO_SPEECH_LANG = 'TEXT_TO_SPEECH_LANG';

// Crypto Currency
const BITCOIN_PRICE = 'BITCOIN_PRICE';
const BITCOIN_CHANGE = 'BITCOIN_CHANGE';
const ETHEREUM_PRICE = 'ETHEREUM_PRICE';
const ETHEREUM_CHANGE = 'ETHEREUM_CHANGE';
const CURRENT_TIME = 'CURRENT_TIME';
//

// Offline Data
const DASHBOARD_DATA = 'DASHBOARD_DATA';
const NEWS_DETAIL = 'NEWS_DETAIL';
const VIEW_ALL_DATA = 'VIEW_ALL_DATA';
const CATEGORY_DATA = 'CATEGORY_DATA';
const SEARCH_DATA = 'SEARCH_DATA';
//

//endregion

/* breaking news */
const FILTER = 'filter';
const FILTER_FEATURE = 'feature';
