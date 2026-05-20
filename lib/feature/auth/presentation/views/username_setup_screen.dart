import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/core/common/widgets/section_title.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),
            SectionTitle(
              title: 'Create a username',
              subtitle:
                  'Add a username or use our suggestion. You can change this at any time',
            ),
            const SizedBox(height: 20),

            _inputField(controller),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: IGButton(text: 'Next', onPressed: () {
                
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller) {
    return Container(
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xff121212),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _isUsernameValid ? Colors.grey.shade800 : Colors.red,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: GoogleFonts.outfit(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Username',
            hintStyle: GoogleFonts.outfit(color: Colors.grey, fontSize: 14),
            border: InputBorder.none,
            isDense: true,
            suffixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 20),
            suffixIcon: _isUsernameValid
                ? Icon(Icons.check_circle, color: Colors.green, size: 20)
                : Icon(Icons.cancel, color: Colors.red, size: 20),
          ),
        ),
      ),
    );
  }
}
