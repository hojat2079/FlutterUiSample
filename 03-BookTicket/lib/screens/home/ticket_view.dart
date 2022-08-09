import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking/utils/style.dart';
import 'package:ticket_booking/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool isColor;

  const TicketView({Key? key, required this.item, this.isColor = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 167,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          children: [
            /*
            showing the blue part of the card\ticket
            */

            DecoratedBox(
              decoration: BoxDecoration(
                color: !isColor ? Colors.white : Style.darkBlueColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(21),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          item['from']['code'],
                          style: isColor
                              ? Style.headLine3TextStyle.apply(
                                  color: Colors.white,
                                )
                              : Style.headLine3TextStyle,
                        ),
                        const Spacer(),
                        ThickContainer(
                          isColor: isColor,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: SizedBox(
                                  height: 24,
                                  child: LayoutBuilder(
                                    builder: (context, constraint) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                          (constraint.constrainWidth() / 6)
                                              .floor(),
                                          (index) => SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: isColor
                                                    ? Colors.white
                                                    : Colors.grey.shade300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Center(
                                child: Transform.rotate(
                                  angle: 1.5,
                                  child: Icon(
                                    Icons.local_airport_rounded,
                                    color: isColor
                                        ? Colors.white
                                        : const Color(0xff8accf7),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ThickContainer(
                          isColor: isColor,
                        ),
                        const Spacer(),
                        Text(
                          item['to']['code'],
                          style: isColor
                              ? Style.headLine3TextStyle.apply(
                                  color: Colors.white,
                                )
                              : Style.headLine3TextStyle,
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
                            item['from']['name'],
                            style: isColor
                                ? Style.headLine4TextStyle.apply(
                                    color: Colors.white,
                                  )
                                : Style.headLine4TextStyle,
                          ),
                        ),
                        Text(
                          item['flying_time'],
                          style: isColor
                              ? Style.headLine4TextStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              : Style.headLine4TextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            item['to']['name'],
                            textAlign: TextAlign.end,
                            style: isColor
                                ? Style.headLine4TextStyle.apply(
                                    color: Colors.white,
                                  )
                                : Style.headLine4TextStyle,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            /*
            showing top the orange part of the card\ticket
            */
            ColoredBox(
              color: !isColor ? Colors.white : Style.orangeColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Style.bgColor,
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: LayoutBuilder(
                            builder: (context, constraint) {
                              return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                  (constraint.constrainWidth() / 15).floor(),
                                  (index) => SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: isColor
                                            ? Colors.white
                                            : Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 20,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Style.bgColor,
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            /*
            showing top the orange part of the card\ticket
            */
            DecoratedBox(
              decoration: BoxDecoration(
                color: !isColor ? Colors.white : Style.orangeColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(isColor ? 21 : 0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['date'],
                              style: isColor
                                  ? Style.headLine3TextStyle.apply(
                                      color: Colors.white,
                                    )
                                  : Style.headLine3TextStyle,
                            ),
                            const Gap(5),
                            Text(
                              'DATE',
                              style: isColor
                                  ? Style.headLine4TextStyle.apply(
                                      color: Colors.white,
                                    )
                                  : Style.headLine4TextStyle,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              item['departure_time'],
                              style: isColor
                                  ? Style.headLine3TextStyle.apply(
                                      color: Colors.white,
                                    )
                                  : Style.headLine3TextStyle,
                            ),
                            const Gap(5),
                            Text(
                              'Departure time',
                              style: isColor
                                  ? Style.headLine4TextStyle.apply(
                                      color: Colors.white,
                                    )
                                  : Style.headLine4TextStyle,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item['number'].toString(),
                              style: isColor
                                  ? Style.headLine3TextStyle.apply(
                                      color: Colors.white,
                                    )
                                  : Style.headLine3TextStyle,
                            ),
                            const Gap(5),
                            Text(
                              'Number',
                              style: isColor
                                  ? Style.headLine4TextStyle.apply(
                                      color: Colors.white,
                                    )
                                  : Style.headLine4TextStyle,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
