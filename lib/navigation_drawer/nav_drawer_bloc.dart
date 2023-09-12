import 'dart:async';

import 'package:demo_bloc/navigation_drawer/nav_drawer_provider.dart';

class NavigationDrawerBloc {
  final navigaitonControler = StreamController();
  NavigationDrawerProvider navigationDrawerProvider =
      NavigationDrawerProvider();

  Stream get getNavigation => navigaitonControler.stream;

  void updateNavigation(String navigation) {
    navigationDrawerProvider.updateNavigation(navigation);
    navigaitonControler.sink.add("Home");
  }

  void dispose() {
    navigaitonControler.close();
  }
}
