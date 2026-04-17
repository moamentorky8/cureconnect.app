import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  // قراءة حالة الـ SOS
  Stream<DatabaseEvent> watchSOS() {
    return _dbRef.child('system_status/sos').onValue;
  }

  // قراءة مستوى الدواء
  Stream<DatabaseEvent> watchTankLevel() {
    return _dbRef.child('system_status/tank_level').onValue;
  }
}
