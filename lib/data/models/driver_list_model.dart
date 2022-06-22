import 'package:lawma_app/data/models/trans_history_driver.dart';

class DriverListModel {
  final String? fullName;
  final String? location;
  final String? profilePic;
  final String? truckNumber;
  final String? truckPic;
  final String? userId;
  final List<TransHistoryDriverModel>? transHistory;

  DriverListModel(
      {this.fullName,
      this.location,
      this.profilePic,
      this.truckNumber,
      this.truckPic,
      this.userId,
      this.transHistory});

  factory DriverListModel.fromJson(Map<String, dynamic> json) =>
      DriverListModel(
        fullName: json['fullName'],
        location: json['location'],
        profilePic: json['profilePic'],
        truckNumber: json['truckNumber'],
        truckPic: json['truckPic'],
        userId: json['userId'],
        transHistory: (json['transHistory'] as List).map((e) => TransHistoryDriverModel.fromJson(e)).toList()
      );
}
