import 'package:cloud_firestore/cloud_firestore.dart';


//Get user collection
Future<void> getUserCollection() {
  return FirebaseFirestore.instance.collection('users').get();
}


//Get user document
Future<DocumentSnapshot> getUserDocument(String userId) {
  return FirebaseFirestore.instance.collection('users').doc(userId).get();
}

//Get Driver collection
Stream<QuerySnapshot> getDriverCollection() {
  return FirebaseFirestore.instance.collection('drivers').snapshots();
}

//Get Driver document
Future<void> getDriverDocument(String userId) {
  return FirebaseFirestore.instance.collection('drivers').doc(userId).get();
}
