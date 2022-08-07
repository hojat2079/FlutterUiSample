import 'package:flutter/material.dart';
import 'package:whtasapp_responsive/color.dart';
import 'package:whtasapp_responsive/screen/list/ResponsiveListChatScreen.dart';
import 'package:whtasapp_responsive/screen/list/mobile/mobile_list_chat_screen.dart';
import 'package:whtasapp_responsive/screen/list/web/web_list_chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp Responsive Ui Design',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          iconTheme: const IconThemeData(color: Colors.grey)),
      home: const ResponsiveListChatScreen(
        mobileListChatScreen: MobileListChatScreen(),
        webListChatScreen: WebListChatScreen(),
      ),
    );
  }
}
