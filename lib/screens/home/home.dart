import 'package:Project3/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Authentication'),
          backgroundColor: Colors.orange[700],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        
         new Image.asset('assets/birdLogo.png', width: 200.0, height: 200.0),
         
          Text("Welcome",
          style: TextStyle(color: Colors.orange[700],
          fontSize: 36.0, fontWeight: FontWeight.bold)
          ),
        ],
          ),
        ),
      );
  }
}