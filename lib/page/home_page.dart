import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikkle_app/common/common_card.dart';
import 'package:nikkle_app/const/color_const.dart';
import 'package:nikkle_app/model/cart_model.dart';

import 'package:nikkle_app/page/cart_page.dart';
import 'package:nikkle_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final snackBar = SnackBar(
    content: const Text('Item add'),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners
    ),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
          ),
          Container(
            height: size.height * .3,
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'All Category',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.whiteColor),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 3.0, left: 8.0),
                              child: SvgPicture.asset(
                                'assets/down_arrow.svg',
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Pos',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            height: 28,
                            width: 90,
                            margin: const EdgeInsets.only(left: 3),
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(24.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/logout.svg',
                                  width: 18,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 55,
                    margin: const EdgeInsets.only(top: 25),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.secondaryColor),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/search.svg',
                          width: 25,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search Product',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textSecondaryColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.21,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 40),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final number = Random();
                  final price = 10.0 * number.nextInt(10) + 2;
                  final productName = 'Product ${index + 1}';

                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      final data =
                          CartModel(index + 1, 1, price, price, productName);
                      context.read<CartProvider>().add(data);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CommonCard(
                        title: productName,
                        price: price,
                        unit: "${(number.nextInt(10) + 1)} kg",
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1F000000),
                    offset: Offset(0, 2),
                    blurRadius: 48,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(child: SvgPicture.asset('assets/home.svg')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CartPage()));
                      },
                      child: SvgPicture.asset('assets/cart.svg')),
                  GestureDetector(
                      child: SvgPicture.asset('assets/setting.svg')),
                  GestureDetector(child: SvgPicture.asset('assets/profile.svg'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
