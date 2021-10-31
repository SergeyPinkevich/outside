import 'package:flutter/material.dart';
import 'package:outside/search/search.dart';

class StartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Container(
              height: 256,
              width: 256,
              child: Image.asset("assets/images/start.png"),
              margin: EdgeInsets.fromLTRB(40, 0, 40, 48),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Find the ",
                    style: Theme.of(context).textTheme.headline1,
                    children: [
                      TextSpan(
                        text: "Sun",
                        style: TextStyle(
                          color: Color.fromRGBO(239, 204, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 40,
                        ),
                      ),
                      TextSpan(text: " in your City!")
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 16, 40, 40),
              child: Text(
                "Don't give up - there will be sun one day :)",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 64),
              child: StartButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(12),
        width: 304,
        height: 80,
        child: Ink(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(SearchPage.route());
            },
            child: Center(
              child: Text(
                "Get started",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
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
        ),
      ),
    );
  }
}
