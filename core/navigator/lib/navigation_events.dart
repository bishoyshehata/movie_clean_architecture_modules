import 'package:navigator/navigation_types.dart';

abstract class NavigationEvents {}

class NavigateToHome extends NavigationEvents {}

class NavigateToLogin extends NavigationEvents {}

class NavigateToRoute extends NavigationEvents {
  final String routeName;
  final NavigationType navigationType;

  NavigateToRoute(this.routeName, this.navigationType);
}
