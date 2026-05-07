import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/core/theme/app_theme.dart';
import 'package:instagram/feature/auth/presentation/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Instagram Clone',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
