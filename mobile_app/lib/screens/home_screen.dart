import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color logoTeal = Color(0xFF008080);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header مع اللوجو
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CureConnect AI", style: TextStyle(color: logoTeal, fontSize: 26, fontWeight: FontWeight.bold)),
                  CircleAvatar(backgroundColor: Colors.white, child: Image.asset('assets/images/logo.png', height: 25)),
                ],
              ),
              SizedBox(height: 25),

              // كرت الـ AI (The AI Insight)
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: logoTeal.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: logoTeal)),
                child: Row(
                  children: [
                    Icon(Icons.psychology, color: logoTeal, size: 40),
                    SizedBox(width: 15),
                    Expanded(child: Text("AI Analysis: All drawers are synced. Patient vitals are stable.", style: TextStyle(color: Colors.white70))),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // قسم الأدراج (The Drawers)
              Text("Medicine Drawers", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _drawerCard("Drawer 1", "Panadol", true),
                  _drawerCard("Drawer 2", "Empty", false),
                ],
              ),
              SizedBox(height: 25),

              // قسم الخريطة (Google Maps Placeholder)
              Text("Patient Location", style: TextStyle(color: Colors.white, fontSize: 18)),
              SizedBox(height: 15),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage("https://maps.googleapis.com/maps/api/staticmap?center=Alexandria,Egypt&zoom=13&size=600x300&key=YOUR_KEY"), // صورة خريطة تجريبية
                    fit: BoxFit.cover
                  )
                ),
                child: Center(child: Icon(Icons.location_on, color: Colors.red, size: 40)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerCard(String name, String med, bool isFull) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2, color: isFull ? Colors.green : Colors.grey, size: 40),
          Text(name, style: TextStyle(color: Colors.white)),
          Text(med, style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
