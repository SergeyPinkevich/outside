import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:outside/base/presentation/page_title.dart';
import 'package:outside/base/presentation/shadow.dart';
import 'package:outside/search/error_search_results.dart';
import 'package:outside/search/empty_search_results.dart';
import 'package:outside/search/search_result_item.dart';
import 'package:weather_repository/weather_repository.dart'
    show City, WeatherRepository;

import 'dart:async';

class SearchPage extends StatefulWidget {
  SearchPage._({Key? key}) : super(key: key);

  static Route<String> route() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SearchPage._(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Duration _debounceDuration = Duration(milliseconds: 500);
  Timer? _debounce;

  final _searchController = TextEditingController();

  Future<List<City>> _searchResults = Future.value(List.empty());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        PageTitle("Search results"),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                height: 56,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      margin: EdgeInsets.only(left: 16),
                      child: SvgPicture.asset("assets/images/search.svg"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          margin: EdgeInsets.only(
                            top: 4,
                            left: 8,
                          ),
                          child: TextField(
                              autofocus: true,
                              controller: _searchController,
                              style: Theme.of(context).textTheme.bodyText1,
                              onChanged: (text) {
                                onSearchBarTextChaned(text);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'City name',
                              ),
                              keyboardType: TextInputType.text),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  boxShadow: [AppBoxShadow()],
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
                            snapshot.data == null ? 0 : snapshot.data?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return SearchResultItem(snapshot.data![index]);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: ErrorSearchResults(),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: EmptySearchResults(),
                      );
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void onSearchBarTextChaned(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(_debounceDuration, () {
      var results = searchCityByQuery(text);
      setState(() {
        _searchResults = results;
      });
    });
  }

  Future<List<City>> searchCityByQuery(String searchQuery) async {
    bool shouldMakeSearch = searchQuery.isNotEmpty && searchQuery.length > 2;
    if (shouldMakeSearch) {
      return new WeatherRepository().searchCityByName(searchQuery);
    } else {
      return Future.value(List.empty());
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }
}
