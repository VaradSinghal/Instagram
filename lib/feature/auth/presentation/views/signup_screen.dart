import 'package:flutter/material.dart';
import 'package:instagram/core/common/widgets/section_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isEmail = false;
  @override
  Widget build(BuildContext context) {
    final title = isEmail
        ? "What's your email address"
        : "What's your mobile number";

    final subtitle = isEmail
        ? "Enter the email address at which you can be contacted. No one will see this on your profile."
        : "Enter the mobile number at which you can be contacted. No one will see this on your profile.";
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            SectionTitle(title: title, subtitle: subtitle),
          ],
        ),
      ),
    );
  }
}
