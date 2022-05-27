import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseAuthRepository {
  Future<Either<String, User>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<String, User>> createUserWithEmailAndPassword(
      String email, String password);
}

class AuthRepository extends BaseAuthRepository {
  //final BaseAuthRepository _baseAuthRepository = FirebaseAuthRepository();

  @override
  Future<Either<String, User>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(user.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const Left('Wrong password provided for that user.');
      } else {
        return Left(e.message!);
      }
      
    }
  }

  @override
  Future<Either<String, User>> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(user.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Left('Email already in use.');
      } else if (e.code == 'weak-password') {
        return const Left('Password is too weak.');
      } else {
        return Left(e.message!);
      }
    }
  }
}
