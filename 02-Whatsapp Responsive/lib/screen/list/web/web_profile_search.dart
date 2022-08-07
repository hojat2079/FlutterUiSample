import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/color.dart';

class WebProfileSearch extends StatelessWidget {
  const WebProfileSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.25,
      child: TextField(
        decoration: InputDecoration(
            fillColor: searchBarColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none)),
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.search,
                size: 18,
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
            hintText: 'Search or Start new chat',
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
