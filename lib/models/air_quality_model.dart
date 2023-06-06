class AirQualityModal {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  AirQualityModal(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.hourlyUnits,
      this.hourly});

  AirQualityModal.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    hourlyUnits = json['hourly_units'] != null
        ? new HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
        json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    if (this.hourlyUnits != null) {
      data['hourly_units'] = this.hourlyUnits!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.toJson();
    }
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? pm10;
  String? pm25;

  HourlyUnits({this.time, this.pm10, this.pm25});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    pm10 = json['pm10'];
    pm25 = json['pm2_5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['pm10'] = this.pm10;
    data['pm2_5'] = this.pm25;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? pm10;
  List<double>? pm25;

  Hourly({this.time, this.pm10, this.pm25});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    pm10 = json['pm10'].cast<double>();
    pm25 = json['pm2_5'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['pm10'] = this.pm10;
    data['pm2_5'] = this.pm25;
    return data;
  }
}
