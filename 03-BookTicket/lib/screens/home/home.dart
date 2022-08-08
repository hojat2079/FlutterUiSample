import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/data/hotel_data.dart';
import 'package:ticket_booking/data/ticket_data.dart';
import 'package:ticket_booking/screens/home/hotel_view.dart';
import 'package:ticket_booking/screens/home/ticket_view.dart';
import 'package:ticket_booking/utils/style.dart';

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
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: Column(
                children: [
                  const Gap(40),
                  Row(
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
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: 50,
                            height: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(25),
                  Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Flights',
                        style: Style.headLine2TextStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          'View All',
                          style: Style.defaultTextStyle
                              .apply(color: Colors.blueGrey),
                        ),
                      )
                    ],
                  )
                ],
              ),
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hotels',
                    style: Style.headLine2TextStyle,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: Text(
                      'View All',
                      style:
                          Style.defaultTextStyle.apply(color: Colors.blueGrey),
                    ),
                  )
                ],
              ),
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
