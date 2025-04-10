import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/github_user_model.dart';
import '../../domain/repositories/github_repository.dart';

class GitHubService implements GitHubRepository {
  final String baseUrl = 'https://api.github.com';

  @override
  Future<GitHubUser> getUser(String username) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$username'),
        headers: {'Accept': 'application/vnd.github.v3+json'},
      );

      if (response.statusCode == 200) {
        return GitHubUser.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
} 