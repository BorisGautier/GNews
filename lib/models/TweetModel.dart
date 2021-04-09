class TweetModel {
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  int favorite_count;
  bool favorited;
  // ignore: non_constant_identifier_names
  String full_text;
  int id;
  // ignore: non_constant_identifier_names
  String id_str;
  // ignore: non_constant_identifier_names
  bool is_quote_status;
  String lang;
  // ignore: non_constant_identifier_names
  int retweet_count;
  bool retweeted;
  // ignore: non_constant_identifier_names
  RetweetedStatus retweeted_status;
  String source;
  bool truncated;
  User user;

  TweetModel(
      // ignore: non_constant_identifier_names
      {this.created_at,
      // ignore: non_constant_identifier_names
      this.favorite_count,
      this.favorited,
      // ignore: non_constant_identifier_names
      this.full_text,
      this.id,
      // ignore: non_constant_identifier_names
      this.id_str,
      // ignore: non_constant_identifier_names
      this.is_quote_status,
      this.lang,
      // ignore: non_constant_identifier_names
      this.retweet_count,
      this.retweeted,
      // ignore: non_constant_identifier_names
      this.retweeted_status,
      this.source,
      this.truncated,
      this.user});

  factory TweetModel.fromJson(Map<String, dynamic> json) {
    return TweetModel(
      created_at: json['created_at'],
      favorite_count: json['favorite_count'],
      favorited: json['favorited'],
      full_text: json['full_text'],
      id: json['id'],
      id_str: json['id_str'],
      is_quote_status: json['is_quote_status'],
      lang: json['lang'],
      retweet_count: json['retweet_count'],
      retweeted: json['retweeted'],
      retweeted_status: json['retweeted_status'] != null
          ? RetweetedStatus.fromJson(json['retweeted_status'])
          : null,
      source: json['source'],
      truncated: json['truncated'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['favorite_count'] = this.favorite_count;
    data['favorited'] = this.favorited;
    data['full_text'] = this.full_text;
    data['id'] = this.id;
    data['id_str'] = this.id_str;
    data['is_quote_status'] = this.is_quote_status;
    data['lang'] = this.lang;
    data['retweet_count'] = this.retweet_count;
    data['retweeted'] = this.retweeted;
    data['source'] = this.source;
    data['truncated'] = this.truncated;
    if (this.retweeted_status != null) {
      data['retweeted_status'] = this.retweeted_status.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  bool protected;
  // ignore: non_constant_identifier_names
  bool contributors_enabled;
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  bool default_profile;
  // ignore: non_constant_identifier_names
  bool default_profile_image;
  String description;
  // ignore: non_constant_identifier_names
  int favourites_count;
  // ignore: non_constant_identifier_names
  int followers_count;
  // ignore: non_constant_identifier_names
  int friends_count;
  // ignore: non_constant_identifier_names
  bool geo_enabled;
  // ignore: non_constant_identifier_names
  bool has_extended_profile;
  int id;
  // ignore: non_constant_identifier_names
  String id_str;
  // ignore: non_constant_identifier_names
  bool is_translation_enabled;
  // ignore: non_constant_identifier_names
  bool is_translator;
  // ignore: non_constant_identifier_names
  int listed_count;
  String location;
  String name;
  // ignore: non_constant_identifier_names
  String profile_background_color;
  // ignore: non_constant_identifier_names
  String profile_background_image_url;
  // ignore: non_constant_identifier_names
  String profile_background_image_url_https;
  // ignore: non_constant_identifier_names
  bool profile_background_tile;
  // ignore: non_constant_identifier_names
  String profile_banner_url;
  // ignore: non_constant_identifier_names
  String profile_image_url;
  // ignore: non_constant_identifier_names
  String profile_image_url_https;
  // ignore: non_constant_identifier_names
  String profile_link_color;
  // ignore: non_constant_identifier_names
  String profile_sidebar_border_color;
  // ignore: non_constant_identifier_names
  String profile_sidebar_fill_color;
  // ignore: non_constant_identifier_names
  String profile_text_color;
  // ignore: non_constant_identifier_names
  bool profile_use_background_image;
  // ignore: non_constant_identifier_names
  String screen_name;
  // ignore: non_constant_identifier_names
  int statuses_count;
  // ignore: non_constant_identifier_names
  String translator_type;
  bool verified;

  User(
      {this.protected,
      // ignore: non_constant_identifier_names
      this.contributors_enabled,
      // ignore: non_constant_identifier_names
      this.created_at,
      // ignore: non_constant_identifier_names
      this.default_profile,
      // ignore: non_constant_identifier_names
      this.default_profile_image,
      this.description,
      // ignore: non_constant_identifier_names
      this.favourites_count,
      // ignore: non_constant_identifier_names
      this.followers_count,
      // ignore: non_constant_identifier_names
      this.friends_count,
      // ignore: non_constant_identifier_names
      this.geo_enabled,
      // ignore: non_constant_identifier_names
      this.has_extended_profile,
      this.id,
      // ignore: non_constant_identifier_names
      this.id_str,
      // ignore: non_constant_identifier_names
      this.is_translation_enabled,
      // ignore: non_constant_identifier_names
      this.is_translator,
      // ignore: non_constant_identifier_names
      this.listed_count,
      this.location,
      this.name,
      // ignore: non_constant_identifier_names
      this.profile_background_color,
      // ignore: non_constant_identifier_names
      this.profile_background_image_url,
      // ignore: non_constant_identifier_names
      this.profile_background_image_url_https,
      // ignore: non_constant_identifier_names
      this.profile_background_tile,
      // ignore: non_constant_identifier_names
      this.profile_banner_url,
      // ignore: non_constant_identifier_names
      this.profile_image_url,
      // ignore: non_constant_identifier_names
      this.profile_image_url_https,
      // ignore: non_constant_identifier_names
      this.profile_link_color,
      // ignore: non_constant_identifier_names
      this.profile_sidebar_border_color,
      // ignore: non_constant_identifier_names
      this.profile_sidebar_fill_color,
      // ignore: non_constant_identifier_names
      this.profile_text_color,
      // ignore: non_constant_identifier_names
      this.profile_use_background_image,
      // ignore: non_constant_identifier_names
      this.screen_name,
      // ignore: non_constant_identifier_names
      this.statuses_count,
      // ignore: non_constant_identifier_names
      this.translator_type,
      this.verified});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      protected: json['protected'],
      contributors_enabled: json['contributors_enabled'],
      created_at: json['created_at'],
      default_profile: json['default_profile'],
      default_profile_image: json['default_profile_image'],
      description: json['description'],
      favourites_count: json['favourites_count'],
      followers_count: json['followers_count'],
      friends_count: json['friends_count'],
      geo_enabled: json['geo_enabled'],
      has_extended_profile: json['has_extended_profile'],
      id: json['id'],
      id_str: json['id_str'],
      is_translation_enabled: json['is_translation_enabled'],
      is_translator: json['is_translator'],
      listed_count: json['listed_count'],
      location: json['location'],
      name: json['name'],
      profile_background_color: json['profile_background_color'],
      profile_background_image_url: json['profile_background_image_url'],
      profile_background_image_url_https:
          json['profile_background_image_url_https'],
      profile_background_tile: json['profile_background_tile'],
      profile_banner_url: json['profile_banner_url'],
      profile_image_url: json['profile_image_url'],
      profile_image_url_https: json['profile_image_url_https'],
      profile_link_color: json['profile_link_color'],
      profile_sidebar_border_color: json['profile_sidebar_border_color'],
      profile_sidebar_fill_color: json['profile_sidebar_fill_color'],
      profile_text_color: json['profile_text_color'],
      profile_use_background_image: json['profile_use_background_image'],
      screen_name: json['screen_name'],
      statuses_count: json['statuses_count'],
      translator_type: json['translator_type'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protected'] = this.protected;
    data['contributors_enabled'] = this.contributors_enabled;
    data['created_at'] = this.created_at;
    data['default_profile'] = this.default_profile;
    data['default_profile_image'] = this.default_profile_image;
    data['description'] = this.description;
    data['favourites_count'] = this.favourites_count;
    data['followers_count'] = this.followers_count;
    data['friends_count'] = this.friends_count;
    data['geo_enabled'] = this.geo_enabled;
    data['has_extended_profile'] = this.has_extended_profile;
    data['id'] = this.id;
    data['id_str'] = this.id_str;
    data['is_translation_enabled'] = this.is_translation_enabled;
    data['is_translator'] = this.is_translator;
    data['listed_count'] = this.listed_count;
    data['location'] = this.location;
    data['name'] = this.name;
    data['profile_background_color'] = this.profile_background_color;
    data['profile_background_image_url'] = this.profile_background_image_url;
    data['profile_background_image_url_https'] =
        this.profile_background_image_url_https;
    data['profile_background_tile'] = this.profile_background_tile;
    data['profile_banner_url'] = this.profile_banner_url;
    data['profile_image_url'] = this.profile_image_url;
    data['profile_image_url_https'] = this.profile_image_url_https;
    data['profile_link_color'] = this.profile_link_color;
    data['profile_sidebar_border_color'] = this.profile_sidebar_border_color;
    data['profile_sidebar_fill_color'] = this.profile_sidebar_fill_color;
    data['profile_text_color'] = this.profile_text_color;
    data['profile_use_background_image'] = this.profile_use_background_image;
    data['screen_name'] = this.screen_name;
    data['statuses_count'] = this.statuses_count;
    data['translator_type'] = this.translator_type;
    data['verified'] = this.verified;
    return data;
  }
}

class RetweetedStatus {
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  int favorite_count;
  bool favorited;
  // ignore: non_constant_identifier_names
  String full_text;
  int id;
  // ignore: non_constant_identifier_names
  String id_str;
  // ignore: non_constant_identifier_names
  bool is_quote_status;
  String lang;
  // ignore: non_constant_identifier_names
  int retweet_count;
  bool retweeted;
  String source;
  UserX user;

  // ignore: non_constant_identifier_names
  RetweetedStatus(
      // ignore: non_constant_identifier_names
      {this.created_at,
      // ignore: non_constant_identifier_names
      this.favorite_count,
      this.favorited,
      // ignore: non_constant_identifier_names
      this.full_text,
      this.id,
      // ignore: non_constant_identifier_names
      this.id_str,
      // ignore: non_constant_identifier_names
      this.is_quote_status,
      this.lang,
      // ignore: non_constant_identifier_names
      this.retweet_count,
      this.retweeted,
      this.source,
      this.user});

  factory RetweetedStatus.fromJson(Map<String, dynamic> json) {
    return RetweetedStatus(
      created_at: json['created_at'],
      favorite_count: json['favorite_count'],
      favorited: json['favorited'],
      full_text: json['full_text'],
      id: json['id'],
      id_str: json['id_str'],
      is_quote_status: json['is_quote_status'],
      lang: json['lang'],
      retweet_count: json['retweet_count'],
      retweeted: json['retweeted'],
      source: json['source'],
      user: json['user'] != null ? UserX.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['favorite_count'] = this.favorite_count;
    data['favorited'] = this.favorited;
    data['full_text'] = this.full_text;
    data['id'] = this.id;
    data['id_str'] = this.id_str;
    data['is_quote_status'] = this.is_quote_status;
    data['lang'] = this.lang;
    data['retweet_count'] = this.retweet_count;
    data['retweeted'] = this.retweeted;
    data['source'] = this.source;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class UserX {
  bool protected;
  // ignore: non_constant_identifier_names
  bool contributors_enabled;
  // ignore: non_constant_identifier_names
  String created_at;
  // ignore: non_constant_identifier_names
  bool default_profile;
  // ignore: non_constant_identifier_names
  bool default_profile_image;
  String description;
  // ignore: non_constant_identifier_names
  int favourites_count;
  // ignore: non_constant_identifier_names
  int followers_count;
  // ignore: non_constant_identifier_names
  int friends_count;
  // ignore: non_constant_identifier_names
  bool geo_enabled;
  // ignore: non_constant_identifier_names
  bool has_extended_profile;
  int id;
  // ignore: non_constant_identifier_names
  String id_str;
  // ignore: non_constant_identifier_names
  bool is_translation_enabled;
  // ignore: non_constant_identifier_names
  bool is_translator;
  // ignore: non_constant_identifier_names
  int listed_count;
  String location;
  String name;
  // ignore: non_constant_identifier_names
  String profile_background_color;
  // ignore: non_constant_identifier_names
  String profile_background_image_url;
  // ignore: non_constant_identifier_names
  String profile_background_image_url_https;
  // ignore: non_constant_identifier_names
  bool profile_background_tile;
  // ignore: non_constant_identifier_names
  String profile_image_url;
  // ignore: non_constant_identifier_names
  String profile_image_url_https;
  // ignore: non_constant_identifier_names
  String profile_link_color;
  // ignore: non_constant_identifier_names
  String profile_sidebar_border_color;
  // ignore: non_constant_identifier_names
  String profile_sidebar_fill_color;
  // ignore: non_constant_identifier_names
  String profile_text_color;
  // ignore: non_constant_identifier_names
  bool profile_use_background_image;
  // ignore: non_constant_identifier_names
  String screen_name;
  // ignore: non_constant_identifier_names
  int statuses_count;
  // ignore: non_constant_identifier_names
  String translator_type;
  String url;
  bool verified;

  UserX(
      {this.protected,
      // ignore: non_constant_identifier_names
      this.contributors_enabled,
      // ignore: non_constant_identifier_names
      this.created_at,
      // ignore: non_constant_identifier_names
      this.default_profile,
      // ignore: non_constant_identifier_names
      this.default_profile_image,
      this.description,
      // ignore: non_constant_identifier_names
      this.favourites_count,
      // ignore: non_constant_identifier_names
      this.followers_count,
      // ignore: non_constant_identifier_names
      this.friends_count,
      // ignore: non_constant_identifier_names
      this.geo_enabled,
      // ignore: non_constant_identifier_names
      this.has_extended_profile,
      this.id,
      // ignore: non_constant_identifier_names
      this.id_str,
      // ignore: non_constant_identifier_names
      this.is_translation_enabled,
      // ignore: non_constant_identifier_names
      this.is_translator,
      // ignore: non_constant_identifier_names
      this.listed_count,
      this.location,
      this.name,
      // ignore: non_constant_identifier_names
      this.profile_background_color,
      // ignore: non_constant_identifier_names
      this.profile_background_image_url,
      // ignore: non_constant_identifier_names
      this.profile_background_image_url_https,
      // ignore: non_constant_identifier_names
      this.profile_background_tile,
      // ignore: non_constant_identifier_names
      this.profile_image_url,
      // ignore: non_constant_identifier_names
      this.profile_image_url_https,
      // ignore: non_constant_identifier_names
      this.profile_link_color,
      // ignore: non_constant_identifier_names
      this.profile_sidebar_border_color,
      // ignore: non_constant_identifier_names
      this.profile_sidebar_fill_color,
      // ignore: non_constant_identifier_names
      this.profile_text_color,
      // ignore: non_constant_identifier_names
      this.profile_use_background_image,
      // ignore: non_constant_identifier_names
      this.screen_name,
      // ignore: non_constant_identifier_names
      this.statuses_count,
      // ignore: non_constant_identifier_names
      this.translator_type,
      this.url,
      this.verified});

  factory UserX.fromJson(Map<String, dynamic> json) {
    return UserX(
      protected: json['protected'],
      contributors_enabled: json['contributors_enabled'],
      created_at: json['created_at'],
      default_profile: json['default_profile'],
      default_profile_image: json['default_profile_image'],
      description: json['description'],
      favourites_count: json['favourites_count'],
      followers_count: json['followers_count'],
      friends_count: json['friends_count'],
      geo_enabled: json['geo_enabled'],
      has_extended_profile: json['has_extended_profile'],
      id: json['id'],
      id_str: json['id_str'],
      is_translation_enabled: json['is_translation_enabled'],
      is_translator: json['is_translator'],
      listed_count: json['listed_count'],
      location: json['location'],
      name: json['name'],
      profile_background_color: json['profile_background_color'],
      profile_background_image_url: json['profile_background_image_url'],
      profile_background_image_url_https:
          json['profile_background_image_url_https'],
      profile_background_tile: json['profile_background_tile'],
      profile_image_url: json['profile_image_url'],
      profile_image_url_https: json['profile_image_url_https'],
      profile_link_color: json['profile_link_color'],
      profile_sidebar_border_color: json['profile_sidebar_border_color'],
      profile_sidebar_fill_color: json['profile_sidebar_fill_color'],
      profile_text_color: json['profile_text_color'],
      profile_use_background_image: json['profile_use_background_image'],
      screen_name: json['screen_name'],
      statuses_count: json['statuses_count'],
      translator_type: json['translator_type'],
      url: json['url'],
      verified: json['verified'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protected'] = this.protected;
    data['contributors_enabled'] = this.contributors_enabled;
    data['created_at'] = this.created_at;
    data['default_profile'] = this.default_profile;
    data['default_profile_image'] = this.default_profile_image;
    data['description'] = this.description;
    data['favourites_count'] = this.favourites_count;
    data['followers_count'] = this.followers_count;
    data['friends_count'] = this.friends_count;
    data['geo_enabled'] = this.geo_enabled;
    data['has_extended_profile'] = this.has_extended_profile;
    data['id'] = this.id;
    data['id_str'] = this.id_str;
    data['is_translation_enabled'] = this.is_translation_enabled;
    data['is_translator'] = this.is_translator;
    data['listed_count'] = this.listed_count;
    data['location'] = this.location;
    data['name'] = this.name;
    data['profile_background_color'] = this.profile_background_color;
    data['profile_background_image_url'] = this.profile_background_image_url;
    data['profile_background_image_url_https'] =
        this.profile_background_image_url_https;
    data['profile_background_tile'] = this.profile_background_tile;
    data['profile_image_url'] = this.profile_image_url;
    data['profile_image_url_https'] = this.profile_image_url_https;
    data['profile_link_color'] = this.profile_link_color;
    data['profile_sidebar_border_color'] = this.profile_sidebar_border_color;
    data['profile_sidebar_fill_color'] = this.profile_sidebar_fill_color;
    data['profile_text_color'] = this.profile_text_color;
    data['profile_use_background_image'] = this.profile_use_background_image;
    data['screen_name'] = this.screen_name;
    data['statuses_count'] = this.statuses_count;
    data['translator_type'] = this.translator_type;
    data['url'] = this.url;
    data['verified'] = this.verified;
    return data;
  }
}
