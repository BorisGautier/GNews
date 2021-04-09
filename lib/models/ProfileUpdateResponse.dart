class ProfileUpdateResponse {
  // ignore: non_constant_identifier_names
  String first_name;
  // ignore: non_constant_identifier_names
  String last_name;
  String message;
  // ignore: non_constant_identifier_names
  String profile_image;
  // ignore: non_constant_identifier_names
  List<int> my_topics;

  // ignore: non_constant_identifier_names
  ProfileUpdateResponse(
      // ignore: non_constant_identifier_names
      {this.first_name,
      // ignore: non_constant_identifier_names
      this.last_name,
      this.message,
      // ignore: non_constant_identifier_names
      this.profile_image,
      // ignore: non_constant_identifier_names
      this.my_topics});

  factory ProfileUpdateResponse.fromJson(Map<String, dynamic> json) {
    return ProfileUpdateResponse(
      first_name: json['first_name'],
      profile_image: json['profile_image'],
      last_name: json['last_name'],
      message: json['message'],
      my_topics: json['my_topics'] != null
          ? new List<int>.from(json['my_topics'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['profile_image'] = this.profile_image;
    data['message'] = this.message;
    if (this.my_topics != null) {
      data['my_topics'] = this.my_topics;
    }
    return data;
  }
}
