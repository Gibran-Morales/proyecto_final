import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activity.dart';

class ApiService {
  final String baseUrl = 'https://apireport-production.up.railway.app';

  Future<List<Activity>> getActivities() async {
    final response = await http.get(Uri.parse('$baseUrl/reports'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Activity.fromJson(item)).toList();
    } else {
      throw Exception('Error al obtener las actividades');
    }
}
  Future<bool> addActivity(Activity activity) async {
    try {
    final response = await http.post(
      Uri.parse('$baseUrl/reports'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(activity.toJson()),
    );

    print('STATUS: ${response.statusCode}');
    print('BODY: ${response.body}');

    return response.statusCode == 200 || response.statusCode == 201;
  } catch (e) {
    print('ERROR en addActivity: $e');
        return false;  
  }
}

  Future<bool> deleteActivity(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/reports/$id'),
      );
      print('DELETE status: ${response.statusCode}');
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      print('ERROR en deleteActivity: $e');
      return false;
    }
  }
}