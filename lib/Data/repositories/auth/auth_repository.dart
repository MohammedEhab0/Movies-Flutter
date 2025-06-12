import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies/Data/models/registerResponse.dart';

import '../../../errors/Errors.dart';
import '../../models/LoginResponse.dart';

abstract class AuthRepository {
  Future<Either<Errors, RegisterResponse>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId, // stay as String
  });
  Future<Either<Errors, LoginResponse>> login({ required String email, required String password}) ;

}
