import 'dart:convert';
import 'package:form_validation/src/preferences/preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = '';
  final UserPreferences _prefs = UserPreferences();

  Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
    return handleAuth(email, password, 'signUp');
  }

  Future<Map<String, dynamic>> logInUser(String email, String password) async {
    return handleAuth(email, password, 'signInWithPassword');
  }

  Future<Map<String, dynamic>> handleAuth(
      String email, String password, String method) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$method?key=$_firebaseToken';
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }
}
