import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddProfilePictureScreen extends StatelessWidget {
  const AddProfilePictureScreen({super.key});

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Add a profile picture",
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Add a profile picture so your friends know it\'s you.Everyone will be able to see your profile picture.",
                style: GoogleFonts.outfit(fontSize: 12, color: Colors.white),
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Add a profile picture",
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
