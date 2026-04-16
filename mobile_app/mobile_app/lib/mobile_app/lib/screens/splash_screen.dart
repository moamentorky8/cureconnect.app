import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الأبلكيشن هيقف هنا 3 ثواني يعرض اللوجو وبعدين يدخل على الصفحة الرئيسية
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // الألوان من اللوجو بتاعك
    final Color logoTeal = Color(0xFF008080); 

    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء عشان تنطق ألوان اللوجو
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // اللوجو في منتصف الشاشة
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo.png'), 
            ),
            SizedBox(height: 30),
            // شريط تحميل بسيط
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(logoTeal),
            ),
            SizedBox(height: 20),
            Text(
              "CureConnect",
              style: TextStyle(
                color: logoTeal,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
