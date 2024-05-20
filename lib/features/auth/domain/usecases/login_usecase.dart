import 'package:dartz/dartz.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/auth/data/models/login_reponse_model.dart';
import 'package:tasks/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(
    this.authRepo,
  );

  Future<Either<Failures, LoginResponseModel>> call(
          String username, String password) =>
      authRepo.login(username, password);
}
