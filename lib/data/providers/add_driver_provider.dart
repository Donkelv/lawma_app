


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/data/notifier/add_driver_notifier.dart';

import '../../domain/states/add_data_state.dart';

final addDriverProvider =
    StateNotifierProvider<AddDriverNotifier, AddDataState>((ref) {
  return AddDriverNotifier(ref);
});




final updateDriverProider =
    StateNotifierProvider<UpdateDriverNotifier, AddDataState>((ref) {
  return UpdateDriverNotifier(ref);
});
