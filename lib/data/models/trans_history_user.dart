class TransHistoryUser {
  final String transId;
  final String amount;
  final DateTime date;
  final String location;
  final int? rating;
  final DriverDetails driverDetails;

  TransHistoryUser({
    required this.transId,
    required this.amount,
    required this.date,
    required this.driverDetails,
    required this.location,
    this.rating,
  });

  factory TransHistoryUser.fromJson(Map<String, dynamic> json) =>
      TransHistoryUser(
        transId: json['transId'] as String,
        amount: json['amount'] as String,
        date: json['date'] as DateTime,
        location: json['location'] as String,
        rating: json['rating'] as int,
        driverDetails: DriverDetails.fromJson(
            json['driverDetails'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transId': transId,
        'amount': amount,
        'date': date,
        'driverDetails': driverDetails.toJson(),
      };
}

class DriverDetails {
  final String busImage;
  final String busNumber;
  final String busDriverName;

  DriverDetails({
    required this.busImage,
    required this.busNumber,
    required this.busDriverName,
  });

  factory DriverDetails.fromJson(Map<String, dynamic> json) => DriverDetails(
        busImage: json['busImage'] as String,
        busNumber: json['busNumber'] as String,
        busDriverName: json['busDriverName'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'busImage': busImage,
        'busNumber': busNumber,
        'busDriverName': busDriverName,
      };
}
