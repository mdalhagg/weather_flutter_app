class AirQualityModal {
  dynamic latitude;
  dynamic longitude;
  dynamic generationtimeMs;
  dynamic utcOffsetSeconds;
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
        ? HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
        json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? pm10;
  String? pm25;
  String? carbonMonoxide;
  String? sulphurDioxide;
  String? ozone;
  String? uvIndex;
  String? uvIndexClearSky;

  HourlyUnits(
      {this.time,
      this.pm10,
      this.pm25,
      this.carbonMonoxide,
      this.sulphurDioxide,
      this.ozone,
      this.uvIndex,
      this.uvIndexClearSky});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    pm10 = json['pm10'];
    pm25 = json['pm2_5'];
    carbonMonoxide = json['carbon_monoxide'];
    sulphurDioxide = json['sulphur_dioxide'];
    ozone = json['ozone'];
    uvIndex = json['uv_index'];
    uvIndexClearSky = json['uv_index_clear_sky'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['pm10'] = pm10;
    data['pm2_5'] = pm25;
    data['carbon_monoxide'] = carbonMonoxide;
    data['sulphur_dioxide'] = sulphurDioxide;
    data['ozone'] = ozone;
    data['uv_index'] = uvIndex;
    data['uv_index_clear_sky'] = uvIndexClearSky;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<dynamic>? pm10;
  List<dynamic>? pm25;
  List<dynamic>? carbonMonoxide;
  List<dynamic>? sulphurDioxide;
  List<dynamic>? ozone;
  List<dynamic>? uvIndex;
  List<dynamic>? uvIndexClearSky;

  Hourly(
      {this.time,
      this.pm10,
      this.pm25,
      this.carbonMonoxide,
      this.sulphurDioxide,
      this.ozone,
      this.uvIndex,
      this.uvIndexClearSky});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    pm10 = json['pm10'].cast<dynamic>();
    pm25 = json['pm2_5'].cast<dynamic>();
    carbonMonoxide = json['carbon_monoxide'].cast<dynamic>();
    sulphurDioxide = json['sulphur_dioxide'].cast<dynamic>();
    ozone = json['ozone'].cast<dynamic>();
    uvIndex = json['uv_index'].cast<dynamic>();
    uvIndexClearSky = json['uv_index_clear_sky'].cast<dynamic>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['pm10'] = pm10;
    data['pm2_5'] = pm25;
    data['carbon_monoxide'] = carbonMonoxide;
    data['sulphur_dioxide'] = sulphurDioxide;
    data['ozone'] = ozone;
    data['uv_index'] = uvIndex;
    data['uv_index_clear_sky'] = uvIndexClearSky;
    return data;
  }
}
