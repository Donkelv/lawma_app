import 'package:flutter/widgets.dart';
import 'package:lawma_app/data/constant/image_const.dart';
import 'package:lawma_app/presentation/screens/home_screen.dart';
import 'package:lawma_app/presentation/screens/home_screen_admin.dart';
import 'package:lawma_app/presentation/screens/home_screen_driver.dart';
import 'package:lawma_app/presentation/screens/profile_screen.dart';
import 'package:lawma_app/presentation/screens/transaction_history_screen.dart';

class BottomAppBarModel {
  final String? icon;
  final Widget? page;

  const BottomAppBarModel({
    this.icon,
    this.page,
  });
}

List<BottomAppBarModel> bottomAppBarList = [
  const BottomAppBarModel(icon: ImageConst.homeIcon, page: HomeScreeenAdmin()),
  const BottomAppBarModel(
      icon: ImageConst.historyIcon, page: TransactionHistoryScreen()),
  const BottomAppBarModel(icon: ImageConst.profileIcon, page: ProfileScreen()),
];


List<BottomAppBarModel> bottomAppBarDriver = [
  const BottomAppBarModel(icon: ImageConst.homeIcon, page: HomeScreenDriver()),
  const BottomAppBarModel(
      icon: ImageConst.historyIcon, page: TransactionHistoryScreen()),
  const BottomAppBarModel(icon: ImageConst.profileIcon, page: ProfileScreen()),
];


List<BottomAppBarModel> bottomAppBarAdmin = [
  const BottomAppBarModel(icon: ImageConst.homeIcon, page: HomeScreenDriver()),
  const BottomAppBarModel(
      icon: ImageConst.historyIcon, page: TransactionHistoryScreen()),
  const BottomAppBarModel(icon: ImageConst.profileIcon, page: ProfileScreen()),
];
