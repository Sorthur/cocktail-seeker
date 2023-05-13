import 'package:cocktail_seeker/GUI/IngredientDetails.dart';
import 'package:flutter/material.dart';

import '../models/detailed_cocktail.dart';
import '../models/detailed_ingredient.dart';
import '../repositories/ingredient_repository.dart';

class DrinkDetails extends StatefulWidget {
  final DetailedCocktail detailedCocktail;
  const DrinkDetails({super.key, required this.detailedCocktail});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {

  late DetailedCocktail _detailedCocktail;
  @override
  void initState() {
    super.initState();
    _detailedCocktail = widget.detailedCocktail;
  }

  DetailedIngredient? _detailedIngredient;
  var ingredientRepository = IngredientRepository();

  Future<DetailedIngredient?> getIngredient(String name) async {
    _detailedIngredient = await ingredientRepository.getIngredientByName(name);
    return _detailedIngredient;
  }

  @override
  Widget build(BuildContext context) {

    String name = _detailedCocktail.name;
    String? image = _detailedCocktail.thumbUrl;
    String? category = _detailedCocktail.category;
    String? glass = _detailedCocktail.glass;
    bool alcohol;

    if(_detailedCocktail.alcoholic == "Alcoholic"){
      alcohol = true;
    }else{
      alcohol = false;
    }

    String? description = _detailedCocktail.instructions;
    List<Ingredients> ingredient = [];

    for (var i=0; i< _detailedCocktail.ingredients.length; i++) {
      ingredient.add(Ingredients(name: _detailedCocktail.ingredients[i], amount: _detailedCocktail.measures[i]));
    }

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea ( child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            elevation: 4,
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff3a57e8),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            title: const Text(
              "Details",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Color(0xffffffff),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: const Color(0xffffffff),
              iconSize: 24,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            name,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child:
                  Image(
                    image: NetworkImage(image!),
                    height:
                    MediaQuery.of(context).size.height * 0.35000000000000003,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Category: ",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          category!,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      const Text(
                        "Alcohol",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                      ),
                      Checkbox(
                        onChanged: (value) {},
                        activeColor: const Color(0xff3a57e8),
                        autofocus: false,
                        checkColor: const Color(0xffffffff),
                        hoverColor: const Color(0x42000000),
                        splashRadius: 20,
                        value: alcohol,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Glass: ",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          glass!,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        "Ingredients list:",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: ingredient.map((item) {
                      return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        padding: const EdgeInsets.all(0),
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xbefba808),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Icon(
                                    Icons.wine_bar_outlined,
                                    color: Color(0xff212435),
                                    size: 30,
                                  ),
                                  Text(
                                    item.amount,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xff212435),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: MaterialButton(
                                onPressed: () async {
                                  await getIngredient(item.name);
                                  if(_detailedIngredient != null) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            IngredientDetails(
                                                detailedIngredient: _detailedIngredient!)));
                                  }
                                  },
                                color: const Color(0xff3a57e8),
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0)),
                                ),
                                padding:
                                const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                                textColor: const Color(0xffffffff),
                                minWidth: 150,
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    description!,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        )
    );
  }
}

class Ingredients {
  final String name;
  final String amount;

  Ingredients({required this.name, required this.amount});
}