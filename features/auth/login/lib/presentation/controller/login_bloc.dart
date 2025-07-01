import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/usecase/login_usecase_impl.dart';
import 'package:login/presentation/controller/login_events.dart';
import 'package:login/presentation/controller/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginUseCaseImpl loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    // handle UserNameChanged event
    on<UserNameChanged>((event, emit) {
      final userNameError = validateUserName(event.userName);

      emit(
        LoginInvalid(
          userNameError: userNameError,
          passwordError: (state is LoginInvalid) ? state.passwordError : null,
        ),
      );
    });
    // handle PasswordChanged event
    on<PasswordChanged>((event, emit) {
      final passwordError = validatePassword(event.password);

      emit(
        LoginInvalid(
          passwordError: passwordError,
          userNameError: (state is LoginInvalid) ? state.userNameError : null,
        ),
      );
    });
    // handle LoginButtonPressed event
    on<LoginButtonPressed>((event, emit) async{
      final userNameError = validateUserName(event.userName);
      final passwordError = validatePassword(event.password);

      if(userNameError ==null && passwordError ==null ){
        //it's safe to call login api

        emit(LoginLoading());

        final result = await loginUseCase.execute(LoginRequest(event.userName,event.password));
        result.fold((failure){
          emit(LoginError(
              errorMessage: failure.message
          ));
          print("Error ${failure.message}");
          print("Error ${failure.statusCode}");
        }, (response){
          emit(LoginSuccess());
          print("success $response");
          print("success ${response.name}");

        });
      }else {
        //it's invalid
        emit(LoginInvalid(userNameError:userNameError,passwordError: passwordError ));
      }

    });
  }
}

String? validateUserName(String userName) {
  if (userName.isEmpty) {
    return "UserName cannot be empty";
  } else if (userName.length < 6) {
    return "UserName cannot be less than 6 characters";
  }
  return null;
}

String? validatePassword(String password) {
  if (password.isEmpty) {
    return "Password cannot be empty";
  } else if (password.length < 6) {
    return "password cannot be less than 6 characters";
  }
  return null;
}
