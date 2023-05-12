import 'package:cocktail_seeker/GUI/DrinkList.dart';
import 'package:flutter/material.dart';

import '../models/cocktail.dart';
import '../models/filters/filter.dart';
import '../repositories/cocktail_repository.dart';
import '../repositories/filter_repository.dart';

class Search extends StatefulWidget {
  const Search({super.key});
  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {

  var filterRepository = FilterRepository();
  List<Filter> _listforList = [];
  var cocktailRepository = CocktailRepository();
  List<Cocktail> _cocktailList = [];

  final _filterList = ["None", "Category", "Alcohol", "Glass", "Ingredient"];
  String? _selectedValFilter = "";
  Filter? _selectedValList;
  List<DropdownMenuItem<Filter>> lista = [];

  Future<List<Filter>> getList(String? value) async {
    if(value == "Category"){
      _listforList = await filterRepository.getCategoryFilters();
      _selectedValList = _listforList[0];
      lista = getItems();
    } else if(value == "Alcohol"){
      _listforList = await filterRepository.getAlcoholicFilters();
      _selectedValList = _listforList[0];
      lista = getItems();
    }else if(value == "Glass"){
      _listforList = await filterRepository.getGlassFilters();
      _selectedValList = _listforList[0];
      lista = getItems();
    } else if(value == "Ingredient"){
      _listforList = await filterRepository.getIngredientFilters();
      _selectedValList = _listforList[0];
      lista = getItems();
    } else {
      lista.clear();
    }

    return List.empty();
  }

  List <DropdownMenuItem<Filter>> getItems(){
    lista.clear();

    if(_listforList == null || _listforList.isEmpty){
      return List.empty();
    }
    _listforList.forEach((element){
      lista.add(DropdownMenuItem(value: element, child: Text(element.toString()))
      );
    });
    return lista;
  }



  Future<List<Cocktail>> getCocktailList() async {
    _cocktailList = await cocktailRepository.getCocktailsByFilter(_selectedValList!);
    return List.empty();
  }

  SearchState(){
    _selectedValFilter = _filterList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff3a57e8),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                      border: Border.all(
                          color: const Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Text(
                                  "COCTAIL",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  "SEEKER",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                    color: Color(0xfffba808),
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.wine_bar,
                              color: Color(0xffffffff),
                              size: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Filter: ",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 130,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xc0888888),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: DropdownButton(
                          value: _selectedValFilter,
                          items: _filterList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          onChanged: (value) async {
                            await getList(value);
                            setState(() {
                              _selectedValFilter = value as String;
                            });
                          },
                          icon: const Icon(Icons.expand_more),
                          iconSize: 24,
                          iconEnabledColor: const Color(0xff212435),
                          elevation: 8,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                      child: Text(
                        "List: ",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 130,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xbe888888),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: DropdownButton(
                          value: _selectedValList,
                          items: lista,
                          style: const TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _selectedValList = value;
                            });
                          },
                          icon: const Icon(Icons.expand_more),
                          iconSize: 24,
                          iconEnabledColor: const Color(0xff212435),
                          elevation: 8,
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        await getCocktailList();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DrinkList(cocktailList: _cocktailList)));
                      },
                      color: const Color(0xff3a57e8),
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Color(0xff808080), width: 1),
                      ),
                      padding: const EdgeInsets.all(16),
                      textColor: const Color(0xffffffff),
                      height: 40,
                      minWidth: 140,
                      child: const Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {},
                        color: const Color(0xff212435),
                        iconSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}