import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // المكتبة اللي ضفناها
import 'screens/splash_screen.dart';

void main() async {
  // السطرين دول هما اللي بيربطوا الأبلكيشن بالداتا بيز والملف اللي هترفعه
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(); // بيبحث عن ملف google-services.json
    print("Firebase connected successfully!");
  } catch (e) {
    print("Firebase Error: $e");
  }

  runApp(CureConnectApp());
}

class CureConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CureConnect',
      theme: ThemeData(
        brightness: Brightness.dark,
        // اللون الجنزاري بتاع اللوجو
        primaryColor: Color(0xFF008080), 
        scaffoldBackgroundColor: Colors.black,
        // تحسين شكل الزراير عشان تليق مع التصميم
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF008080),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      home: SplashScreen(), 
    );
  }
}
