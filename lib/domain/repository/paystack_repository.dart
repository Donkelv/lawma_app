import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../data/constant/string_const.dart';
import '../../data/models/charge_card_model.dart';
import '../../data/models/otp_response_model.dart';

abstract class IPaystackRepository {
  Future<Either<String, SuccessfulChargeCard>> chargeCard(
    String cardNo,
    String cvv,
    String expiryMonth,
    String expiryYear,
    String amount,
    String pin,
    String currency,
  );
  Future<Either<String, OtpResponseModel>> submitOtp(
    String reference,
    String otp,
  );
  // Future<Either<String, dynamic>> sendOrderToWoocomerce({
  //   String? status,
  //   double? price,
  //   SelectedAdress? address,
  // });

  // Future<Either<String, AddNewDataNoti>> addNotification(
  //     {String? title, String? content});
}

class PaystackRepository implements IPaystackRepository {
  Future<Either<String, SuccessfulChargeCard>> chargeCard(
    String cardNo,
    String cvv,
    String expiryMonth,
    String expiryYear,
    String amount,
    String pin,
    String currency,
  ) async {
    final url = "https://api.paystack.co/charge";
    final finalUrl = Uri.parse(url);
    final _auth = FirebaseAuth.instance;
    //final userBox = Hive.box<Customer>(StringConst.userBox);
    String email;
    //email = userBox.get(StringConst.userBoxKey)!.email!;
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $paystackSecretkey",
    };
    print(amount + "00");

    Map<String, dynamic> body = {
      "email": _auth.currentUser!.email,
      "amount": amount + "00",
      "card": {
        "cvv": cvv,
        "number": cardNo,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
      },
      "pin": pin,
    };

    final decodedBody = json.encode(body);

    final response =
        await http.post(finalUrl, headers: headers, body: decodedBody);

    final jsonResponse = jsonDecode(response.body);
    final successfulResult = SuccessfulChargeCard.fromJson(jsonResponse);
    final errorResult = FailedChargeModel.fromJson(jsonResponse);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      if (successfulResult.status == true) {
        //submitOtp
        return Right(successfulResult);
      } else {
        return Left(errorResult.data!.message.toString());
      }
    } else {
      print(response.statusCode);
      print(response.body);
      return Left(errorResult.data!.message.toString());
    }
  }

  ////////////send otp api repository
  @override
  Future<Either<String, OtpResponseModel>> submitOtp(
      String reference, String otp) async {
    final url = "https://api.paystack.co/charge/submit_otp";
    final finalUrl = Uri.parse(url);
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $paystackSecretkey",
    };

    Map<String, dynamic> body = {
      'otp': otp,
      'reference': reference,
    };

    final decodedBody = json.encode(body);

    final response =
        await http.post(finalUrl, headers: headers, body: decodedBody);
    print(response.body);
    print(response.statusCode);

    final jsonResponse = jsonDecode(response.body);
    final successfulResult = OtpResponseModel.fromJson(jsonResponse);
    final errorResult = OtpFailedResponseModel.fromJson(jsonResponse);

    if (response.statusCode == 200) {
      if (successfulResult.status == true) {
        //Navigator.pushNamed(context, '/payment-success');
        return Right(successfulResult);
      } else {
        return Left(errorResult.data!.message.toString());
      }
    } else {
      print(response.statusCode);
      print(response.body);
      return Left(errorResult.data!.message.toString());
    }
  }

  // ///////////////////
  // ///
  // @override
  // Future<Either<String, dynamic>> sendOrderToWoocomerce({
  //   String? status,
  //   double? price,
  //   SelectedAdress? address,
  // }) async {
  //   String basicAuth = 'Basic ' +
  //       base64UrlEncode(utf8.encode(
  //           '${StringConst.consumerKey}:${StringConst.consumerSecret}'));

  //   final url = "$customWPBaseURL//wp-json/wc/v3/orders";
  //   final finalUrl = Uri.parse(url);

  //   final userBox = Hive.box<Customer>(StringConst.userBox);
  //   int userId;
  //   userId = userBox.get(StringConst.userBoxKey)!.id!;
  //   String firstName;
  //   firstName = userBox.get(StringConst.userBoxKey)!.firstName!;
  //   String lastName;
  //   lastName = userBox.get(StringConst.userBoxKey)!.lastName!;
  //   String email;
  //   email = userBox.get(StringConst.userBoxKey)!.email!;

  //   List<LineItem> cartItem = [];
  //   final listOfCart = Hive.box<HiveCart>(StringConst.cartBox);

  //   cartItem = listOfCart.values
  //       .map((e) => LineItem(
  //             productId: e.id,
  //             quantity: e.count,
  //             name: e.name,
  //             total: e.salePrice,
  //           ))
  //       .toList();

  //   print(cartItem.length);

  //   print(firstName);
  //   print(lastName);
  //   print(userId);

  //   final headers = {
  //     "Content-Type": "application/json",
  //     "Authorization": basicAuth,
  //   };

  //   final Map<String, dynamic> body = {
  //     "payment_method": "Card",
  //     "payment_method_title": "Card",
  //     "set_paid": true,
  //     "status": "completed",
  //     "customer_id": userId,
  //     "billing": {
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "address_1": address!.address,
  //       "address_2": "",
  //       "city": address.city,
  //       "state": address.state,
  //       "postcode": "",
  //       "country": address.country,
  //       "email": email,
  //       "phone": ""
  //     },
  //     "shipping": {
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "address_1": address.address,
  //       "address_2": "",
  //       "city": address.city,
  //       "state": address.state,
  //       "postcode": "",
  //       "country": address.country
  //     },
  //     "line_items": cartItem.map((e) => e.tojson()).toList(),
  //     "shipping_lines": [
  //       {
  //         "method_id": "flat_rate",
  //         "method_title": "Flat Rate",
  //         "total": price.toString()
  //       }
  //     ]
  //   };

  //   final decodedBody = json.encode(body);

  //   final response =
  //       await http.post(finalUrl, headers: headers, body: decodedBody);
  //   print(response.body);
  //   print(response.statusCode);

  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     return Right(response.body);
  //   } else {
  //     return Left(response.body);
  //   }
  // }

  // Future<Either<String, AddNewDataNoti>> addNotification(
  //     {String? title, String? content}) async {
  //   final userBox = Hive.box<Customer>(StringConst.userBox);
  //   String email;
  //   email = userBox.get(StringConst.userBoxKey)!.email!;

  //   var url = "$customAPi/noti/add";
  //   var finalUrl = Uri.parse(url);
  //   Map<String, dynamic> body = {
  //     "consumer_key": "${StringConst.consumerKey}",
  //     "consumer_secret": "${StringConst.consumerSecret}",
  //     "email": email,
  //     "title": title,
  //     "content": content,
  //   };
  //   http.Response response = await http.post(finalUrl, body: body);
  //   final json = jsonDecode(response.body);
  //   final noti = AddNewDataNoti.fromJson(json);

  //   final listOfCart = Hive.box<HiveCart>(StringConst.cartBox);
  //   print(response.body);
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     if (noti.status == true) {
  //       listOfCart.clear();
  //       return Right(noti);
  //     } else {
  //       return Left(noti.message.toString());
  //     }
  //   } else {
  //     return Left('Unable to access server\nPlease try again later');
  //   }
  // }
}
