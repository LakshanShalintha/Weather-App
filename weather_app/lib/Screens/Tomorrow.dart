import 'package:flutter/material.dart';

class Tomorrow extends StatelessWidget {
  const Tomorrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomorrow's Weather"),
      ),
      body: Center(
        child: const Text("Details for tomorrow's weather will appear here."),
      ),
    );
  }
}
