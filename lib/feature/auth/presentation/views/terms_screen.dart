import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/feature/auth/presentation/views/add_profile_picture_screen.dart';
import 'package:instagram/feature/auth/presentation/widgets/already_have_account_section.dart';

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
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              "Agree to Instagram's terms and policies",
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            RichText(
              text: TextSpan(
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: Colors.white,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text:
                        "People who use our service may have uploaded your contact information to Instagram.",
                  ),
                  TextSpan(text: "Learn more\n\n"),
                  TextSpan(
                    text:
                        "By tapping I agree, you agree to create an account and to Instagram\ 's",
                  ),
                  TextSpan(text: "Terms, Privacy Policy."),
                  TextSpan(text: "and "),
                  TextSpan(text: "Cookies Policy.\n\n"),
                  TextSpan(
                    text:
                        "The Privacy Policy describes the ways we can use the information we collect when you create an acccount. For example, we use this information to provice, personalize and imporve our products, including ads.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: IGButton(text: 'I agree', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddProfilePictureScreen()));
              }),
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
