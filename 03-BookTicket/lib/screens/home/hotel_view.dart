import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/utils/style.dart';

class HotelView extends StatelessWidget {
  final Map<String, dynamic> item;

  const HotelView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      width: MediaQuery.of(context).size.width * 0.6,
      height: 350,
      decoration: BoxDecoration(
          color: Style.primaryColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/images/${item['image']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(10),
          Text(
            item['place'],
            style: Style.headLine2TextStyle.apply(
              color: Style.kakiColor,
            ),
          ),
          const Gap(5),
          Text(
            item['destination'],
            style: Style.headLine2TextStyle.apply(
              color: Colors.white,
            ),
          ),
          const Gap(8),
          Text(
            '\$${item['price']}/night',
            style: Style.headLine1TextStyle.apply(
              color: Style.kakiColor,
            ),
          ),
        ],
      ),
    );
  }
}
