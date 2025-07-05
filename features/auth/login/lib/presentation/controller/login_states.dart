import 'package:equatable/equatable.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class LoginState extends Equatable {
  final String? userNameError;
  final String? passwordError;
  final String? errorMessage;
  final StateRendererType loginState;

  const LoginState(
      {
        this.userNameError,
        this.passwordError,
        this.errorMessage,
        this.loginState = StateRendererType.contentState
      });

  LoginState copyWith({
    String? usernameError,
    String? passwordError,
    String? errorMessage,
    StateRendererType? loginState
  }) {
    return LoginState(
        userNameError: userNameError,
        passwordError: passwordError,
        errorMessage: errorMessage,
        loginState: loginState = StateRendererType.contentState
    );
  }

  @override
  List<Object?> get props => [userNameError, passwordError, errorMessage,loginState];
}

// initial state
class LoginInitial extends LoginState {
  const LoginInitial():super(loginState: StateRendererType.contentState);
}

// loading state
class LoginLoading extends LoginState {
  const LoginLoading():super(loginState: StateRendererType.popupLoadingState);

}

// invalid inputs state
class LoginInvalid extends LoginState {
  final String? userNameError;
  final String? passwordError;

  const LoginInvalid({this.userNameError, this.passwordError})
      : super(userNameError: userNameError, passwordError: passwordError,loginState: StateRendererType.contentState);
}

// success state
class LoginSuccess extends LoginState {
  const LoginSuccess():super(loginState: StateRendererType.contentState);

}

// error state
class LoginError extends LoginState {
  final String? errorMessage;

  const LoginError({this.errorMessage})
      : super(errorMessage: errorMessage,loginState: StateRendererType.popupErrorState);
}