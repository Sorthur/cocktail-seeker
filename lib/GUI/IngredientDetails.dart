import 'package:flutter/material.dart';

import '../models/detailed_ingredient.dart';

class IngredientDetails extends StatefulWidget {
  final DetailedIngredient detailedIngredient;
  const IngredientDetails({super.key, required this.detailedIngredient});

  @override
  State<IngredientDetails> createState() => _IngredientDetailsState();
}

class _IngredientDetailsState extends State<IngredientDetails> {

  late DetailedIngredient _detailedIngredient;
  @override
  void initState() {
    super.initState();
    _detailedIngredient = widget.detailedIngredient;
  }

  @override
  Widget build(BuildContext context) {

    String name = _detailedIngredient.name;
    String type = _detailedIngredient.type;
    bool alcohol;

    if(_detailedIngredient.alcohol == "Yes"){
      alcohol = true;
    }else{
      alcohol = false;
    }

    String description = _detailedIngredient.description;

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea ( child:  Scaffold(
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
                    ],
                  ),
                ),
                const Icon(
                  Icons.wine_bar,
                  color: Color(0xfffba808),
                  size: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Type: ",
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
                          type,
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
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    description,
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
