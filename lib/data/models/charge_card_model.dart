class SuccessfulChargeCard {
  bool? status;
  String? message;
  SuccessfulChargeCardData? data;

  SuccessfulChargeCard({
    this.status,
    this.message,
    this.data,
  });

  factory SuccessfulChargeCard.fromJson(Map<String, dynamic> json) =>
      SuccessfulChargeCard(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : SuccessfulChargeCardData.fromJson(json["data"]),
      );
}

class SuccessfulChargeCardData {
  String? reference;
  String? status;
  String? displayText;

  SuccessfulChargeCardData({
    this.reference,
    this.status,
    this.displayText,
  });

  factory SuccessfulChargeCardData.fromJson(Map<String, dynamic> json) =>
      SuccessfulChargeCardData(
        reference: json["reference"] == null ? null : json["reference"],
        status: json["status"] == null ? null : json["status"],
        displayText: json["displayText"] == null ? null : json["display_text"],
      );
}

class FailedChargeModel {
  bool? status;
  String? message;
  FailedChargeCardData? data;

  FailedChargeModel({
    this.status,
    this.message,
    this.data,
  });

  factory FailedChargeModel.fromJson(Map<String, dynamic> json) =>
      FailedChargeModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : FailedChargeCardData.fromJson(json["data"]),
      );
}

class FailedChargeCardData {
  String? reference;
  String? status;
  String? message;

  FailedChargeCardData({
    this.reference,
    this.status,
    this.message,
  });

  factory FailedChargeCardData.fromJson(Map<String, dynamic> json) =>
      FailedChargeCardData(
        reference: json["reference"] == null ? null : json["reference"],
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
      );
}
