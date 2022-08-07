import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/color.dart';
import 'package:whtasapp_responsive/data.dart';

class CallList extends StatelessWidget {
  const CallList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: callInfo.length,
        padding: const EdgeInsets.only(top: 10, bottom: 80),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ListTile(
                title: Text(
                  callInfo[index]['name'].toString(),
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      Icon(
                        Random().nextBool()
                            ? Icons.call_received_rounded
                            : Icons.call_made_rounded,
                        color: Random().nextBool() ? Colors.green : Colors.red,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        (callInfo[index]['count'].toString() != '1'
                                ? ('(' +
                                    callInfo[index]['count'].toString() +
                                    ')  ')
                                : '') +
                            callInfo[index]['time'].toString(),
                        maxLines: 1,
                        style: const TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    callInfo[index]['profilePic'].toString(),
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: Icon(
                  callInfo[index]['videoCall'].toString() == 'true'
                      ? Icons.videocam_rounded
                      : Icons.call,
                  color: tabColor,
                  size: 26,
                )),
          );
        });
    ;
  }
}
