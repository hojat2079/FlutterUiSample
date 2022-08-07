import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/data.dart';
import 'package:whtasapp_responsive/screen/chat/mobile/mobile_chat_list.dart';

class ContactList extends StatelessWidget {
  final bool isDivider;

  const ContactList({Key? key, this.isDivider = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: contactInfo.length,
        shrinkWrap: !isDivider ? false : true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(bottom: 80),
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MobileChatList()));
                },
                child: ListTile(
                  title: Text(
                    contactInfo[index]['name'].toString(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      contactInfo[index]['message'].toString(),
                      maxLines: 1,
                      style: const TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      contactInfo[index]['profilePic'].toString(),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        contactInfo[index]['time'].toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isDivider)
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).hintColor,
                              width: 0.25))),
                )
            ],
          );
        });
  }
}
