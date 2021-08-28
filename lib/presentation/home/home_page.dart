import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outside/presentation/base/fab.dart';
import 'package:outside/presentation/home/addtional_info_widget.dart';
import 'package:outside/presentation/home/current_weather_widget.dart';
import 'package:outside/presentation/home/forecast_widget.dart';
import 'package:outside/presentation/home/home_title_widget.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 56),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: HomeTitleWidget("Tallinn", "Estonia"),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: FabButton(
                    SvgPicture.asset("assets/images/notification.svg"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24),
            child: CurrentWeatherWidget(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AdditionalInfoWidget(
                SvgPicture.asset("assets/images/rain.svg"),
                "12%",
              ),
              SizedBox(width: 32),
              AdditionalInfoWidget(
                SvgPicture.asset("assets/images/wind.svg"),
                "5 km/h",
              ),
              SizedBox(width: 32),
              AdditionalInfoWidget(
                SvgPicture.asset("assets/images/humidity.svg"),
                "26%",
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 24, 0, 0),
            child: ForecastWidget(),
          )
        ],
      ),
    );
  }
}
