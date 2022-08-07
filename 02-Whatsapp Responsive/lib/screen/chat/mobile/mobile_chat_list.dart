import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:whtasapp_responsive/color.dart';
import 'package:whtasapp_responsive/data.dart';
import 'package:whtasapp_responsive/screen/chat/mobile/chat_list.dart';

class MobileChatList extends StatelessWidget {
  const MobileChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                contactInfo[7]['profilePic'].toString(),
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Expanded(
              child: Text(
                '+98912345678',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.videocam_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Column(children: [
        const Expanded(child: ChatList()),
        Container(
          padding: const EdgeInsets.only(bottom: 4, right: 4, left: 4),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: searchBarColor,
                    label: const Text(
                      'Message',
                      style: TextStyle(fontSize: 14),
                    ),
                    prefixIconColor: Colors.grey,
                    prefixIcon: const Icon(Icons.emoji_emotions_outlined),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // added line
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                              angle: -pi / 4,
                              child: const Icon(Icons.attach_file_rounded)),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(Icons.camera_alt_rounded),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: tabColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.keyboard_voice_outlined,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
