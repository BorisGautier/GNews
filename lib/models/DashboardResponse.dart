class DashboardResponse {
  // ignore: non_constant_identifier_names
  String app_lang;
  List<Banner> banner;
  // ignore: non_constant_identifier_names
  int feature_num_pages;
  // ignore: non_constant_identifier_names
  List<NewsData> breaking_post;
  // ignore: non_constant_identifier_names
  int recent_num_pages;
  // ignore: non_constant_identifier_names
  List<NewsData> recent_post;
  // ignore: non_constant_identifier_names
  List<NewsData> story_post;
  List<VideoData> videos;
  // ignore: non_constant_identifier_names
  SocialLink social_link;

  // ignore: non_constant_identifier_names
  DashboardResponse(
      // ignore: non_constant_identifier_names
      {this.app_lang,
      this.banner,
      // ignore: non_constant_identifier_names
      this.story_post,
      // ignore: non_constant_identifier_names
      this.feature_num_pages,
      this.videos,
      // ignore: non_constant_identifier_names
      this.breaking_post,
      // ignore: non_constant_identifier_names
      this.recent_num_pages,
      // ignore: non_constant_identifier_names
      this.recent_post,
      // ignore: non_constant_identifier_names
      this.social_link});

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      app_lang: json['app_lang'],
      banner: json['banner'] != null
          ? (json['banner'] as List).map((i) => Banner.fromJson(i)).toList()
          : null,
      feature_num_pages: json['feature_num_pages'],
      breaking_post: json['feature_post'] != null
          ? (json['feature_post'] as List)
              .map((i) => NewsData.fromJson(i))
              .toList()
          : null,
      recent_num_pages: json['recent_num_pages'],
      recent_post: json['recent_post'] != null
          ? (json['recent_post'] as List)
              .map((i) => NewsData.fromJson(i))
              .toList()
          : null,
      story_post: json['story_post'] != null
          ? (json['story_post'] as List)
              .map((i) => NewsData.fromJson(i))
              .toList()
          : null,
      videos: json['videos'] != null
          ? (json['videos'] as List).map((i) => VideoData.fromJson(i)).toList()
          : null,
      social_link: json['social_link'] != null
          ? SocialLink.fromJson(json['social_link'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_lang'] = this.app_lang;
    data['feature_num_pages'] = this.feature_num_pages;
    data['recent_num_pages'] = this.recent_num_pages;
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.breaking_post != null) {
      data['feature_post'] = this.breaking_post.map((v) => v.toJson()).toList();
    }
    if (this.recent_post != null) {
      data['recent_post'] = this.recent_post.map((v) => v.toJson()).toList();
    }
    if (this.story_post != null) {
      data['story_post'] = this.story_post.map((v) => v.toJson()).toList();
    }
    if (this.social_link != null) {
      data['social_link'] = this.social_link.toJson();
    }
    return data;
  }
}

class Banner {
  String desc;
  String image;
  String thumb;
  String url;

  Banner({this.desc, this.image, this.thumb, this.url});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      desc: json['desc'],
      image: json['image'],
      thumb: json['thumb'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['thumb'] = this.thumb;
    data['url'] = this.url;
    return data;
  }
}

class VideoData {
  // ignore: non_constant_identifier_names
  String created_at;
  int id;
  // ignore: non_constant_identifier_names
  String image_url;
  String title;
  // ignore: non_constant_identifier_names
  String video_type;
  // ignore: non_constant_identifier_names
  String video_url;

  // ignore: non_constant_identifier_names
  VideoData(
      // ignore: non_constant_identifier_names
      {this.created_at,
      this.id,
      // ignore: non_constant_identifier_names
      this.image_url,
      this.title,
      // ignore: non_constant_identifier_names
      this.video_type,
      // ignore: non_constant_identifier_names
      this.video_url});

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      created_at: json['created_at'],
      id: json['id'],
      image_url: json['image_url'],
      title: json['title'],
      video_type: json['video_type'],
      video_url: json['video_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.created_at;
    data['id'] = this.id;
    data['image_url'] = this.image_url;
    data['title'] = this.title;
    data['video_type'] = this.video_type;
    data['video_url'] = this.video_url;
    return data;
  }
}

