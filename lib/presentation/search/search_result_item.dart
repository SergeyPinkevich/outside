import 'package:flutter/material.dart';
import 'package:outside/domain/city.dart';
import 'package:outside/utils/country_code.dart';
import 'package:outside/navigation/router.dart';

class SearchResultItem extends StatelessWidget {
  City _city;

  SearchResultItem(City city) {
    _city = city;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(88, 150, 253, 1.0),
              Color.fromRGBO(174, 205, 255, 1.0)
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(openHomePage(_city));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Text(
                  "${_city.name}",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .apply(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "${getCountryNameByCode(_city.countryCode)}",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "${_city.currentTemperature}°",
                  style: TextStyle(
                    fontSize: 64,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
