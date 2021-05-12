import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class SearchPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 96, 16, 0),
            child: Text(
              "Choose your city",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final Duration debounceDuration = Duration(milliseconds: 500);

  final searchController = TextEditingController();
  Timer debounce;

  @override
  void initState() {
    super.initState();
    searchController.addListener(searchCityByName);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
          height: 56,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                height: 24,
                width: 24,
                margin: EdgeInsets.only(left: 16),
                child: SvgPicture.asset("assets/images/search.svg"),
              ),
              Container(
                width: 300,
                height: 56,
                margin: EdgeInsets.only(top: 4, left: 8),
                child: TextField(
                  autofocus: true,
                  controller: searchController,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'City name',
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(88, 150, 253, 0.25),
                offset: Offset(0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchCityByName() {
    if (debounce?.isActive ?? false) {
      debounce.cancel();
    }
    debounce = Timer(debounceDuration, () {
      // TODO make search request from here
      print(searchController.text);
    });
  }

  @override
  void dispose() {
    debounce.cancel();
    searchController.dispose();
    super.dispose();
  }
}
