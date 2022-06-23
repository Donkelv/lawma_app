import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/data/models/card_details_model.dart';
import 'package:lawma_app/data/models/trans_history_driver.dart';
import 'package:lawma_app/data/utils/user_type_model.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';

class AddDriverNotifier extends StateNotifier<AddDataState> {
  AddDriverNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  CollectionReference drivers =
      FirebaseFirestore.instance.collection('drivers');
  final cloudinary = CloudinaryPublic('dbqojyqcx', 'ml_default', cache: false);

  Future<void> addDriver({
    String? userId,
    String? fullName,
    String? location,
    String? profilePic,
    String? truckPic,
    String? truckNumber,
  }) async {
    state = const AddDataState.loading();
    try {
      CloudinaryResponse responseProfilePic = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(profilePic!,
            resourceType: CloudinaryResourceType.Image),
      );
      CloudinaryResponse responseTruckPic = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(truckPic!,
            resourceType: CloudinaryResourceType.Image),
      );
      drivers.doc(userId).set(
        {
          'fullName': fullName,
          'location': location,
          "profilePic": responseProfilePic.secureUrl,
          "truckPic": responseTruckPic.secureUrl,
          "truckNumber": truckNumber,
          'userType': UserType.driver,
          'userId': userId,
          'transHistory': [],
        },
      ).then((value) {
        Fluttertoast.showToast(
            msg: "Driver successfully created",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
        state = const AddDataState.success("Driver successfully created");
      }).catchError((error) {
        Fluttertoast.showToast(
            msg: error.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
        state = const AddDataState.error("Error creating driver");
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0.sp);
      state = const AddDataState.error("Error Uplaoding  image");
    }
  }
}

class UpdateDriverNotifier extends StateNotifier<AddDataState> {
  UpdateDriverNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  CollectionReference drivers =
      FirebaseFirestore.instance.collection('drivers');

  Future<void> updateDriver(
      {String? userId,
      // String? fullName,
      //CardDetailsModel? cardDetails,
      TransHistoryDriverModel? transHistory,
      BuildContext? context}) {
    print("update driver");
    print(userId);
    state = const AddDataState.loading();
    return drivers.doc(userId).update(
      {
        // 'fullName': "DonKevin3",
        // 'location': "Apapa",
        // "profilePic":
        //     "https://res.cloudinary.com/dbqojyqcx/image/upload/v1655902611/image_picker4260510456845717468_owvkd7.png",
        // "truckPic":
        //     "https://res.cloudinary.com/dbqojyqcx/image/upload/v1655902612/image_picker6548238349474701249_z5oxpk.png",
        // "truckNumber": "123Fe",
        // 'userType': UserType.driver,
        // 'userId': userId,
        'transHistory': FieldValue.arrayUnion([transHistory])
      },
      //SetOptions(merge: true),
    ).then((value) {
      print(" successfully added");
      Navigator.pop(context!);
      Fluttertoast.showToast(
          msg: "Transaction Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0.sp);
      state = const AddDataState.success("Transaction Successfull");
    }).catchError((error) {
      print("The error is $error on update driver");
      state = const AddDataState.error("Error updating trasction");
    });
  }
}
