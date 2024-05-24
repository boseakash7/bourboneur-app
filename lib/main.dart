import 'package:bourboneur/Core/BlogController.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/pages/sign_in.dart';
import 'package:bourboneur/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  Get.put(Controller(), permanent: true);
  Get.put(BlogController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bourboneur',
      theme: ThemeData(
      
        textTheme: TextTheme(
          headlineSmall: const TextStyle(color: Color(0xFFd5bb9b)),
          headlineMedium: GoogleFonts.notoSans(
            color: Color(0xFFd5bb9b),
            fontSize: 28, 
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: const TextStyle(color: Colors.white),
          displayLarge: const TextStyle(color: Colors.white),
          displayMedium: const TextStyle(color: Colors.white),
          displaySmall: const TextStyle(color: Colors.white),
          bodyLarge: const TextStyle(color: Colors.white),
          bodyMedium: const TextStyle(color: Color(0xFFd5bb9b)),
          bodySmall: GoogleFonts.notoSans(
            color: Color(0xFFd5bb9b),
            fontSize: 14,
          ),
          labelMedium: GoogleFonts.notoSans(
            color: Colors.white,
            fontSize: 14,
          ),          
          titleMedium:  const TextStyle(
            fontFamily: 'TradeGothic',
            fontWeight: FontWeight.bold,                 
            color: Color(0xFFd5bb9b),
            fontSize: 14,
          )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF000000).withOpacity(1),
          foregroundColor: const Color(0xFF000000).withOpacity(1),
          surfaceTintColor: const Color(0xFF000000).withOpacity(1),          
          iconTheme: const IconThemeData(
            color: Color(0xffe17f2f)
          )
        ),
        colorScheme: ColorScheme.fromSwatch(          
          backgroundColor: const Color(0xFF000000).withOpacity(1),          
        ),
        useMaterial3: true,        
      ),
      home: const SplashPage(),
    );
  }
}

