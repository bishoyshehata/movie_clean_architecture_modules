import 'package:equatable/equatable.dart';

class LoginStates extends Equatable {
  final String? userNameError;
  final String? passwordError;
  final String? errorMessage;

 const LoginStates({this.userNameError, this.passwordError, this.errorMessage});

  LoginStates copyWith({
    String? userNameError,
    String? passwordError,
    String? errorMessage,
  }) {
    return LoginStates(
      userNameError: userNameError,
      passwordError: passwordError,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [];
}

// initial state
class LoginInitial extends LoginStates {}

// loading state
class LoginLoading extends LoginStates {}

// invalid credential state
class LoginInvalid extends LoginStates {
  final String? userNameError;
  final String? passwordError;

  const LoginInvalid({this.userNameError, this.passwordError})
    : super(userNameError: userNameError, passwordError: passwordError);
}

// success state
class LoginSuccess extends LoginStates {}

// error state
class LoginError extends LoginStates {
  final String? errorMessage;

  const LoginError({this.errorMessage}) : super(errorMessage: errorMessage);
}
