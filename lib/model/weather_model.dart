class WeatherModel {
  String? resolvedAddress;
  String? address;
  String? timezone;
  String? description;
  List<Days>? days;

  WeatherModel(
      {this.resolvedAddress,
      this.address,
      this.timezone,
      this.description,
      this.days});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    description = json['description'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resolvedAddress'] = this.resolvedAddress;
    data['address'] = this.address;
    data['timezone'] = this.timezone;
    data['description'] = this.description;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  String? datetime;
  int? datetimeEpoch;
  double? tempmax;
  double? tempmin;
  double? temp;
  double? feelslikemax;
  double? feelslikemin;
  double? feelslike;
  double? humidity;
  double? snow;
  double? snowdepth;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  String? sunrise;
  String? sunset;
  String? conditions;
  String? description;
  String? icon;

  Days(
      {this.datetime,
      this.datetimeEpoch,
      this.tempmax,
      this.tempmin,
      this.temp,
      this.feelslikemax,
      this.feelslikemin,
      this.feelslike,
      this.humidity,
      this.snow,
      this.snowdepth,
      this.windgust,
      this.windspeed,
      this.winddir,
      this.pressure,
      this.sunrise,
      this.sunset,
      this.conditions,
      this.description,
      this.icon});

  Days.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['datetimeEpoch'] = this.datetimeEpoch;
    data['tempmax'] = this.tempmax;
    data['tempmin'] = this.tempmin;
    data['temp'] = this.temp;
    data['feelslikemax'] = this.feelslikemax;
    data['feelslikemin'] = this.feelslikemin;
    data['feelslike'] = this.feelslike;
    data['humidity'] = this.humidity;
    data['snow'] = this.snow;
    data['snowdepth'] = this.snowdepth;
    data['windgust'] = this.windgust;
    data['windspeed'] = this.windspeed;
    data['winddir'] = this.winddir;
    data['pressure'] = this.pressure;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['conditions'] = this.conditions;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
