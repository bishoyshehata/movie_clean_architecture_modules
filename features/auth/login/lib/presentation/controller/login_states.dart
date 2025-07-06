import 'package:equatable/equatable.dart';
import 'package:presentation/state_renderer/state_renderer_type.dart';

class LoginState extends Equatable {
  final String? userNameError;
  final String? passwordError;
  final String? errorMessage;
  final StateRendererType stateRendererType;

  const LoginState(
      {
        this.userNameError,
        this.passwordError,
        this.errorMessage,
        this.stateRendererType = StateRendererType.contentState
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
        stateRendererType: stateRendererType  );
  }

  @override
  List<Object?> get props => [userNameError, passwordError, errorMessage,stateRendererType];
}

// initial state
class LoginInitial extends LoginState {
  const LoginInitial():super(stateRendererType: StateRendererType.contentState);
}

// loading state
class LoginLoading extends LoginState {
  const LoginLoading():super(stateRendererType: StateRendererType.popupLoadingState);

}

// invalid inputs state
class LoginInvalid extends LoginState {
  final String? userNameError;
  final String? passwordError;

  const LoginInvalid({this.userNameError, this.passwordError})
      : super(userNameError: userNameError, passwordError: passwordError,stateRendererType: StateRendererType.contentState);
}

// success state
class LoginSuccess extends LoginState {
  const LoginSuccess():super(stateRendererType: StateRendererType.contentState);

}

// error state
class LoginError extends LoginState {
  final String? errorMessage;

  const LoginError({this.errorMessage})
      : super(errorMessage: errorMessage,stateRendererType: StateRendererType.popupErrorState);
}