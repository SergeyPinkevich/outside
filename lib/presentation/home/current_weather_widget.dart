import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(255, 255, 255, 1.0),
      Color.fromRGBO(255, 255, 255, 0.0),
    ],
  ).createShader(new Rect.fromCircle(center: Offset(120, 0), radius: 150));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          width: MediaQuery.of(context).size.width - 48,
          height: 200,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    height: 156,
                    width: 156,
                    transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                    child: Image.asset("assets/images/start.png"),
                  ),
                  Spacer(),
                  Container(
                    transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                    child: Text(
                      "Sunny",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    text: "27°",
                    colors: <Color>[
                      Color.fromRGBO(255, 255, 255, 1.0),
                      Color.fromRGBO(255, 255, 255, 0.0)
                    ],
                    gradientDirection: GradientDirection.ttb,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 84,
                    ),
                  ),
                  Spacer(),
                  Container(
                    transform: Matrix4.translationValues(0.0, -64.0, 0.0),
                    child: Text(
                      "Feels like 25",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(88, 150, 253, 1.0),
                Color.fromRGBO(174, 205, 255, 1.0)
              ],
              stops: [0.0, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(174, 205, 255, 1.0),
                offset: Offset(0, 20.0),
                blurRadius: 20.0,
                spreadRadius: -8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
