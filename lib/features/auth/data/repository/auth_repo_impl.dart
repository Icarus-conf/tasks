import 'package:dartz/dartz.dart';
import 'package:tasks/core/cache/shared_pref.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/auth/data/datasource/auth_ds.dart';
import 'package:tasks/features/auth/data/models/login_reponse_model.dart';
import 'package:tasks/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthDS authDS;
  AuthRepoImpl(this.authDS);
  @override
  Future<Either<Failures, LoginResponseModel>> login(
      String username, String password) async {
    try {
      var response = await authDS.login(username, password);
      CacheHelper.saveData('token', response.token);
      return Right(response);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
