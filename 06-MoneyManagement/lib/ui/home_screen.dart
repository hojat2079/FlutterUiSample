import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test3/constant/text_style_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test3/constant/color_constant.dart';
import 'package:test3/model/card_model.dart';
import 'package:test3/model/transaction_model.dart';
import 'package:test3/model/operation_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //current index indicator
  int currentIndex = 0;

  //handle indicator
  List<T> listIndicator<T>(List list, Function handler) {
    List<T> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              //custom app bar
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("drawer layout is clicked");
                      },
                      child: SvgPicture.asset('assets/icon/drawer_icon.svg'),
                    ),
                    Container(
                      width: 59,
                      height: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/hojat.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //card section
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Good Morning",
                      style: kSubTitleInfoTextStyle,
                    ),
                    Text(
                      "Mahdi Pad",
                      style: kTitleInfoTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                height: 199.0,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 16, right: 6),
                  itemCount: cards.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 344,
                      height: 199,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Color(cards[index].cardBackground),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SvgPicture.asset(
                              cards[index].cardElementTop,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: SvgPicture.asset(
                              cards[index].cardElementBottom,
                            ),
                          ),
                          Positioned(
                            left: 29,
                            top: 48,
                            child: Text(
                              "CARD NUMBER",
                              style: kSubTitleCardTextStyle,
                            ),
                          ),
                          Positioned(
                            left: 29,
                            top: 65,
                            child: Text(
                              cards[index].cardNumber,
                              style: kHeadTitleCardTextStyle,
                            ),
                          ),
                          Positioned(
                            right: 21.0,
                            top: 35.0,
                            child: Image.asset(
                              cards[index].cardType,
                              height: 27.0,
                              width: 27.0,
                            ),
                          ),
                          Positioned(
                            left: 29.0,
                            bottom: 45.0,
                            child: Text(
                              'CARD HOLDERNAME',
                              style: kSubTitleCardTextStyle,
                            ),
                          ),
                          Positioned(
                            child: Text(
                              cards[index].user,
                              style: kHeadTitleCardTextStyle,
                            ),
                            left: 29.0,
                            bottom: 21.0,
                          ),
                          Positioned(
                            child: Text(
                              "EXPIRY DATE",
                              style: kSubTitleCardTextStyle,
                            ),
                            left: 202.0,
                            bottom: 45.0,
                          ),
                          Positioned(
                            left: 202.0,
                            bottom: 21.0,
                            child: Text(
                              cards[index].cardExpired,
                              style: kHeadTitleCardTextStyle,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              //operation section
              Padding(
                padding: const EdgeInsets.only(
                  top: 29,
                  left: 16,
                  right: 10,
                  bottom: 13,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Operation",
                      style: kHead2TextStyle,
                    ),
                    Row(
                      children: listIndicator(datas, (index, item) {
                        return Container(
                          width: 9,
                          height: 9,
                          margin: EdgeInsets.only(right: 6),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index
                                  ? kBlueColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                ),
              ),
              Container(
                height: 123,
                child: ListView.builder(
                    itemCount: datas.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 16.0),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: OperationCard(
                          name: datas[index].name,
                          isSelected: currentIndex == index,
                          selectedIcon: datas[index].selectedIcon,
                          unselectedIcon: datas[index].unselectedIcon,
                        ),
                      );
                    }),
              ),

              //transaction section
              Padding(
                padding: const EdgeInsets.only(
                  top: 29,
                  left: 16,
                  right: 10,
                  bottom: 13,
                ),
                child: Text(
                  "Transaction Histories",
                  style: kHead2TextStyle,
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: transactions.length,
                padding: EdgeInsets.only(left: 16.0, right: 16),
                itemBuilder: (context, index) {
                  return Container(
                    height: 76.0,
                    margin: EdgeInsets.only(bottom: 13.0),
                    padding: EdgeInsets.fromLTRB(24, 12, 22, 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: kTenBlackColor,
                            blurRadius: 10.0,
                            spreadRadius: 5.0,
                            offset: Offset(8.0, 8.0),
                          )
                        ],
                        color: kWhiteColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 57.0,
                              height: 57.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(transactions[index].photo),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 13.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  transactions[index].name,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      color: kBlackColor),
                                ),
                                Text(
                                  transactions[index].date,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
                                      color: kGreyColor),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              transactions[index].amount,
                              style: GoogleFonts.inter(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OperationCard extends StatefulWidget {
  final String name;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;

  OperationCard(
      {required this.name,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      height: 123,
      margin: EdgeInsets.only(right: 16.0, top: 4, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kTenBlackColor,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              // offset: Offset(0, 2.0),
            )
          ],
          color: widget.isSelected == true ? kBlueColor : kWhiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(widget.isSelected == true
              ? widget.selectedIcon
              : widget.unselectedIcon),
          SizedBox(
            height: 9,
          ),
          Text(
            widget.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: widget.isSelected == true ? kWhiteColor : kBlueColor),
          ),
        ],
      ),
    );
  }
}
