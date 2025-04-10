import '../models/github_user_model.dart';

abstract class GitHubRepository {
  Future<GitHubUser> getUser(String username);
} 