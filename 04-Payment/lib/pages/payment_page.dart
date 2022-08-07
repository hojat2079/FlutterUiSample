import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/component/colors.dart';
import 'package:payment_app/widget/app_button.dart';
import 'package:payment_app/widget/elevetad_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        width: w,
        height: h,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/paymentbackground.png'),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(right: 20, left: 20),
              height: h * 0.14,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'images/success.png',
                      ),
                      fit: BoxFit.cover)),
            ),
            Text(
              'Success !',
              style: TextStyle(
                  color: ColorPalette.mainColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Payment is completed for 2 bills',
              style: TextStyle(
                  color: ColorPalette.idColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: h * 0.045,
            ),
            Container(
              height: 160,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 36, right: 36),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.withOpacity(0.5),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(left: 16),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KeyGen Power',
                              style: TextStyle(
                                color: ColorPalette.mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'ID:47893239',
                              style: TextStyle(
                                  color: ColorPalette.idColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('         ',
                                style: TextStyle(
                                  color: ColorPalette.mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '\$1248.00',
                              style: TextStyle(
                                  color: ColorPalette.mainColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(left: 16),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'KeyGen Power',
                              style: TextStyle(
                                color: ColorPalette.mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'ID:47893239',
                              style: TextStyle(
                                  color: ColorPalette.idColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('         ',
                                style: TextStyle(
                                  color: ColorPalette.mainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '\$1248.00',
                              style: TextStyle(
                                  color: ColorPalette.mainColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Column(
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                      color: ColorPalette.idColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$2840.00',
                  style: TextStyle(
                      color: ColorPalette.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                SizedBox(
                  height: h * 0.13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      text: 'share',
                      backgroundColor: ColorPalette.mainColor,
                      iconData: Icons.share,
                      textColor: ColorPalette.mainColor,
                      iconColor: Colors.white,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    AppButton(
                      text: 'print',
                      backgroundColor: ColorPalette.mainColor,
                      iconData: Icons.print_outlined,
                      textColor: ColorPalette.mainColor,
                      iconColor: Colors.white,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  removeRight: true,
                  child: CustomElevatedButton(
                      text: 'Done',
                      backgroundColor: Colors.white,
                      isBorder: true,
                      textColor: ColorPalette.mainColor,
                      onTap: () {
                        Get.back();
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
