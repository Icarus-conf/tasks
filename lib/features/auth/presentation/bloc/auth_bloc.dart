import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:tasks/core/enums/request_status.dart';
import 'package:tasks/core/error/failures.dart';
import 'package:tasks/features/auth/data/models/login_reponse_model.dart';
import 'package:tasks/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
  AuthBloc(this.loginUseCase) : super(const AuthState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(
        login: RequestStatus.loading,
      ));

      var response = await loginUseCase(event.username, event.password);

      response.fold((l) {
        emit(state.copyWith(
          login: RequestStatus.failure,
          loginFailures: l,
        ));
      }, (r) {
        emit(state.copyWith(
          login: RequestStatus.success,
          loginResponseModel: r,
        ));
      });
    });
  }
}
