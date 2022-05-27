// import 'package:dartz/dartz.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:lawma_app/data/utils/user_type_model.dart';

// abstract class BaseCreateUpdateRepository {
//   Future<Either<String, String>> createUser(String? fullName, String? email);
// }

// class CreateUpdateRepository extends BaseCreateUpdateRepository {
//   CollectionReference userCollection =
//       FirebaseFirestore.instance.collection('user');

//   @override
//   Future<Either<String, String>> createUser(
//       String? fullName, String? email) async {
//     userCollection.add({
//       'fullName': fullName,
//       'email': email,
//       'userType': UserType.user,
//       'transHistory': [],
//       'cardDetails': {},
//     }).then((value) {
//       return const Right("User created successfully");
//     });
//   }
// }
