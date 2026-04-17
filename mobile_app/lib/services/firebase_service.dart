import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  // اللينك بتاعك تم وضعه هنا للربط المباشر
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://cureconnect-c2c14-default-rtdb.europe-west1.firebasedatabase.app/',
  ).ref();

  // قراءة حالة الـ SOS من الداتا بيز الحقيقية
  Stream<DatabaseEvent> watchSOS() {
    return _dbRef.child('system_status/sos').onValue;
  }

  // قراءة مستوى الخزان (المنظم)
  Stream<DatabaseEvent> watchTankLevel() {
    return _dbRef.child('system_status/tank_level').onValue;
  }
  
  // تحديث بيانات المريض
  Future<void> updatePatientData(Map<String, dynamic> data) async {
    await _dbRef.child('patient_profile').set(data);
  }
}
