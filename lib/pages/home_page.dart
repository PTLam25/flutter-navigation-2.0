import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onPressed;

  const HomePage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator 2.0 101 - Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.greenAccent,
                child: const Text('Click me to navigate.'),
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
