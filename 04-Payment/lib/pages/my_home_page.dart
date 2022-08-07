import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/controller/data_controller.dart';
import 'package:payment_app/widget/app_button.dart';
import 'package:payment_app/widget/elevetad_button.dart';
import 'package:payment_app/widget/text_size.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController _dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPalette.backGroundColor,
      body: SizedBox(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            Obx(() {
              if (!_dataController.loading) {
                return _listBills();
              } else {
                return const Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
              }
            }),
            _elevatedButton(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          _mainBackground(),
          _curveBackground(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

  _mainBackground() {
    return Positioned(
        bottom: 10,
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover),
          ),
        ));
  }

  _curveBackground() {
    return Positioned(
        bottom: 10,
        left: 0,
        right: -2,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/curve.png'),
            fit: BoxFit.cover,
          )),
        ));
  }

  _buttonContainer() {
    return Positioned(
      bottom: 8,
      right: 50,
      child: InkWell(
        onTap: () {
          showModalBottomSheet<dynamic>(
              backgroundColor: Colors.transparent,
              barrierColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 240,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 300,
                          color: const Color(0xffeef1f4).withOpacity(0.7),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 50,
                        child: Container(
                          width: 60,
                          height: 250,
                          padding: const EdgeInsets.only(top: 5, bottom: 25),
                          decoration: BoxDecoration(
                            color: ColorPalette.mainColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppButton(
                                  backgroundColor: Colors.white,
                                  iconColor: ColorPalette.mainColor,
                                  textColor: Colors.white,
                                  iconData: Icons.cancel,
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                              AppButton(
                                  text: 'Add bill',
                                  backgroundColor: Colors.white,
                                  iconColor: ColorPalette.mainColor,
                                  textColor: Colors.white,
                                  iconData: Icons.add_circle,
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                              AppButton(
                                  text: 'History',
                                  backgroundColor: Colors.white,
                                  iconColor: ColorPalette.mainColor,
                                  textColor: Colors.white,
                                  iconData: Icons.history_rounded,
                                  onTap: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              image:
                  const DecorationImage(image: AssetImage('images/lines.png')),
              boxShadow: [
                BoxShadow(
                  blurRadius: 9,
                  offset: const Offset(0, 1),
                  color: const Color(0xff11324d).withOpacity(0.2),
                )
              ]),
        ),
      ),
    );
  }

  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 80,
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 50),
              itemCount: _dataController.list.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, right: 18),
                  height: 130,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffd8dbe0),
                        blurRadius: 20,
                        spreadRadius: 10,
                        offset: Offset(1, 1),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            _dataController.list[index]['img']),
                                        fit: BoxFit.cover),
                                    border: Border.all(
                                        color: Colors.grey, width: 3.0),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _dataController.list[index]['brand'],
                                    style: TextStyle(
                                        color: ColorPalette.mainColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.fade),
                                    maxLines: 1,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'ID: 194659479',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: ColorPalette.idColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.fade),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: TextSize(
                                text: 'Auto pay on 24th May 18',
                                color: ColorPalette.green),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  _dataController.list[index]['status'] =
                                      !_dataController.list[index]['status'];
                                  _dataController.list.refresh();
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: _dataController.list[index]
                                              ['status']
                                          ? Colors.green
                                          : ColorPalette.selectBackground
                                              .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      'Select',
                                      style: TextStyle(
                                          color: _dataController.list[index]
                                                  ['status']
                                              ? Colors.white
                                              : ColorPalette.selectColor,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '\$' + _dataController.list[index]['due'],
                                    style: TextStyle(
                                      color: ColorPalette.mainColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    _dataController.list[index]['more'],
                                    style: TextStyle(
                                      color: ColorPalette.idColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 5,
                            height: 35,
                            decoration: BoxDecoration(
                                color: ColorPalette.halfOval,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }

  _elevatedButton() {
    return Positioned(
        bottom: 20,
        child: CustomElevatedButton(
          backgroundColor: ColorPalette.mainColor,
          textColor: Colors.white,
          text: 'Pay all bills',
          onTap: () {
            Get.toNamed('/payment');
          },
        ));
  }

  _textContainer() {
    return Stack(
      children: const [
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            'My Bills',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            'My Bills',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.w700,
              color: Color(0xff293952),
            ),
          ),
        ),
      ],
    );
  }
}
