import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nikkle_app/common/button.dart';

import 'package:nikkle_app/const/color_const.dart';
import 'package:nikkle_app/page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SvgPicture.asset('assets/bg.svg',
                  height: size.height * 0.62,
                  width: size.width,
                  fit: BoxFit.fill),
              SizedBox(
                  width: size.width * 0.35,
                  height: size.width * 0.35,
                  child: Image.asset('assets/nikkle.png')),
              Positioned(
                top: -10,
                left: size.width * 0.22,
                child: Container(
                  width: 53,
                  height: 49,
                  decoration: BoxDecoration(
                      color: AppColors.lightColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
              ),
              Positioned(
                top: -20,
                right: size.width * 0.35,
                child: Container(
                  width: 53,
                  height: 49,
                  decoration: BoxDecoration(
                      color: AppColors.lightColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
              ),
              Positioned(
                top: size.height * 0.20,
                left: size.width * 0.25,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      color: AppColors.lightColor,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                top: size.height * 0.35,
                right: size.height * 0.07,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            child: Column(
              children: [
                const Text(
                  "NIKKLE",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Simplify everything with Nikkle: accounting, HR, CRM, project management, and credit applications!",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 22.0,
                ),
                SizedBox(
                  height: 45,
                  width: 230,
                  child: CommonButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('LOGIN'),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/login.svg',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
