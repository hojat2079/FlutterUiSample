import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/root.dart';

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
      title: 'Ticket Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootScreen(),
    );
  }
}
