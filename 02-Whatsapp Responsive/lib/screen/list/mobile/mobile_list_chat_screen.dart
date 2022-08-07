import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/color.dart';
import 'package:whtasapp_responsive/screen/list/mobile/call_list.dart';
import 'package:whtasapp_responsive/screen/list/mobile/contact_list.dart';

class MobileListChatScreen extends StatelessWidget {
  const MobileListChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            centerTitle: false,
            title: const Text(
              'WhatsApp',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.grey,
                ),
              )
            ],
            bottom: const TabBar(
              indicatorColor: tabColor,
              labelColor: tabColor,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 3,
              labelPadding: EdgeInsets.all(12),
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              tabs: [
                Text(
                  'CHATS',
                ),
                Text(
                  'STATUS',
                ),
                Text(
                  'CALLS',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ContactList(),
              ContactList(),
              CallList(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {},
            child: const Icon(
              Icons.comment,
              color: Colors.white,
            ),
          ),
        ));
  }
}
