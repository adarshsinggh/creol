import 'dart:convert';

import 'package:creole/models/User.dart';
import 'package:http/http.dart' as http;

class AvatarRepository {
  Future<UserData> getUsers({required int page}) async {
    final url = Uri.parse('https://reqres.in/api/users?page=$page');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final userList = data['data'] as List<dynamic>;
      final totalPages = data['total_pages'] as int;

      final List<User> users = userList.map((json) => User.fromJson(json)).toList();

      return UserData(users, totalPages);
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}

