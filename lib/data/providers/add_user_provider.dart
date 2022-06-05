import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/data/notifier/add_user_notifier.dart';
import 'package:lawma_app/domain/states/add_data_state.dart';

final addUserProvider =
    StateNotifierProvider<AddUserNotifier, AddDataState>((ref) {
  return AddUserNotifier(ref );
});
