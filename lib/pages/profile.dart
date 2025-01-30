import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // ฟังก์ชัน Sign-in ด้วย Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      // สร้าง provider สำหรับการเข้าสู่ระบบผ่าน Google
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // ทำการเข้าสู่ระบบผ่าน Firebase ด้วย Google
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } catch (e) {
      print("Error during Google Sign-In: $e");
      rethrow; // เพื่อให้โปรแกรมรับรู้ข้อผิดพลาด
    }
  }

  // ฟังก์ชันสำหรับออกจากระบบ Google และ Firebase
  Future<void> googleSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      print("Error during Google Sign-Out: $e");
    }
  }
}
