import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactScreen extends StatelessWidget {
  Future<Map<String, String>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name') ?? 'No Name',
      'email': prefs.getString('email') ?? 'No Email',
      'contact': prefs.getString('contact') ?? 'No Contact',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: FutureBuilder<Map<String, String>>(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${data['name']}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Email: ${data['email']}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Contact: ${data['contact']}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Edit'),
                ),
              ],
            );
          } else {
            return Center(child: Text('Error loading data'));
          }
        },
      ),
    );
  }
}
