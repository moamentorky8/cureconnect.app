import 'package:flutter/material.dart';
import 'patient_data_screen.dart'; // الشاشة الجديدة اللي هنكريتها

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color logoTeal = Color(0xFF008080);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset('assets/images/logo.png', height: 100),
            SizedBox(height: 20),
            Text("CureConnect", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            // حقول الإدخال
            _buildTextField("Email", Icons.email),
            SizedBox(height: 15),
            _buildTextField("Password", Icons.lock, isPassword: true),
            SizedBox(height: 30),
            // زرار تسجيل الدخول
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: logoTeal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  // هنا بيروح لشاشة البيانات عشان يكمل بروفايل المريض
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PatientDataScreen()));
                },
                child: Text("LOGIN / SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20),
            Text("By logging in, you agree to monitor patient vitals safely.", 
              textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF008080)),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF1A1A1A),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }
}
