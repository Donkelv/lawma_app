import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lawma_app/data/constant/string_const.dart';
import 'package:lawma_app/data/models/card_details_model.dart';
import 'package:lawma_app/data/models/trans_history_user.dart';
import 'package:lawma_app/data/utils/user_type_model.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';
import 'package:lawma_app/presentation/routes/route_generator.dart';

// Compare this snippet from lib/data/notifier/auth_state_notifier.dart:

class AddUserNotifier extends StateNotifier<AddDataState> {
  AddUserNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(
      {String? userId, String? fullName, String? city, required BuildContext context}) {
        final userType = Hive.box<String>(StringConst.userTypeBox);
    final userID = Hive.box<String>(StringConst.userIdBox);
    state = const AddDataState.loading();
    return users.doc(userId).set({
      'fullName': fullName,
      'userType': UserType.user,
      'userId': userId,
      "city": city,
      'cardDetails': {},
      'transHistory': [],
    }).then((value) {
      
      state = const AddDataState.success("User successfully created");
      userType.put(StringConst.userTypeKey, UserType.user);
      userID.put(StringConst.userIdKey, userId!);
      Navigator.pushNamed(context, RouteGenerator.bottomAppBarScreen);
    }).catchError(
        (error) => state = const AddDataState.error("Error creating user"));
  }
}

class UpdateUserNotifier extends StateNotifier<AddDataState> {
  UpdateUserNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> updateUser(
      {String? userId,
      String? fullName,
      CardDetailsModel? cardDetails,
      TransHistoryUser? transHistory}) {
    state = const AddDataState.loading();
    return users
        .doc(userId)
        .set(
          {
            'fullName': fullName,
            'userType': UserType.user,
            'userId': userId,
            'cardDetails': [cardDetails],
            'transHistory': [
              transHistory,
            ],
          },
          SetOptions(merge: true),
        )
        .then((value) => state =
            const AddDataState.success("User data successfully updated"))
        .catchError(
            (error) => state = const AddDataState.error("Error updating user"));
  }
}
