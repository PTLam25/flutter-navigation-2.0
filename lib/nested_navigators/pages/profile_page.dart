import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfilePage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Your profile'),
    );
  }
}
