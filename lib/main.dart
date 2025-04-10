import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/github_user/presentation/pages/user_page.dart';
import 'features/github_user/data/services/github_service.dart';
import 'features/github_user/domain/repositories/github_repository.dart';
import 'features/github_user/presentation/controllers/user_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  final githubRepository = Get.put<GitHubRepository>(GitHubService());
  Get.put(UserController(repository: githubRepository));
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GitHub User Search',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: UserPage(),
    );
  }
}