class NewsData {
  // ignore: non_constant_identifier_names
  String human_time_diff;
  int iD;
  String image;
  // ignore: non_constant_identifier_names
  bool is_fav;
  // ignore: non_constant_identifier_names
  String no_of_comments_text;
  // ignore: non_constant_identifier_names
  String post_content;
  // ignore: non_constant_identifier_names
  String post_date;
  // ignore: non_constant_identifier_names
  String post_date_gmt;
  // ignore: non_constant_identifier_names
  String post_excerpt;
  // ignore: non_constant_identifier_names
  String post_title;
  // ignore: non_constant_identifier_names
  String readable_date;
  // ignore: non_constant_identifier_names
  String share_url;
  // ignore: non_constant_identifier_names
  String post_author_name;
  // ignore: non_constant_identifier_names
  String post_author_image;
  // ignore: non_constant_identifier_names
  int post_view;

  List<Category> category;
  // ignore: non_constant_identifier_names
  String comment_count;
  // ignore: non_constant_identifier_names
  String comment_status;
  String filter;
  // ignore: non_constant_identifier_names
  int menu_order;
  // ignore: non_constant_identifier_names
  String ping_status;
  String pinged;
  // ignore: non_constant_identifier_names
  String post_author;
  // ignore: non_constant_identifier_names
  String post_content_filtered;
  // ignore: non_constant_identifier_names
  String post_mime_type;
  // ignore: non_constant_identifier_names
  String post_modified;
  // ignore: non_constant_identifier_names
  String post_modified_gmt;
  // ignore: non_constant_identifier_names
  String post_name;
  // ignore: non_constant_identifier_names
  int post_parent;
  // ignore: non_constant_identifier_names
  String post_password;
  // ignore: non_constant_identifier_names
  String post_status;
  // ignore: non_constant_identifier_names
  String post_type;
  // ignore: non_constant_identifier_names
  List<NewsData> related_news;
  // ignore: non_constant_identifier_names
  String to_ping;

