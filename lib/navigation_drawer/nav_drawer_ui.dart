import 'package:demo_bloc/navigation_drawer/nav_drawer_bloc.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationDrawerBloc bloc = NavigationDrawerBloc();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Admin"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
              accountEmail: Text("admin123@gmail.com"),
            ),
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                bloc.updateNavigation("Home");
              },
            ),
            ListTile(
              title: const Text("Page One"),
              onTap: () {
                Navigator.of(context).pop();
                bloc.updateNavigation("PageOne");
              },
            ),
            ListTile(
              title: const Text("Page Two"),
              onTap: () {
                Navigator.of(context).pop();
                bloc.updateNavigation("PageTwo");
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: bloc.getNavigation,
        initialData: bloc.navigationDrawerProvider.currentNavigation,
        builder: (context, snapshot) {
          if (bloc.navigationDrawerProvider.currentNavigation == "Home") {
            return const Home();
          }
          if (bloc.navigationDrawerProvider.currentNavigation == "PageOne") {
            return const PageOne();
          }
          if (bloc.navigationDrawerProvider.currentNavigation == "PageTwo") {
            return const PageTwo();
          }
          return const Home();
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home"));
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("PageOne"));
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("PageTwo"));
  }
}
