import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/core/common/widgets/section_title.dart';
import 'package:instagram/feature/auth/presentation/views/terms_screen.dart';

class UsernameSetupScreen extends StatefulWidget {
  const UsernameSetupScreen({super.key});

  @override
  State<UsernameSetupScreen> createState() => _UsernameSetupScreenState();
}

class _UsernameSetupScreenState extends State<UsernameSetupScreen> {
  final TextEditingController controller = TextEditingController();

  bool _isUsernameValid = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        _isUsernameValid = controller.text.trim().length >= 2;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _goToNextScreen() {
    if (!_isUsernameValid) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TermsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const SectionTitle(
              title: 'Create a username',
              subtitle:
                  'Add a username or use our suggestion. '
                  'You can change this at any time',
            ),

            const SizedBox(height: 20),

            _inputField(controller),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: IGButton(
                text: 'Next',
                onPressed: _isUsernameValid ? _goToNextScreen : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xff121212),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: controller.text.isEmpty
              ? Colors.grey.shade800
              : _isUsernameValid
              ? Colors.green
              : Colors.red,
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
            suffixIconConstraints: const BoxConstraints(
              minHeight: 20,
              minWidth: 20,
            ),
            suffixIcon: controller.text.isEmpty
                ? null
                : _isUsernameValid
                ? const Icon(Icons.check_circle, color: Colors.green, size: 20)
                : const Icon(Icons.cancel, color: Colors.red, size: 20),
          ),
        ),
      ),
    );
  }
}