  NewsData({
    // ignore: non_constant_identifier_names
    this.post_author_name,
    // ignore: non_constant_identifier_names
    this.post_author_image,
    // ignore: non_constant_identifier_names
    this.human_time_diff,
    this.iD,
    this.image,
    // ignore: non_constant_identifier_names
    this.is_fav,
    // ignore: non_constant_identifier_names
    this.no_of_comments_text,
    // ignore: non_constant_identifier_names
    this.post_content,
    // ignore: non_constant_identifier_names
    this.post_date,
    // ignore: non_constant_identifier_names
    this.post_date_gmt,
    // ignore: non_constant_identifier_names
    this.post_excerpt,
    // ignore: non_constant_identifier_names
    this.post_title,
    // ignore: non_constant_identifier_names
    this.readable_date,
    // ignore: non_constant_identifier_names
    this.share_url,
    // ignore: non_constant_identifier_names
    this.post_view,
    this.category,
    // ignore: non_constant_identifier_names
    this.comment_count,
    // ignore: non_constant_identifier_names
    this.comment_status,
    this.filter,
    // ignore: non_constant_identifier_names
    this.menu_order,
    // ignore: non_constant_identifier_names
    this.ping_status,
    this.pinged,
    // ignore: non_constant_identifier_names
    this.post_author,
    // ignore: non_constant_identifier_names
    this.post_content_filtered,
    // ignore: non_constant_identifier_names
    this.post_mime_type,
    // ignore: non_constant_identifier_names
    this.post_modified,
    // ignore: non_constant_identifier_names
    this.post_modified_gmt,
    // ignore: non_constant_identifier_names
    this.post_name,
    // ignore: non_constant_identifier_names
    this.post_parent,
    // ignore: non_constant_identifier_names
    this.post_password,
    // ignore: non_constant_identifier_names
    this.post_status,
    // ignore: non_constant_identifier_names
    this.post_type,
    // ignore: non_constant_identifier_names
    this.related_news,
    // ignore: non_constant_identifier_names
    this.to_ping,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      human_time_diff: json['human_time_diff'],
      iD: json['ID'],
      image: json['image'],
      is_fav: json['is_fav'],
      no_of_comments_text: json['no_of_comments_text'],
      post_content: json['post_content'],
      post_date: json['post_date'],
      post_date_gmt: json['post_date_gmt'],
      post_excerpt: json['post_excerpt'],
      post_title: json['post_title'],
      readable_date: json['readable_date'],
      share_url: json['share_url'],
      post_author_name: json['post_author_name'],
      post_author_image: json['post_author_image'],
      post_view: json['post_view'],
      category: json['category'] != null
          ? (json['category'] as List).map((i) => Category.fromJson(i)).toList()
          : null,
      comment_count: json['comment_count'],
      comment_status: json['comment_status'],
      filter: json['filter'],
      menu_order: json['menu_order'],
      ping_status: json['ping_status'],
      pinged: json['pinged'],
      post_author: json['post_author'],
      post_content_filtered: json['post_content_filtered'],
      post_mime_type: json['post_mime_type'],
      post_modified: json['post_modified'],
      post_modified_gmt: json['post_modified_gmt'],
      post_name: json['post_name'],
      post_parent: json['post_parent'],
      post_password: json['post_password'],
      post_status: json['post_status'],
      post_type: json['post_type'],
      related_news: json['related_news'] != null
          ? (json['related_news'] as List)
              .map((i) => NewsData.fromJson(i))
              .toList()
          : null,
      to_ping: json['to_ping'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['human_time_diff'] = this.human_time_diff;
    data['ID'] = this.iD;
    data['image'] = this.image;
    data['is_fav'] = this.is_fav;
    data['no_of_comments_text'] = this.no_of_comments_text;
    data['post_content'] = this.post_content;
    data['post_date'] = this.post_date;
    data['post_date_gmt'] = this.post_date_gmt;
    data['post_excerpt'] = this.post_excerpt;
    data['post_title'] = this.post_title;
    data['readable_date'] = this.readable_date;
    data['share_url'] = this.share_url;
    data['post_author_name'] = this.post_author_name;
    data['post_author_image'] = this.post_author_image;
    data['post_view'] = this.post_view;

    data['comment_count'] = this.comment_count;
    data['comment_status'] = this.comment_status;
    data['filter'] = this.filter;
    data['menu_order'] = this.menu_order;
    data['ping_status'] = this.ping_status;
    data['pinged'] = this.pinged;
    data['post_author'] = this.post_author;
    data['post_content_filtered'] = this.post_content_filtered;
    data['post_mime_type'] = this.post_mime_type;
    data['post_modified'] = this.post_modified;
    data['post_modified_gmt'] = this.post_modified_gmt;
    data['post_name'] = this.post_name;
    data['post_parent'] = this.post_parent;
    data['post_password'] = this.post_password;
    data['post_status'] = this.post_status;
    data['post_type'] = this.post_type;
    data['to_ping'] = this.to_ping;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.related_news != null) {
      data['related_news'] = this.related_news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialLink {
  String contact;
  String copyrightText;
  String facebook;
  String instagram;
  String privacyPolicy;
  String termCondition;
  String twitter;
  String whatsApp;
  bool disableAd;
  bool disableLocation;
  bool disableTwitter;
  bool disableCryptoCurrency;
  bool disableHeadline;
  bool disableQuickRead;
  bool disableStory;

  SocialLink({
    this.contact,
    this.disableLocation,
    this.disableTwitter,
    this.disableAd,
    this.copyrightText,
    this.facebook,
    this.instagram,
    this.privacyPolicy,
    this.termCondition,
    this.twitter,
    this.whatsApp,
    this.disableCryptoCurrency,
    this.disableHeadline,
    this.disableQuickRead,
    this.disableStory,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      contact: json['contact'],
      copyrightText: json['copyright_text'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      privacyPolicy: json['privacy_policy'],
      termCondition: json['term_condition'],
      twitter: json['twitter'],
      whatsApp: json['whatsapp'],
      disableAd: json['disable_ad'],
      disableLocation: json['disable_location'],
      disableTwitter: json['disable_twitter'],
      disableCryptoCurrency: json['disable_cryptocurrency'],
      disableHeadline: json['disable_headline'],
      disableQuickRead: json['disable_quickread'],
      disableStory: json['disable_story'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['copyright_text'] = this.copyrightText;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['privacy_policy'] = this.privacyPolicy;
    data['term_condition'] = this.termCondition;
    data['twitter'] = this.twitter;
    data['whatsapp'] = this.whatsApp;
    data['disable_location'] = this.disableLocation;
    data['disable_ad'] = this.disableAd;
    data['disable_twitter'] = this.disableTwitter;
    data['disable_cryptocurrency'] = this.disableCryptoCurrency;
    data['disable_headline'] = this.disableHeadline;
    data['disable_quickread'] = this.disableQuickRead;
    data['disable_story'] = this.disableStory;
    return data;
  }
}

class Category {
  // ignore: non_constant_identifier_names
  int cat_ID;
  // ignore: non_constant_identifier_names
  String cat_name;
  // ignore: non_constant_identifier_names
  int category_count;
  // ignore: non_constant_identifier_names
  String category_description;
  // ignore: non_constant_identifier_names
  String category_nicename;
  // ignore: non_constant_identifier_names
  int category_parent;
  int count;
  String description;
  String filter;
  String name;
  int parent;
  String slug;
  String taxonomy;
  // ignore: non_constant_identifier_names
  int term_group;
  // ignore: non_constant_identifier_names
  int term_id;
  // ignore: non_constant_identifier_names
  int term_taxonomy_id;

  String image;

  Category({
    // ignore: non_constant_identifier_names
    this.cat_ID,
    // ignore: non_constant_identifier_names
    this.cat_name,
    // ignore: non_constant_identifier_names
    this.category_count,
    // ignore: non_constant_identifier_names
    this.category_description,
    // ignore: non_constant_identifier_names
    this.category_nicename,
    // ignore: non_constant_identifier_names
    this.category_parent,
    this.count,
    this.description,
    this.filter,
    this.name,
    this.parent,
    this.slug,
    this.taxonomy,
    // ignore: non_constant_identifier_names
    this.term_group,
    // ignore: non_constant_identifier_names
    this.term_id,
    // ignore: non_constant_identifier_names
    this.term_taxonomy_id,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      cat_ID: json['cat_ID'],
      cat_name: json['cat_name'],
      category_count: json['category_count'],
      category_description: json['category_description'],
      category_nicename: json['category_nicename'],
      category_parent: json['category_parent'],
      count: json['count'],
      description: json['description'],
      filter: json['filter'],
      name: json['name'],
      parent: json['parent'],
      slug: json['slug'],
      taxonomy: json['taxonomy'],
      term_group: json['term_group'],
      term_id: json['term_id'],
      term_taxonomy_id: json['term_taxonomy_id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_ID'] = this.cat_ID;
    data['cat_name'] = this.cat_name;
    data['category_count'] = this.category_count;
    data['category_description'] = this.category_description;
    data['category_nicename'] = this.category_nicename;
    data['category_parent'] = this.category_parent;
    data['count'] = this.count;
    data['description'] = this.description;
    data['filter'] = this.filter;
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['slug'] = this.slug;
    data['taxonomy'] = this.taxonomy;
    data['term_group'] = this.term_group;
    data['term_id'] = this.term_id;
    data['term_taxonomy_id'] = this.term_taxonomy_id;
    data['image'] = this.image;
    return data;
  }
}
