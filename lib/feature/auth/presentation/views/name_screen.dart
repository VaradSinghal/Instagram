import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/feature/auth/presentation/widgets/already_have_account_section.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Text(
              "What's your name?",
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: PlatformTextField(controller: _namecontroller),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: IGButton(text: 'Next', onPressed: () {}),
            ),
            Spacer(),

            AlreadyHaveAccountSection(),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class PlatformTextField extends StatelessWidget {
  final TextEditingController controller;

  const PlatformTextField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: GoogleFonts.outfit(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Full name",
        hintStyle: GoogleFonts.outfit(color: Colors.grey, fontSize: 14),
        border: InputBorder.none,
      ),
    );
  }
}
