import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  // مرجع لقاعدة البيانات (نفس المسار اللي الـ ESP32 بيبعت عليه)
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  // 1. مراقبة حالة الـ SOS (تنبيه البريسليت)
  Stream<DatabaseEvent> watchSOS() {
    return _dbRef.child('system_status/sos').onValue;
  }

  // 2. مراقبة حالة الحركة (PIR Sensor)
  Stream<DatabaseEvent> watchMotion() {
    return _dbRef.child('system_status/motion').onValue;
  }

  // 3. مراقبة مستوى الخزان (Medicine Tank)
  Stream<DatabaseEvent> watchTankLevel() {
    return _dbRef.child('system_status/tank_level').onValue;
  }

  // 4. دالة لإعادة ضبط الـ SOS من الموبايل (عشان الأهل يطمنوا السيستم)
  Future<void> resetSOS() async {
    await _dbRef.child('system_status').update({'sos': false});
  }
}
