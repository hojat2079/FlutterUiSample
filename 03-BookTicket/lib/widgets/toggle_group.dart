import 'package:flutter/material.dart';

class CustomToggleGroup extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomToggleGroup({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Text(
                text1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 1,
            color: const Color(0xffbfc2df),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Text(
                text2,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
