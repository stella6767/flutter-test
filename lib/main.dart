import 'package:flutter/material.dart';
import 'package:test_flutter/widget/screen/home.dart';
import 'package:test_flutter/widget/screen/todo.dart';

import 'config/grobal_variable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalVariable.navigatorState,
      title: 'practice App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Lab"),
        ),
        body: Navigator(
          key: GlobalVariable.navigatorState,
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case HomeScreen.routeName:
                return MaterialPageRoute(builder: (_) => HomeScreen());
              case TodoScreen.routeName:
                return MaterialPageRoute(builder: (_) => TodoScreen());
              default:
                return null;
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
          height: 50,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(GlobalVariable.navigatorState.currentContext!, '/');
                },
              )
            ],
          ),
        ),
      ),
      //initialRoute: HomeScreen.routeName,
      routes: {
        //HomeScreen.routeName: (context) => const HomeScreen(),
        TodoScreen.routeName: (context) => const TodoScreen(),
      },
    );
  }
}
