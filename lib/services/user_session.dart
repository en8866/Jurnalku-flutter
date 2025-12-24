import 'package:jurnalku/models/models.dart';
class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;
  UserSession._internal();

  String? username;
  String? token;
  int? idUser;  // ✅ MUST HAVE THIS
  DataSiswa? studentData;  // ✅ MUST HAVE THIS

  void setUser(String user, int id) {
    username = user;
    idUser = id;  // ✅ This sets the idUser
    print('✅ UserSession.setUser called: username=$user, idUser=$id');
  }

  void clear() {
    username = null;
    token = null;
    idUser = null;
    studentData = null;
    print('🧹 UserSession cleared');
  }
}