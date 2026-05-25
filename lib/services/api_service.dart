import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://127.0.0.1:5000";

  static Future<List<String>> getRecommendations(List<String> cart) async {
    final response = await http.post(
      Uri.parse("$baseUrl/recommend"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"cart": cart}),
    );

    final data = jsonDecode(response.body);
    return List<String>.from(data["recommendations"]);
  }

  static Future<List<String>> getRoute(String from, String to) async {
    final response = await http.post(
      Uri.parse("$baseUrl/route"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"from": from, "to": to}),
    );

    final data = jsonDecode(response.body);
    return List<String>.from(data["path"]);
  }
}