import 'package:flutter/material.dart';

class FullScreenLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2), // Semi-transparent black color
      width: double.infinity,
      height: double.infinity,
      child: Center(
      child: CircularProgressIndicator(),
    ),
    );
  }
}
