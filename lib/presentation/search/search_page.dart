import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outside/data/network/api.dart';
import 'package:outside/presentation/search/search_item.dart';

import 'dart:async';

import 'package:outside/domain/city.dart';

class SearchPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 56, 16, 0),
            child: Text(
              "Choose your city",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SearchContainer(),
        ],
      ),
    );
  }
}

class SearchContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchContainerState();
}

class SearchContainerState extends State<SearchContainer> {
  final Duration debounceDuration = Duration(milliseconds: 500);
  Timer debounce;

  final searchController = TextEditingController();

  Future<List<City>> _searchResults;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
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
                    margin: EdgeInsets.only(
                      top: 4,
                      left: 8,
                    ),
                    child: TextField(
                        autofocus: true,
                        controller: searchController,
                        style: Theme.of(context).textTheme.bodyText1,
                        onChanged: (text) {
                          onSearchBarTextChaned(text);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'City name',
                        ),
                        keyboardType: TextInputType.text),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FutureBuilder<List<City>>(
                future: _searchResults,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        shrinkWrap: true,
                        itemCount:
                            snapshot.data == null ? 0 : snapshot.data.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return SearchResultItem(snapshot.data[index]);
                        },
                      );
                    } else {
                      return Text('${snapshot.error}');
                    }
                  }
                  return Padding(
                      padding: EdgeInsets.only(top: 48),
                      child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }

  void onSearchBarTextChaned(String text) {
    if (debounce?.isActive ?? false) {
      debounce.cancel();
    }
    debounce = Timer(debounceDuration, () {
      var results = searchCityByQuery(text);
      setState(() {
        _searchResults = results;
      });
    });
  }

  Future<List<City>> searchCityByQuery(String searchQuery) async {
    bool shouldMakeSearch = searchQuery.isNotEmpty && searchQuery.length > 2;
    if (shouldMakeSearch) {
      return searchCityByName(searchQuery);
    } else {
      return Future.value(List.empty());
    }
  }

  @override
  void dispose() {
    debounce.cancel();
    searchController.dispose();
    super.dispose();
  }
}
