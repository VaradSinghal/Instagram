import 'package:flutter/material.dart';

class UsernameSetupScreen extends StatefulWidget {
  const UsernameSetupScreen({super.key});

  @override
  State<UsernameSetupScreen> createState() => _UsernameSetupScreenState();
}

class _UsernameSetupScreenState extends State<UsernameSetupScreen> {
  final controller = TextEditingController();
  bool _isUsernameValid = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      _isUsernameValid = controller.text.length >= 2;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
