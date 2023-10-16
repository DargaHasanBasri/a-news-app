class NosyApiCurrencyResponseModel {
  String? status;
  int? systemTime;
  String? message;
  int? rowCount;
  List<Details>? data;

  NosyApiCurrencyResponseModel({
    this.status,
    this.systemTime,
    this.message,
    this.rowCount,
    this.data,
  });

  factory NosyApiCurrencyResponseModel.fromJson(Map<String, dynamic> json) => NosyApiCurrencyResponseModel(
    status: json["status"],
    systemTime: json["systemTime"],
    message: json["message"],
    rowCount: json["rowCount"],
    data: json["data"] == null ? [] : List<Details>.from(json["data"]!.map((x) => Details.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "systemTime": systemTime,
    "message": message,
    "rowCount": rowCount,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Details {
  String? code;
  String? shortName;
  String? fullName;
  double? buying;
  double? selling;
  int? latest;
  double? changeRate;
  double? dayMin;
  double? dayMax;
  DateTime? lastupdate;

  Details({
    this.code,
    this.shortName,
    this.fullName,
    this.buying,
    this.selling,
    this.latest,
    this.changeRate,
    this.dayMin,
    this.dayMax,
    this.lastupdate,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    code: json["code"],
    shortName: json["ShortName"],
    fullName: json["FullName"],
    buying: json["buying"]?.toDouble(),
    selling: json["selling"]?.toDouble(),
    latest: json["latest"],
    changeRate: json["changeRate"]?.toDouble(),
    dayMin: json["dayMin"]?.toDouble(),
    dayMax: json["dayMax"]?.toDouble(),
    lastupdate: json["lastupdate"] == null ? null : DateTime.parse(json["lastupdate"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "ShortName": shortName,
    "FullName": fullName,
    "buying": buying,
    "selling": selling,
    "latest": latest,
    "changeRate": changeRate,
    "dayMin": dayMin,
    "dayMax": dayMax,
    "lastupdate": lastupdate?.toIso8601String(),
  };
}
