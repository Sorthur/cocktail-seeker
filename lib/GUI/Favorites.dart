import 'package:flutter/material.dart';
import 'package:cocktail_seeker/GUI/DrinkList.dart';

import '../models/cocktail.dart';
import '../models/favourite_query.dart';
import '../models/filters/filter.dart';
import '../repositories/cocktail_repository.dart';
import '../repositories/db_repository.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {

  var dbRepository = DbRepository();
  List<FavouriteQuery> items = [];

  Future<List<FavouriteQuery>> getFavoritesList() async {
    var test = await dbRepository.getFavouriteQueries();
    setState(() {
      items = test;
    });
    return items;
  }

  @override
  void initState() {
    super.initState();
    getFavoritesList();
  }

  var cocktailRepository = CocktailRepository();
  List<Cocktail> _cocktailList = [];

  Future<List<Cocktail>> getCocktailList(Filter filter) async {
    _cocktailList = await cocktailRepository.getCocktailsByFilter(filter);
    return _cocktailList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: items.map((item) {
          return Card(
            margin: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 0),
            color: const Color(0xfffba808),
            shadowColor: const Color(0xff000000),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Filter:",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                        ),
                        Text(
                          item.filterType!,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Parameter:",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          item.filterName!,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff7a7a7a),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                      child: MaterialButton(
                        onPressed: () async {
                          await getCocktailList(item.filter!);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DrinkList(cocktailList: _cocktailList)));
                        },
                        color: const Color(0xff3a57e8),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide(color: Color(0xff808080),
                              width: 1),
                        ),
                        padding: const EdgeInsets.all(16),
                        textColor: const Color(0xffffffff),
                        height: 40,
                        minWidth: 100,
                        child: const Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      dbRepository.removeById(item.id);
                      items.remove(item);
                    });
                  },
                  color: const Color(0xffffffff),
                  iconSize: 24,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

