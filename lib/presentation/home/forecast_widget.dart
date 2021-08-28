import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outside/presentation/home/forecast_for_time_frame_item.dart';

class ForecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .apply(color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "Tomorrow",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .apply(color: Colors.black),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 24),
                child: Row(
                  children: [
                    Text(
                      "More",
                      style: Theme.of(context).textTheme.headline4.apply(
                            color: Color.fromRGBO(88, 150, 253, 1.0),
                          ),
                    ),
                    SvgPicture.asset("assets/images/arrow.svg"),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 26),
            child: FutureBuilder<List<String>>(
              builder: (context, index) {
                return Container(
                  height: 96,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      return ForecastForTimeFrameItem();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
