import 'package:animator1/bmi_calculator/view/bmi_screen.dart';
import 'package:animator1/bmi_calculator/view/bmi_showscreen.dart';
import 'package:animator1/bmi_calculator/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
   Sizer(builder: (context, orientation, deviceType) {
     return  GetMaterialApp(
       debugShowCheckedModeBanner: false,
       routes: {
         '/':(p0) => SplashScreen(),
         '/hom':(p0) => BmiScreen(),
         '/bmishow':(p0) => BmiShowScreen()
       },
     );
   },)
  );
}