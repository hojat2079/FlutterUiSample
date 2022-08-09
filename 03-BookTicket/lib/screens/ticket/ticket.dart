import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/data/ticket_data.dart';
import 'package:ticket_booking/screens/home/ticket_view.dart';
import 'package:ticket_booking/utils/style.dart';
import 'package:ticket_booking/widgets/toggle_group.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(left: 20, right: 12, top: 40),
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  'Tickets',
                  style: Style.headLine1TextStyle,
                ),
                const Gap(20),
                const CustomToggleGroup(
                  text1: 'Upcoming',
                  text2: 'Previous',
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      TicketView(
                        item: ticketList[0],
                        isColor: false,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.only(right: 17.5, left: 1.5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(21),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Flutter Dash',
                                  style: Style.headLine3TextStyle,
                                ),
                                const Spacer(),
                                Text(
                                  '2569 669328',
                                  style: Style.headLine3TextStyle,
                                ),
                              ],
                            ),
                            const Gap(3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Passenger',
                                    style: Style.headLine4TextStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Passport',
                                    textAlign: TextAlign.end,
                                    style: Style.headLine4TextStyle,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(32),
                            Row(
                              children: [
                                Text(
                                  '0055 444 77147',
                                  style: Style.headLine3TextStyle,
                                ),
                                const Spacer(),
                                Text(
                                  'B2SG28',
                                  style: Style.headLine3TextStyle,
                                ),
                              ],
                            ),
                            const Gap(3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Number of E-ticket',
                                  style: Style.headLine4TextStyle,
                                ),
                                Text(
                                  'Booking code',
                                  textAlign: TextAlign.end,
                                  style: Style.headLine4TextStyle,
                                ),
                              ],
                            ),
                            const Gap(32),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/visa.png',
                                      scale: 11,
                                    ),
                                    const Gap(5),
                                    Text(
                                      '*** 2462',
                                      style: Style.headLine3TextStyle,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  '\$249.99',
                                  style: Style.headLine3TextStyle,
                                ),
                              ],
                            ),
                            const Gap(3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'payment method',
                                  style: Style.headLine4TextStyle,
                                ),
                                Text(
                                  'Price',
                                  textAlign: TextAlign.end,
                                  style: Style.headLine4TextStyle,
                                ),
                              ],
                            ),
                            const Gap(40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: BarcodeWidget(
                                data: 'https://github.com/hojat2079',
                                barcode: Barcode.code128(),
                                drawText: false,
                                color: Style.textColor,
                                height: 70,
                                width: double.infinity,
                              ),
                            ),
                            const Gap(8),
                          ],
                        ),
                      ),
                      const Gap(20),
                      TicketView(
                        item: ticketList[0],
                        isColor: true,
                      ),
                      const Gap(40),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 305,
              left: 21,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Style.textColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Style.textColor,
                ),
              ),
            ),
            Positioned(
              top: 305,
              right: 21,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Style.textColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Style.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
