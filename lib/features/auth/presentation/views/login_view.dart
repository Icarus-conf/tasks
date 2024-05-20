import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/config/routes.dart';
import 'package:tasks/core/enums/request_status.dart';
import 'package:tasks/features/auth/data/datasource/auth_ds_impl.dart';
import 'package:tasks/features/auth/data/repository/auth_repo_impl.dart';
import 'package:tasks/features/auth/domain/usecases/login_usecase.dart';
import 'package:tasks/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tasks/features/auth/presentation/widgets/custom_textfield.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        LoginUseCase(
          AuthRepoImpl(
            AuthDSImpl(),
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.login == RequestStatus.loading) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }
              if (state.login == RequestStatus.success) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.homeView, (route) => false);
              }
              if (state.login == RequestStatus.failure) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Text(state.loginFailures?.message ?? ""),
                    );
                  },
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Username',
                    controller: userNameController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(const LoginEvent('kminchelle', '0lelplR'));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
