import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/core/common/widgets/section_title.dart';
import 'package:instagram/core/theme/app_colors.dart';
import 'package:instagram/feature/auth/presentation/widgets/already_have_account_section.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isEmail = false;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final title = isEmail
        ? "What's your email address"
        : "What's your mobile number";

    final subtitle = isEmail
        ? "Enter the email address at which you can be contacted. No one will see this on your profile."
        : "Enter the mobile number at which you can be contacted. No one will see this on your profile.";

    final hint = isEmail ? "Email address" : "Mobile number";

    final switchText = isEmail
        ? "Sign up with mobile number "
        : "Sign up with email address ";
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            SectionTitle(title: title, subtitle: subtitle),

            const SizedBox(height: 20),

            Container(
              height: 48,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade800),
              ),

              child: TextField(
                controller: controller,
                keyboardType: isEmail
                    ? TextInputType.emailAddress
                    : TextInputType.phone,
                style: GoogleFonts.outfit(color: Colors.white),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: GoogleFonts.outfit(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 6),
            if (!isEmail)
              Row(
                children: [
                  Text(
                    'You may recieve WhatsApp and SMS notification from us.',
                    style: GoogleFonts.outfit(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Learn more",
                      style: GoogleFonts.outfit(
                        color: AppColors.blue,
                        fontSize: (10),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: IGButton(text: 'Next', onPressed: () {}),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEmail = !isEmail;
                    controller.clear();
                  });
                },
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text(
                  switchText,
                  style: GoogleFonts.outfit(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
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
