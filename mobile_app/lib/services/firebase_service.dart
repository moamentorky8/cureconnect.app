import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  // إنشاء مرجع لقاعدة بيانات CureConnect
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  // 1. مراقبة حالة الـ SOS (البريسليت)
  Stream<DatabaseEvent> watchSOS() {
    return _dbRef.child('system_status/sos').onValue;
  }

  // 2. مراقبة مستوى خزان الدواء
  Stream<DatabaseEvent> watchTankLevel() {
    return _dbRef.child('system_status/tank_level').onValue;
  }

  // 3. مراقبة حالة الحركة (PIR Sensor)
  Stream<DatabaseEvent> watchMotion() {
    return _dbRef.child('system_status/motion').onValue;
  }

  // 4. دالة لإرسال أمر "صرف دواء يدوي" من الموبايل
  Future<void> triggerDispense() async {
    await _dbRef.child('commands').update({'dispense': true});
  }
}
