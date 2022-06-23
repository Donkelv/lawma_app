class TransHistoryDriverModel {
  final DateTime date;
  //final String location;
  //final num rating;
  final String transId;
  final String address;
  final UserInfoModel userInfo;

  TransHistoryDriverModel({
    required this.date,
    //required this.location,
    //required this.rating,
    required this.address,
    required this.transId,
    required this.userInfo,
  });

  factory TransHistoryDriverModel.fromJson(Map<String, dynamic> json) =>
      TransHistoryDriverModel(
        date: json['date'],
        //location: json['location'] as String,
        address: json['address'] as String,
        //rating: json['rating'],
        transId: json['transId'],
        userInfo:
            UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      );
}

class UserInfoModel {
  final String userId;
  final String userName;
  //final String userImage;

  UserInfoModel({
    required this.userId,
    required this.userName,
    //required this.userImage,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userId: json['userId'],
        //userImage: json['userImage'],
        userName: json['userName'],
      );
}
