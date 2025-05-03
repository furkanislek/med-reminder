import 'package:flutter/material.dart';
import 'package:mr/services/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Auth().currentUser?.uid);
    print("------------------");
    return Scaffold(
      appBar: AppBar(title: Text("Medicine Reminder")),
      body: Text("DOLDUR"),
    );
  }
}
