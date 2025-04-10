import 'package:get/get.dart';
import '../../domain/models/github_user_model.dart';
import '../../domain/repositories/github_repository.dart';

class UserController extends GetxController {
  final GitHubRepository repository;

  UserController({required this.repository});

  final user = Rx<GitHubUser?>(null);
  final isLoading = false.obs;
  final error = ''.obs;
  final previousUsers = <GitHubUser>[].obs;

  void clearUser() {
    user.value = null;
    error.value = '';
  }

  Future<void> searchUser(String username) async {
    if (username.isEmpty) return;

    try {
      isLoading.value = true;
      error.value = '';
      user.value = null;

      final result = await repository.getUser(username);
      user.value = result;
      if (!previousUsers.any((u) => u.login == result.login)) {
        previousUsers.insert(0, result);
        if (previousUsers.length > 5) {
          previousUsers.removeLast();
        }
      }
    } catch (e) {
      error.value = e.toString();
      user.value = null;
    } finally {
      isLoading.value = false;
    }
  }
} 