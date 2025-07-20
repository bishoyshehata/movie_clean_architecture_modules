
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/bloc/home_event.dart';
import 'package:main/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(HomeState(0)) {

    on<ChangeTabEvent>((event, emit) {
        emit(HomeState(event.index));
    });
  }
}