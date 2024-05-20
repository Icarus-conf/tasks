import 'package:tasks/core/api/api_magner.dart';
import 'package:tasks/core/api/end_points.dart';
import 'package:tasks/features/auth/data/datasource/auth_ds.dart';
import 'package:tasks/features/auth/data/models/login_reponse_model.dart';

class AuthDSImpl implements AuthDS {
  @override
  Future<LoginResponseModel> login(String username, String password) async {
    ApiManger apiManger = ApiManger();
    var response =
        await apiManger.postData(endPoint: EndPoints.loginEndPoint, body: {
      "username": username,
      "password": password,
    });

    LoginResponseModel loginResponse =
        LoginResponseModel.fromJson(response.data);

    return loginResponse;
  }
}
