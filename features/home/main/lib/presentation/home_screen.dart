import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/bloc/home_bloc.dart';
import 'package:main/bloc/home_event.dart';
import 'package:main/bloc/home_state.dart';
import 'package:movies/presentation/ui/movies_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeBloc(), child: HomeNavigatinoView());
  }
}

class HomeNavigatinoView extends StatelessWidget {
  HomeNavigatinoView({super.key});

  final List<Widget> _screens = [MoviesScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This prevents the default back button from showing up
        automaticallyImplyLeading: false,

        title: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(state.selectedIndex == 0 ? "Movies" : "Settings");
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return _screens[state.selectedIndex];
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<HomeBloc>().add(ChangeTabEvent(index));
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.movie),
                  label: "Movies",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ],
            );
          },
        ),

    );
  }
}
