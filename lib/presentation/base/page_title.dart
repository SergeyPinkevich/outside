import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  PageTitle(String title) {
    _title = title;
  }

  String _title;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 56, 16, 0),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
