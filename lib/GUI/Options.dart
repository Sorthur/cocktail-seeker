import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  const Options({super.key});
  @override
  State<Options> createState() => OptionsState();
}
class OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
          color: Color(0x1fffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
        ),
        child: const Icon(
          Icons.settings,
          color: Color(0xff212435),
          size: 150,
        ),
      ),
    );
  }
}
