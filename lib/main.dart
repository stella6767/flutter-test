import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/widget/screen/home.dart';
import 'package:test_flutter/widget/screen/todo.dart';

import 'config/grobal_variable.dart';


void main() async {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice App',
      home: const MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Lab"),
      ),
      body: Navigator(
        key: GlobalVariable.navigatorState,
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case HomeScreen.routeName:
              builder = (BuildContext context) => const HomeScreen();
              break;
            case TodoScreen.routeName:
              builder = (BuildContext context) => const TodoScreen();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          ); // Ensure to return MaterialPageRoute
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => GlobalVariable.navigatorState.currentState!.pushNamed(HomeScreen.routeName),
            )
          ],
        ),
      ),
    );
  }
}