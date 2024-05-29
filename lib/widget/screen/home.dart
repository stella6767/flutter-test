import 'package:flutter/material.dart';
import 'package:test_flutter/widget/screen/todo.dart';

import '../../config/grobal_variable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 100,
          child: Ink(
            //decoration: BoxDecoration(color: Colors.green),
            color: Colors.green,
            child: InkWell(
              hoverColor: Colors.amber,
              onTap: () {
                print("Click event on Container");
                Navigator.pushNamed(context, TodoScreen.routeName);
              },
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Todo Page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
