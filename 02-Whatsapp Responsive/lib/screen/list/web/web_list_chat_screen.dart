import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/color.dart';
import 'package:whtasapp_responsive/screen/chat/mobile/chat_list.dart';
import 'package:whtasapp_responsive/screen/chat/web/web_chat_list_appbar.dart';
import 'package:whtasapp_responsive/screen/list/mobile/contact_list.dart';
import 'package:whtasapp_responsive/screen/list/web/web_profile_appbar.dart';
import 'package:whtasapp_responsive/screen/list/web/web_profile_search.dart';

class WebListChatScreen extends StatelessWidget {
  const WebListChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 900),
      child: Scaffold(
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    WebProfileAppbar(),
                    WebProfileSearch(),
                    ContactList(
                      isDivider: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/backgroundImage.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  const WebChatListAppbar(),
                  const Expanded(child: ChatList()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: chatBarMessage,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.grey,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.attach_file_rounded,
                              color: Colors.grey,
                            )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: searchBarColor,
                                label: const Text(
                                  'Type a Message',
                                  style: TextStyle(fontSize: 14),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        width: 0, style: BorderStyle.none)),
                                contentPadding:
                                    const EdgeInsets.only(left: 20)),
                          ),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_voice_outlined,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
