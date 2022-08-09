import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/utils/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 12, top: 40),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 86,
                    height: 86,
                  ),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book Tickets',
                      style: Style.headLine1TextStyle,
                    ),
                    const Gap(2),
                    Text(
                      'Tehran',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const Gap(8),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Color(0xfffef4f3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Color(0xff526799),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              FluentSystemIcons.ic_fluent_shield_filled,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          const Gap(5),
                          const Text(
                            'Premium status',
                            style: TextStyle(
                              color: Color(0xff526799),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4),
                  highlightColor: Style.primaryColor.withOpacity(0.3),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      'Edit',
                      textAlign: TextAlign.end,
                      style: Style.defaultTextStyle.copyWith(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(8),
            Divider(
              color: Colors.grey.shade300,
            ),
            const Gap(8),
            Stack(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Style.primaryColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color(0xff264CD2),
                        width: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 25,
                        child: Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          color: Style.primaryColor,
                          size: 27,
                        ),
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You\'r got a new award',
                            style: Style.headLine2TextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'You have 95 flights in a year',
                            style: Style.headLine2TextStyle.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const Gap(25),
            Text(
              'Accumulated miles',
              style: Style.headLine2TextStyle,
            ),
            const Gap(28),
            const Center(
              child: Text(
                '192802',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Miles accrued',
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        '23 May 2021',
                        textAlign: TextAlign.end,
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(28),
                  Row(
                    children: [
                      Text(
                        '23 042',
                        style: Style.headLine3TextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'Airline Co',
                        style: Style.headLine3TextStyle,
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Miles',
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        'Received from',
                        textAlign: TextAlign.end,
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(28),
                  Row(
                    children: [
                      Text(
                        '24',
                        style: Style.headLine3TextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'McDonal\'s',
                        style: Style.headLine3TextStyle,
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Miles',
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        'Received from',
                        textAlign: TextAlign.end,
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(28),
                  Row(
                    children: [
                      Text(
                        '52 340',
                        style: Style.headLine3TextStyle,
                      ),
                      const Spacer(),
                      Text(
                        'Exuma',
                        style: Style.headLine3TextStyle,
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Miles',
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Text(
                        'Received from',
                        textAlign: TextAlign.end,
                        style: Style.headLine3TextStyle.apply(
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(18),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'How to get more miles',
                      style: Style.defaultTextStyle.apply(
                        color: Colors.blueGrey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
