import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  final VoidCallback onPressed;

  const AuthenticationPage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You are connected'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.greenAccent,
                child: const Text('Click me to connect.'),
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
