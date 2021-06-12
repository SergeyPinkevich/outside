import 'package:flutter/material.dart';

class ErrorSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Text(
            "⛔️",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "Something went wrong",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
