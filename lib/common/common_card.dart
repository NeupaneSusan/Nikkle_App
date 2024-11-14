import 'package:flutter/material.dart';
import 'package:nikkle_app/const/color_const.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final double price;
  final String unit;
  const CommonCard(
      {super.key,
      required this.title,
      required this.price,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      shadowColor: AppColors.shadowColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    offset: const Offset(0, 2.48),
                    blurRadius: 4.95,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Image.asset('assets/image.png'),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Expanded(child: SizedBox()),
            commonContainer(
                bgColor: AppColors.succussColor, title: 'RS. $price'),
            const SizedBox(
              width: 4,
            ),
            commonContainer(bgColor: AppColors.primaryColor, title: unit),
          ],
        ),
      ),
    );
  }

  Widget commonContainer({required String title, required Color bgColor}) {
    return Container(
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.w500),
      )),
    );
  }
}
