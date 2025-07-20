import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object?> get props => [];
}
// UserNameChanged
class UserNameChanged extends LoginEvents {
  final String userName;

  const UserNameChanged(this.userName);

  @override
  List<Object?> get props => [userName];
}
// PasswordChanged
class PasswordChanged extends LoginEvents {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

// LoginButtonPressed
class LoginButtonPressed extends LoginEvents {
  final String userName;
  final String password;

  const LoginButtonPressed(this.userName, this.password);

  @override
  List<Object?> get props => [userName, password];
}
