class OtpResponseModel {
  bool? status;
  String? message;
  OtpSuccessResponseModelData? data;
  OtpResponseModel({this.status, this.message, this.data});
  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      status: json['status'],
      message: json['message'],
      data: OtpSuccessResponseModelData.fromJson(json['data']),
    );
  }
}

class OtpSuccessResponseModelData {
  int? id;
  String? status;
  String? reference;
  int? amount;
  String? paidAt;

  OtpSuccessResponseModelData(
      {this.id, this.status, this.reference, this.amount, this.paidAt});

  factory OtpSuccessResponseModelData.fromJson(Map<String, dynamic> json) {
    return OtpSuccessResponseModelData(
      id: json['id'],
      status: json['status'],
      reference: json['reference'],
      amount: json['amount'],
      paidAt: json['paid_at'],
    );
  }
}

class OtpFailedResponseModel {
  bool? status;
  String? message;
  OtpFailedResponseModelData? data;
  OtpFailedResponseModel({this.status, this.message, this.data});
  factory OtpFailedResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpFailedResponseModel(
      status: json['status'],
      message: json['message'],
      data: OtpFailedResponseModelData.fromJson(json['data']),
    );
  }
}

class OtpFailedResponseModelData {
  String? reference;
  String? status;
  String? message;

  OtpFailedResponseModelData({this.reference, this.status, this.message});

  factory OtpFailedResponseModelData.fromJson(Map<String, dynamic> json) {
    return OtpFailedResponseModelData(
      reference: json['reference'],
      status: json['status'],
      message: json['message'],
    );
  }
}
