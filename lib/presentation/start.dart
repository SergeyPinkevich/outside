import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(174, 205, 255, 1.0),
              Color.fromRGBO(255, 255, 255, 1.0)
            ],
            stops: [
              0.0,
              1.0
            ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Find the ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 40,
                    ),
                    children: [
                      TextSpan(
                        text: "Sun",
                        style: TextStyle(
                          color: Color.fromRGBO(239, 204, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 40,
                        ),
                      ),
                      TextSpan(text: " in your City!")
                    ]),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 16, 40, 40),
              child: Text(
                "Don't give - there will be sun one day :)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 64),
            child: Container(
              height: 56,
              width: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(88, 150, 253, 1.0),
                      Color.fromRGBO(130, 177, 254, 1.0)
                    ],
                    stops: [
                      0.0,
                      1.0
                    ]),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(174, 205, 255, 1.0),
                    offset: Offset(0, 4.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    "Get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
