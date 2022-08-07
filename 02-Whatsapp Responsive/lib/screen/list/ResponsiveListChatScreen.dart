import 'package:flutter/material.dart';

class ResponsiveListChatScreen extends StatelessWidget {
  final Widget mobileListChatScreen;
  final Widget webListChatScreen;

  const ResponsiveListChatScreen(
      {Key? key,
      required this.mobileListChatScreen,
      required this.webListChatScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 900) {
        return webListChatScreen;
      } else {
        return mobileListChatScreen;
      }
    });
  }
}
