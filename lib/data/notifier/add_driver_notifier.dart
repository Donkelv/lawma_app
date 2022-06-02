import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/data/models/card_details_model.dart';
import 'package:lawma_app/data/models/trans_history_driver.dart';
import 'package:lawma_app/data/utils/user_type_model.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';

class AddDriverNotifier extends StateNotifier<AddDataState> {
  AddDriverNotifier(this.ref) : super(const AddDataState.initial());

  final Ref ref;

  CollectionReference drivers = FirebaseFirestore.instance.collection('drivers');

  Future<void> addDriver({String? userId, String? fullName, String? location, String? profilePic, String? truckPic, String? truckNumber, CardDetailsModel}) {
    state = const AddDataState.loading();
    return drivers
        .doc(userId)
        .set(
          {
            'fullName': fullName,
            'location': "kdfvdfvdfgv",
            "profilePic": "kdfbhvjdfv",
            "truckPic": "dvdfvdfvdf",
            "truckNumber": "dvdfvdfvdf",
            'userType': UserType.driver,
            'userId': userId,
           
            'transHistory': [],
          }
        )
        .then((value) => state = const AddDataState.success("Driver successfully created"))
        .catchError((error) => state = const AddDataState.error("Error creating driver"));
  }

  



}


class UpdateDriverNotifier extends StateNotifier<AddDataState> {
  UpdateDriverNotifier(this.ref): super(const AddDataState.initial());

  final Ref ref;

  CollectionReference drivers = FirebaseFirestore.instance.collection('drivers');

  Future<void> updateDriver({String? userId, String? fullName, CardDetailsModel? cardDetails, TransHistoryDriverModel? transHistory}) {
    state = const AddDataState.loading();
    return drivers
        .doc(userId)
        .set(
          {
            'fullName': fullName,
            'location': "kdfvdfvdfgv",
            "profilePic": "kdfbhvjdfv",
            "truckPic": "dvdfvdfvdf",
            "truckNumber": "dvdfvdfvdf",
            'userType': UserType.driver,
            'userId': userId,
            
            'transHistory': [
              transHistory
            ],
          }
        )
        .then((value) => state = const AddDataState.success("Driver successfully created"))
        .catchError((error) => state = const AddDataState.error("Error creating driver"));
  }
  
}

