import 'package:flutter/material.dart';

import '../../config/grobal_variable.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  static const routeName = '/todo';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
