
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigator/bloc/navigation_state.dart';
import '../navigation_routes.dart';
import '../navigation_types.dart';
import 'navigation_events.dart';

class NavigationBloc extends Bloc<NavigationEvents, NavigationState> {
  NavigationBloc() : super(NavigationState('',NavigationType.push)){

    on<NavigateToHome> ((event, emit) {
      emit(NavigationState(NavigationRoutes.home, NavigationType.replace));
    });

    on<NavigateToLogin>((event, emit) {
      emit(NavigationState(NavigationRoutes.login, NavigationType.replace));
    });
      // Handle custom navigation events
    on<NavigateToRoute>((event, emit) {
      emit(NavigationState(event.routeName, event.navigationType));
    });
  }

}