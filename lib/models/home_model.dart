class HomeModel {
  dynamic latitude;
  dynamic longitude;
  dynamic generationtimeMs;
  dynamic utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  dynamic elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  HomeModel(String s,
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.currentWeather,
      this.hourlyUnits,
      this.hourly});

  HomeModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    currentWeather = json['current_weather'] != null
        ? CurrentWeather.fromJson(json['current_weather'])
        : null;
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
    data['elevation'] = elevation;
    if (currentWeather != null) {
      data['current_weather'] = currentWeather!.toJson();
    }
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    return data;
  }
}

class CurrentWeather {
  dynamic temperature;
  dynamic windspeed;
  dynamic winddirection;
  dynamic weathercode;
  dynamic isDay;
  String? time;

  CurrentWeather(
      {this.temperature,
      this.windspeed,
      this.winddirection,
      this.weathercode,
      this.isDay,
      this.time});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    weathercode = json['weathercode'];
    isDay = json['is_day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temperature'] = temperature;
    data['windspeed'] = windspeed;
    data['winddirection'] = winddirection;
    data['weathercode'] = weathercode;
    data['is_day'] = isDay;
    data['time'] = time;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativehumidity2m;
  String? precipitation;
  String? weathercode;
  String? windspeed10m;
  String? winddirection10m;

  HourlyUnits(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.precipitation,
      this.weathercode,
      this.windspeed10m,
      this.winddirection10m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    relativehumidity2m = json['relativehumidity_2m'];
    precipitation = json['precipitation'];
    weathercode = json['weathercode'];
    windspeed10m = json['windspeed_10m'];
    winddirection10m = json['winddirection_10m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['precipitation'] = precipitation;
    data['weathercode'] = weathercode;
    data['windspeed_10m'] = windspeed10m;
    data['winddirection_10m'] = winddirection10m;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<dynamic>? temperature2m;
  List<dynamic>? relativehumidity2m;
  List<dynamic>? precipitation;
  List<dynamic>? weathercode;
  List<dynamic>? windspeed10m;
  List<dynamic>? winddirection10m;

  Hourly(
      {this.time,
      this.temperature2m,
      this.relativehumidity2m,
      this.precipitation,
      this.weathercode,
      this.windspeed10m,
      this.winddirection10m});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].map((i) => i.toDouble()).toList();
    relativehumidity2m = json['relativehumidity_2m'].cast<dynamic>();
    precipitation = json['precipitation'].cast<dynamic>();
    weathercode = json['weathercode'].cast<dynamic>();
    windspeed10m = json['windspeed_10m'].map((i) => i.toDouble()).toList();
    winddirection10m = json['winddirection_10m'].cast<dynamic>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['relativehumidity_2m'] = relativehumidity2m;
    data['precipitation'] = precipitation;
    data['weathercode'] = weathercode;
    data['windspeed_10m'] = windspeed10m;
    data['winddirection_10m'] = winddirection10m;
    return data;
  }
}
