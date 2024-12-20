import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'ContactScreen.dart';
class FormScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  Future<void> saveData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('contact', contactController.text);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => saveData(context),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}