import 'package:flutter/material.dart';
import 'home_screen.dart';

class PatientDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color logoTeal = Color(0xFF008080);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Patient Profile Setup", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Personal Information", style: TextStyle(color: logoTeal, fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            _buildInput("Full Name"),
            _buildInput("Age"),
            _buildInput("Weight (kg)"),
            _buildInput("Medical Condition (e.g. Diabetes)"),
            SizedBox(height: 25),
            Text("Medicine Schedule", style: TextStyle(color: logoTeal, fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            _buildInput("Medicine Name"),
            _buildInput("Dosage (e.g. 1 Pill)"),
            _buildInput("Time (e.g. 08:00 AM)"),
            SizedBox(height: 40),
            // زرار الحفظ والدخول للهوم
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: logoTeal, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text("SAVE & START MONITORING", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF008080))),
        ),
      ),
    );
  }
}
