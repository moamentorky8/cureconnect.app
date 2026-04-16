import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الألوان المستوحاة من اللوجو بتاعك
    final Color logoTeal = Color(0xFF008080); // الجنزاري
    final Color logoGreen = Color(0xFF90EE90); // الأخضر الفاتح
    final Color cardBg = Color(0xFF1A1A1A); // رمادي غامق جداً للـ Dark Mode

    return Scaffold(
      backgroundColor: Colors.black, // خلفية سوداء ملكية
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("CureConnect", style: TextStyle(color: logoTeal, fontSize: 28, fontWeight: FontWeight.bold)),
                      Text("Live Monitoring", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    ],
                  ),
                  // اللوجو الصغير في الجنب
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // --- Medicine Tank Card ---
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: logoTeal.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: 0.85, // نسبة الدواء
                            strokeWidth: 8,
                            backgroundColor: Colors.black26,
                            color: logoTeal,
                          ),
                        ),
                        Text("85%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Medicine Tank", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Status: Excellent", style: TextStyle(color: logoGreen)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),

              // --- Grid of Status ---
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    _buildStatusCard("SOS System", "SECURE", Icons.shield, logoTeal, cardBg),
                    _buildStatusCard("Motion", "ACTIVE", Icons.visibility, logoGreen, cardBg),
                    _buildStatusCard("Bracelet", "LINKED", Icons.watch, Colors.blueAccent, cardBg),
                    _buildStatusCard("Temperature", "32°C", Icons.thermostat, Colors.orangeAccent, cardBg),
                  ],
                ),
              ),

              // --- Emergency SOS Button ---
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {}, // سيتم ربطه بالـ Firebase لاحقاً
                  child: Text("TRIGGER SOS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String value, IconData icon, Color color, Color bg) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 35),
          SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
