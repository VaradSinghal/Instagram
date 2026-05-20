import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/core/common/widgets/ig_button.dart';
import 'package:instagram/core/common/widgets/section_title.dart';
import 'package:instagram/feature/auth/presentation/widgets/already_have_account_section.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateBirthdayText(_selectedDate);
  }

  void _updateBirthdayText(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final formattedDate = "${months[date.month - 1]} ${date.day}, ${date.year}";
    _birthdayController.text = formattedDate;
  }

  @override
  void dispose() {
    _birthdayController.dispose();
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
              title: 'When is your birthday?',
              subtitle:
                  'Use your won birthday, even if this account is for a business, a pet, or something else. You can always make your birthday private later.',
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: _pickDate,
              child: Container(
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
                      child: Text(
                        _birthdayController.text,
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey, size: 18),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: IGButton(text: 'Next', onPressed: (){

              }),
            ),

            Spacer(),

            AlreadyHaveAccountSection(),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.blue,
              onPrimary: Colors.white,
              surface: Color(0xFF121212),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if(pickedDate != null){
      setState(() {
        _selectedDate = pickedDate;
        _updateBirthdayText(pickedDate);
      });
    }
  }
}
