import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<String> postUser(String? username) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': username,
        'job': 'FlutterDev',
      }),
    );
    if (response.statusCode == 201) {
      return 'User created successfully: ${response.body}';
    } else {
      return 'Failed to create user: ${response.statusCode}';
    }
  }

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=2'),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }
}
