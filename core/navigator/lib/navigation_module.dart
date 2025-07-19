import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/domain/usecase/login_usecase_impl.dart';
import 'package:login/presentation/controller/login_bloc.dart';
import 'package:login/presentation/screens/homescreen.dart';
import 'package:login/presentation/screens/login_screen.dart';
import 'package:movie_clean_architecture_modules/di/injection.dart';
import 'package:navigator/bloc/navigation_bloc.dart';
import 'package:navigator/bloc/navigation_state.dart';

import 'navigation_routes.dart';
import 'navigation_types.dart';

class NavigationModule extends StatelessWidget {
  const NavigationModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(create: (_) => LoginBloc(getIt<LoginUseCase>())),
        // BlocProvider(create:(_) => HomeBloc() , )
      ],
      child: MaterialApp(
        routes: {
          NavigationRoutes.home: (context) => const HomeScreen(),
          NavigationRoutes.login: (context) => LoginScreen(),
        },

        home: BlocListener<NavigationBloc, NavigationState>(
          child: LoginScreen(), // initial screen
          listener: (context, state) {
            if (state.routeName.isNotEmpty) {
              if (state.navigationType == NavigationType.push) {
                Navigator.pushNamed(context, state.routeName);
              } else if (state.navigationType ==
                  NavigationType.pushReplacement) {
                Navigator.pushReplacementNamed(context, state.routeName);
              } else if (state.navigationType == NavigationType.pop) {
                Navigator.of(context, rootNavigator: true).pop(true);
              }
            }
          },
        ),
      ),
    );
  }
}
