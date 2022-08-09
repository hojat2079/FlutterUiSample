import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/screens/serach/icon_text.dart';
import 'package:ticket_booking/utils/style.dart';
import 'package:ticket_booking/widgets/toggle_group.dart';
import 'package:ticket_booking/widgets/two_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 12, top: 40),
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              'What are\nyou looking for?',
              style: Style.headLine1TextStyle.copyWith(fontSize: 32),
            ),
            const Gap(20),
            const CustomToggleGroup(
              text1: 'Airline Tickets',
              text2: 'Hotels',
            ),
            const Gap(25),
            const IconTextView(
                text: 'Departure', icon: Icons.flight_takeoff_rounded),
            const Gap(15),
            const IconTextView(
              text: 'Arrival',
              icon: Icons.flight_land_rounded,
            ),
            const Gap(25),
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xd91130ce),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                child: Center(
                  child: Text(
                    'Find Tickets',
                    style: Style.defaultTextStyle.apply(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(40),
            const TwoTextView(text1: 'Upcoming Flights', text2: 'View All'),
            const Gap(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 400,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 1,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/sit.jpg',
                          height: 190,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap(12),
                      Text(
                        '20% discount on the early booking of this flight Don\'t miss booking.',
                        style: Style.headLine2TextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 185,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xff3ab8b8),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount\nfor survey',
                                  style: Style.headLine2TextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  'Take about about about he survey about our service and get discount',
                                  style: Style.headLine2TextStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            right: -45,
                            top: -40,
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff189999),
                                  width: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(15),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.44,
                        height: 200,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xffEc6545),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Take Love',
                              style: Style.headLine2TextStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(15),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '😍',
                                    style: TextStyle(fontSize: 32),
                                  ),
                                  TextSpan(
                                    text: '😍',
                                    style: TextStyle(fontSize: 45),
                                  ),
                                  TextSpan(
                                    text: '😘',
                                    style: TextStyle(fontSize: 32),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
