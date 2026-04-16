import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';

void main() async {
  // التأكد من تهيئة كل خدمات الأندرويد/آيفون قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  
  // ملحوظة: سطر الـ Firebase سيحتاج ملف google-services.json ليعمل حقيقياً
  // await Firebase.initializeApp(); 
  
  runApp(CureConnectApp());
}

class CureConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CureConnect',
      // إعدادات الثيم (Dark Mode) لتتماشى مع ذوقك واللوجو
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF008080), // لون الجنزاري من اللوجو
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      // البداية من شاشة اللوجو (Splash)
      home: SplashScreen(), 
    );
  }
}
