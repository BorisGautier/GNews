class WeatherResponse {
  Current current;
  Location location;

  WeatherResponse({this.current, this.location});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      current:
          json['current'] != null ? Current.fromJson(json['current']) : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    return data;
  }
}

class Location {
  String country;
  double lat;
  String localtime;
  // ignore: non_constant_identifier_names
  int localtime_epoch;
  double lon;
  String name;
  String region;
  // ignore: non_constant_identifier_names
  String tz_id;

  // ignore: non_constant_identifier_names
  Location(
      {this.country,
      this.lat,
      this.localtime,
      // ignore: non_constant_identifier_names
      this.localtime_epoch,
      this.lon,
      this.name,
      this.region,
      // ignore: non_constant_identifier_names
      this.tz_id});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      lat: json['lat'],
      localtime: json['localtime'],
      localtime_epoch: json['localtime_epoch'],
      lon: json['lon'],
      name: json['name'],
      region: json['region'],
      tz_id: json['tz_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['localtime'] = this.localtime;
    data['localtime_epoch'] = this.localtime_epoch;
    data['lon'] = this.lon;
    data['name'] = this.name;
    data['region'] = this.region;
    data['tz_id'] = this.tz_id;
    return data;
  }
}

class Current {
  int cloud;
  Condition condition;
  // ignore: non_constant_identifier_names
  double feelslike_c;
  // ignore: non_constant_identifier_names
  double feelslike_f;
  // ignore: non_constant_identifier_names
  double gust_kph;
  // ignore: non_constant_identifier_names
  double gust_mph;
  int humidity;
  // ignore: non_constant_identifier_names
  int is_day;
  // ignore: non_constant_identifier_names
  String last_updated;
  // ignore: non_constant_identifier_names
  int last_updated_epoch;
  // ignore: non_constant_identifier_names
  double precip_in;
  // ignore: non_constant_identifier_names
  double precip_mm;
  // ignore: non_constant_identifier_names
  double pressure_in;
  // ignore: non_constant_identifier_names
  double pressure_mb;
  // ignore: non_constant_identifier_names
  double temp_c;
  // ignore: non_constant_identifier_names
  double temp_f;
  double uv;
  // ignore: non_constant_identifier_names
  double vis_km;
  // ignore: non_constant_identifier_names
  double vis_miles;
  // ignore: non_constant_identifier_names
  int wind_degree;
  // ignore: non_constant_identifier_names
  String wind_dir;
  // ignore: non_constant_identifier_names
  double wind_kph;
  // ignore: non_constant_identifier_names
  double wind_mph;

  Current(
      {this.cloud,
      this.condition,
      // ignore: non_constant_identifier_names
      this.feelslike_c,
      // ignore: non_constant_identifier_names
      this.feelslike_f,
      // ignore: non_constant_identifier_names
      this.gust_kph,
      // ignore: non_constant_identifier_names
      this.gust_mph,
      this.humidity,
      // ignore: non_constant_identifier_names
      this.is_day,
      // ignore: non_constant_identifier_names
      this.last_updated,
      // ignore: non_constant_identifier_names
      this.last_updated_epoch,
      // ignore: non_constant_identifier_names
      this.precip_in,
      // ignore: non_constant_identifier_names
      this.precip_mm,
      // ignore: non_constant_identifier_names
      this.pressure_in,
      // ignore: non_constant_identifier_names
      this.pressure_mb,
      // ignore: non_constant_identifier_names
      this.temp_c,
      // ignore: non_constant_identifier_names
      this.temp_f,
      this.uv,
      // ignore: non_constant_identifier_names
      this.vis_km,
      // ignore: non_constant_identifier_names
      this.vis_miles,
      // ignore: non_constant_identifier_names
      this.wind_degree,
      // ignore: non_constant_identifier_names
      this.wind_dir,
      // ignore: non_constant_identifier_names
      this.wind_kph,
      // ignore: non_constant_identifier_names
      this.wind_mph});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      cloud: json['cloud'],
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
      feelslike_c: json['feelslike_c'],
      feelslike_f: json['feelslike_f'],
      gust_kph: json['gust_kph'],
      gust_mph: json['gust_mph'],
      humidity: json['humidity'],
      is_day: json['is_day'],
      last_updated: json['last_updated'],
      last_updated_epoch: json['last_updated_epoch'],
      precip_in: json['precip_in'],
      precip_mm: json['precip_mm'],
      pressure_in: json['pressure_in'],
      pressure_mb: json['pressure_mb'],
      temp_c: json['temp_c'],
      temp_f: json['temp_f'],
      uv: json['uv'],
      vis_km: json['vis_km'],
      vis_miles: json['vis_miles'],
      wind_degree: json['wind_degree'],
      wind_dir: json['wind_dir'],
      wind_kph: json['wind_kph'],
      wind_mph: json['wind_mph'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslike_c;
    data['feelslike_f'] = this.feelslike_f;
    data['gust_kph'] = this.gust_kph;
    data['gust_mph'] = this.gust_mph;
    data['humidity'] = this.humidity;
    data['is_day'] = this.is_day;
    data['last_updated'] = this.last_updated;
    data['last_updated_epoch'] = this.last_updated_epoch;
    data['precip_in'] = this.precip_in;
    data['precip_mm'] = this.precip_mm;
    data['pressure_in'] = this.pressure_in;
    data['pressure_mb'] = this.pressure_mb;
    data['temp_c'] = this.temp_c;
    data['temp_f'] = this.temp_f;
    data['uv'] = this.uv;
    data['vis_km'] = this.vis_km;
    data['vis_miles'] = this.vis_miles;
    data['wind_degree'] = this.wind_degree;
    data['wind_dir'] = this.wind_dir;
    data['wind_kph'] = this.wind_kph;
    data['wind_mph'] = this.wind_mph;
    if (this.condition != null) {
      data['condition'] = this.condition.toJson();
    }
    return data;
  }
}

class Condition {
  int code;
  String icon;
  String text;

  Condition({this.code, this.icon, this.text});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      code: json['code'],
      icon: json['icon'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['icon'] = this.icon;
    data['text'] = this.text;
    return data;
  }
}
