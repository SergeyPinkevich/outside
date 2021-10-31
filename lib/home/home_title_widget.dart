import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTitleWidget extends StatelessWidget {
  late String _cityName;
  late String _countryName;

  HomeTitleWidget(String cityName, String countryName) {
    _cityName = cityName;
    _countryName = countryName;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              _cityName.toUpperCase(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            child: Text(
              _countryName,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            child: Text(
              getCurrentDate(),
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }

  String getCurrentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat.MMMMEEEEd();
    return formatter.format(now);
  }
}
