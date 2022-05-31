class CardDetailsModel{
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardHolderName;


  CardDetailsModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.cardHolderName,
  });

  factory CardDetailsModel.fromJson(Map<String, dynamic> json) => CardDetailsModel(
    cardNumber: json['cardNumber'] as String,
    expiryDate: json['expiryDate'] as String,
    cvv: json['cvv'] as String,
    cardHolderName: json['cardHolderName'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'cardNumber': cardNumber,
    'expiryDate': expiryDate,
    'cvv': cvv,
    'cardHolderName': cardHolderName,
  };

}