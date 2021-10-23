import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator 2.0 101 - Other page'),
      ),
      body: const Center(
        child: Text('You did it!'),
      ),
    );
  }
}
