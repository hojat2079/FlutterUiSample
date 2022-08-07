import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/color.dart';
import 'package:whtasapp_responsive/data.dart';

class WebProfileAppbar extends StatelessWidget {
  const WebProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: webAppBarColor),
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      padding: const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              contactInfo[0]['profilePic'].toString(),
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
          Row(children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.message,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ))
          ]),
        ],
      ),
    );
  }
}
