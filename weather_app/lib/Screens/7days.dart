import 'package:flutter/material.dart';

class SevenDays extends StatelessWidget {
  const SevenDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("7 Days Forecast"),
      ),
      body: const Center(
        child: Text("7 Days weather forecast will appear here."),
      ),
    );
  }
}
