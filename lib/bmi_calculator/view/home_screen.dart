import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed('/hom'));
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff000E21),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/img.png"))),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text("BMI CALCULATOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w400)),
          Spacer(),
          CircularProgressIndicator(
            color: Colors.pink,
          ),
          SizedBox(height: 2.h),
          Text(
            "Check Your BMI",
            style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white70,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10.h),
          //Text("Hii"),
        ],
      ),
    ));
  }
}
