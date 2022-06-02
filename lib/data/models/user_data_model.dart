import 'package:lawma_app/data/models/card_details_model.dart';
import 'package:lawma_app/data/models/trans_history_user.dart';

class UserDataModel {
  final String userId;
  final String fullName;
  final String userType;
  final CardDetailsModel? cardDetails;
  final List<TransHistoryUser>? transHistory;

  UserDataModel({
    required this.userId,
    required this.fullName,
    required this.userType,
     this.cardDetails,
     this.transHistory,
  });


  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    userId: json['userId'] as String,
    fullName: json['fullName'] as String,
    userType: json['userType'] as String,
    cardDetails: json['cardDetails'] == {} ? null : CardDetailsModel.fromJson(json['cardDetails'] as Map<String, dynamic>),
    transHistory: json['transHistory'] == [] ? null : List<TransHistoryUser>.from(json['transHistory'].map((x) => TransHistoryUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'userId': userId,
    'fullName': fullName,
    'userType': userType,
    'cardDetails': cardDetails,
    'transHistory': transHistory,
  };
}
