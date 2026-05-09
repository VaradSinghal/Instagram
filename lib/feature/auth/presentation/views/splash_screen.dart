import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/feature/auth/presentation/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 120.w,
                height: 120.h,
                child: Image.asset(
                  'assets/images/ig_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Positioned(
              bottom: 30.h,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 80.w,
                  height: 80.h,
                  child: Image.asset(
                    'assets/images/meta.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
