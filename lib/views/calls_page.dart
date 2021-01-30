import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'To start calling with meow, tap 📞 at the bottom of your screen',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
