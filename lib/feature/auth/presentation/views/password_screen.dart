import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/core/common/widgets/section_title.dart';
import 'package:instagram/core/theme/app_colors.dart';
import 'package:instagram/feature/auth/presentation/views/birthday_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _savePasswordState = true;
  bool _obscureText = true;
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
              title: 'Create a password',
              subtitle: 'Create a password with at least 6 letters or numbers.',
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
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _passwordController,
                      style: GoogleFonts.outfit(color: Colors.white),
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GoogleFonts.outfit(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _savePasswordState,
                    onChanged: (value) {
                      setState(() {
                        _savePasswordState = value ?? true;
                      });
                    },
                    activeColor: AppColors.blue,
                    checkColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade600, width: 2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Remember login info',
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Learn More',
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: IGButton(
                text: 'Next',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BirthdayScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
