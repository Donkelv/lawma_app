import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/driver_list_model.dart';

class DriverListNotifier extends StateNotifier<List<DriverListModel>> {
  DriverListNotifier() : super([]);

  List<DriverListModel> driverListState = [];

  void addDrivers(List<DriverListModel> driverList) {
    driverListState = driverList;
    state = driverListState;
  }

  void searchDriversAndLocation(String query) {
    debugPrint(query);
    if (query.isEmpty) {
      state = driverListState;
      debugPrint("empty");
    } else {
      debugPrint("not empty");
      //print(driverListState);
      state = driverListState
          .where((element) =>
              element.fullName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      
    }
  }
}

final driverListProvider =
    StateNotifierProvider<DriverListNotifier, List<DriverListModel>>((ref) {
  return DriverListNotifier();
});
