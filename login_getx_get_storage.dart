import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  await GetStorage.init(); // Initialize GetStorage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    String? token = storage.read('token');

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: token != null ? HomePage() : LoginPage());
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final storage = GetStorage();

  Future<void> login(String username, String password) async {
    try {
      final url = Uri.parse(
          'https://micropos.app/api/login?username=$username&password=$password');
      final response = await http.post(url);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['success']) {
          // Save token to GetStorage
          storage.write('token', responseData['data']['token']);
          storage.write('name', responseData['data']['name']);

          // Navigate to HomePage
          Get.off(HomePage());
        } else {
          Get.snackbar('Login Failed', responseData['message'],
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar('Error', 'Server error. Please try again later.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                if (username.isNotEmpty && password.isNotEmpty) {
                  login(username, password);
                } else {
                  Get.snackbar('Error', 'Please fill in all fields.',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final String? name = storage.read('name');

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              storage.erase(); // Clear stored data
              Get.offAll(LoginPage()); // Navigate to LoginPage
            },
          )
        ],
      ),
      body: Center(
        child: Text('Welcome, $name!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
