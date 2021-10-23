import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Your settings'),
          TextButton(
            child: Container(
              color: Colors.redAccent,
              child: const Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              return Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
