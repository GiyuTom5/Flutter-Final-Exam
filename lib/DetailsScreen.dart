import 'package:flutter/material.dart';
import 'FromScree.dart';
import 'FromScree.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://picsum.photos/400/200'),
          SizedBox(height: 16),
          Text('I am Tazbih Ahasan ', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormScreen()),
              );
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}