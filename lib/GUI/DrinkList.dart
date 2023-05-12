import 'package:cocktail_seeker/GUI/DrinkDetails.dart';
import 'package:flutter/material.dart';

class DrinkList extends StatefulWidget {
  const DrinkList({super.key});

  @override
  State<DrinkList> createState() => _DrinkListState();
}

class _DrinkListState extends State<DrinkList> {
  List<Drinks> drink = [
    Drinks(name: 'Element 1', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 2', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 3', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 4', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 5', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 6', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 7', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 8', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 9', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 10', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
    Drinks(name: 'Element 11', link: 'https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
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
              "Drinks",
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
          body: GridView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
              children: drink.map((item) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child:
                      Image(
                        image: NetworkImage(
                            item.link),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 200,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: const Color(0x000b0a0a),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(color: const Color(0xfffba808), width: 1),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0x800b0a0a),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                          border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 10,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0x00ffffff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DrinkDetails()));
                        },
                        color: const Color(0xff3a57e8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Color(0xfffba808), width: 2),
                        ),
                        padding: const EdgeInsets.all(0),
                        textColor: const Color(0xffffffff),
                        height: 30,
                        minWidth: 140,
                        child: const Text(
                          "Show",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
          ),
        )
    );
  }
}

class Drinks {
  final String name;
  final String link;

  Drinks({required this.name, required this.link});
}


