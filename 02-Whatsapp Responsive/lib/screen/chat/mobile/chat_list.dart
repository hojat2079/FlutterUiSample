import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/data.dart';
import 'package:whtasapp_responsive/screen/chat/mobile/my_chat_item.dart';
import 'package:whtasapp_responsive/screen/chat/mobile/sender_chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: messages.length,
        padding: const EdgeInsets.only(top: 12),
        itemBuilder: (context, index) {
          if (messages[index]['isMe'] == true) {
            return MyChatItem(
                text: messages[index]['text'].toString(),
                date: messages[index]['time'].toString());
          }
          return SenderChatItem(
              text: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        });
  }
}
