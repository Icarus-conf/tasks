part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(RequestStatus.init) RequestStatus login,
    Failures? loginFailures,
    LoginResponseModel? loginResponseModel,
  }) = _AuthState;
}
