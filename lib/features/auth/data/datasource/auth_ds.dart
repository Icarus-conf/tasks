import 'package:tasks/features/auth/data/models/login_reponse_model.dart';

abstract class AuthDS {
  Future<LoginResponseModel> login(String email, String password);
}
