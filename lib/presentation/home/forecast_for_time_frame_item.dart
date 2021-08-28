import 'package:flutter/material.dart';
import 'package:outside/presentation/base/shadow.dart';

class ForecastForTimeFrameItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Container(
          height: 96,
          width: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(80),
            boxShadow: [AppBoxShadow()],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text("12:00"),
              ),
              Container(
                height: 36,
                width: 36,
                child: Image.asset("assets/images/start.png"),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text(
                  "23°",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
