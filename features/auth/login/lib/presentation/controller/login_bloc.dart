import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase_impl.dart';
import 'package:login/presentation/controller/login_events.dart';
import 'package:login/presentation/controller/login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginUseCaseImpl loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    // handle UserNameChanged event
    on<UserNameChanged>((event, emit) {});
    // handle PasswordChanged event
    on<PasswordChanged>((event, emit) {});
    // handle LoginButtonPressed event
    on<LoginButtonPressed>((event, emit) {});
  }
}
