class UserManager {
  static Map<String, dynamic>? _userData;

  static void registerUser ({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    _userData = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  static bool loginUser (String name, String password) {
    if (_userData == null) return false;
    return _userData!['name'] == name.trim() && _userData!['password'] == password.trim();
  }
 static Map<String, dynamic>? getUserData() => _userData;

  static void clearUser () {
    _userData = null;
  }
}