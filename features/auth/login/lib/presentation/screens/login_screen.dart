import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/controller/login_events.dart';
import 'package:login/presentation/controller/login_states.dart';
import 'package:movie_clean_architecture_modules/di/injection.dart';
import 'package:presentation/state_renderer/state_renderer.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';
import '../../domain/usecase/login_usecase_impl.dart';
import '../controller/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  final loginUseCase = getIt<LoginUseCaseImpl>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(loginUseCase),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return Stack(
            children: [
              _buildMainLoginScreen(context,state),
              _buildStateRendererWidget(context,state)
            ],
          );
        }),
      ),
    );
  }
  Widget _buildMainLoginScreen(BuildContext context , LoginState state){
    return Padding(
      padding: EdgeInsets.all(16.0),
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          controller: usernameController,
          onChanged: (value) {
            context.read<LoginBloc>().add(UserNameChanged(value));
          },
          decoration: InputDecoration(
              labelText: "Username",
              errorText:
              state is LoginInvalid ? state.userNameError : null),
        ),
        const SizedBox(height: 20),

        TextFormField(
          controller: passwordController,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(value));
          },
          decoration: InputDecoration(
              labelText: "Password",
              errorText:
              state is LoginInvalid ? state.passwordError : null),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              final username = usernameController.text;
              final password = passwordController.text;
              context
                  .read<LoginBloc>()
                  .add(LoginButtonPressed(username, password));
            },
            child: Text("Login"))
      ]),
    );
  }
  Widget _buildStateRendererWidget(BuildContext context , LoginState state){

    if(state.loginState == StateRendererType.contentState){
      // when content is displayed we don't want to show any overlay
      return SizedBox.shrink();
    }


    return StateRenderer(stateRendererType: state.loginState,
    message: state is LoginError ? state.errorMessage ?? "" : "",
      retryActionFunction: (){
        final username = usernameController.text;
        final password = passwordController.text;
        context
            .read<LoginBloc>()
            .add(LoginButtonPressed(username, password));
      },
    );
  }
}