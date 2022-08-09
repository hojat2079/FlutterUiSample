import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/data/hotel_data.dart';
import 'package:ticket_booking/data/ticket_data.dart';
import 'package:ticket_booking/screens/home/hotel_view.dart';
import 'package:ticket_booking/screens/home/ticket_view.dart';
import 'package:ticket_booking/utils/style.dart';
import 'package:ticket_booking/widgets/two_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Style.bgColor,
      systemNavigationBarColor: Colors.white,
    ));

    return Scaffold(
      backgroundColor: Style.bgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 40),
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: Style.headLine3TextStyle,
                          ),
                          const Gap(5),
                          Text(
                            'Book Tickets',
                            style: Style.headLine1TextStyle,
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 50,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(25),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xfff4f6fd),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Colors.grey.shade500,
                      ),
                      const Gap(4),
                      Text(
                        'Search',
                        style: Style.headLine4TextStyle,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 12),
                  child:
                      TwoTextView(text1: 'Upcoming Flights', text2: 'View All'),
                ),
              ],
            ),
            const Gap(15),
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  return TicketView(
                    item: ticketList[index],
                  );
                },
                itemCount: ticketList.length,
              ),
            ),
            const Gap(15),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 12),
              child: TwoTextView(text1: 'Hotels', text2: 'View All'),
            ),
            const Gap(15),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return HotelView(
                    item: hotelList[index],
                  );
                },
                itemCount: hotelList.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
