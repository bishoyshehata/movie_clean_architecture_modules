import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/controller/login_states.dart';
import 'package:movie_clean_architecture_modules/di/injection.dart';
import '../../domain/usecase/login_usecase_impl.dart';
import '../controller/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final loginUseCaseImpl = getIt<LoginUseCaseImpl>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(loginUseCaseImpl),
        child: BlocBuilder<LoginBloc, LoginStates>(
          builder: (context, state) {
            return Column(

              children: [
                TextFormField(),
                TextFormField(),
                ElevatedButton(onPressed: () {}, child: Text("Login"))
              ],
            );
          },
        ),
      ),
    );
  }
}
