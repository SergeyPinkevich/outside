import 'package:flutter/material.dart';

class EmptySearchResults extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          Text(
            "🤷‍♂️",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "Unfortunately, we couldn’t find the city with such name",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
