import 'dart:io';
import 'dart:typed_data';

import 'package:bourboneur/Core/BlogController.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/pages/capture_payment_details.dart';
import 'package:bourboneur/pages/sign_in.dart';
import 'package:bourboneur/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  ByteData data = await rootBundle.load('assets/certificate/cert.pem');
  SecurityContext context = SecurityContext.defaultContext;
  context.setTrustedCertificatesBytes(data.buffer.asUint8List());

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
      
        textTheme: const TextTheme(
          headlineSmall: TextStyle(color: Color(0xFFd5bb9b)),
          headlineMedium: TextStyle(
            fontFamily: 'Arial',
            color: Color(0xFFd5bb9b),            
            fontSize: 28, 
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Color(0xFFd5bb9b)),
          bodySmall:  TextStyle(
            fontFamily: 'Arial',
            color: Color(0xFFd5bb9b),
            fontSize: 14,
          ),
          labelMedium:  TextStyle(
            fontFamily: 'Arial',
            color: Colors.white,
            fontSize: 14,
          ),          
          titleMedium:  TextStyle(
            fontFamily: 'Arial',
            fontWeight: FontWeight.bold,                 
            color: Color(0xFFd5bb9b),
            fontSize: 14,
          )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF000000).withOpacity(1),
          foregroundColor: Color(0xFF000000).withOpacity(1),
          surfaceTintColor: Color(0xFF000000).withOpacity(1),          
          iconTheme: IconThemeData(
            color: Color(0xffe17f2f)
          )
        ),
        colorScheme: ColorScheme.fromSwatch(          
          backgroundColor: Color(0xFF000000).withOpacity(1),          
        ),
        useMaterial3: true,        
      ),
      home: SplashPage(),
    );
  }
}

