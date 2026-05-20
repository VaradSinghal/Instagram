import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            "Agree to Instagram's terms and policies"
          ),
        ],
      ),),
    );
  }
}