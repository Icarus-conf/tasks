import 'package:dartz/dartz.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/auth/data/models/login_reponse_model.dart';

abstract class AuthRepo {
  Future<Either<Failures, LoginResponseModel>> login(
      String username, String password);
}
