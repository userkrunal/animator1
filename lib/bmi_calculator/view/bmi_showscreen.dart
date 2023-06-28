import 'package:animator1/bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BmiShowScreen extends StatefulWidget {
  const BmiShowScreen({Key? key}) : super(key: key);

  @override
  State<BmiShowScreen> createState() => _BmiShowScreenState();
}

class _BmiShowScreenState extends State<BmiShowScreen> {

  BmiController bmiController=Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:  Color(0xff000E21),
      body:  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
            child: Column(
              children: [
                SizedBox(height: 5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Your Result",style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                    ],
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 5.h),
                   Text("${bmiController.bData.value}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30.sp,color: Colors.green,fontStyle: FontStyle.italic),),
                    SizedBox(height: 5.h),
                    Text("${bmiController.bValue.value.toStringAsFixed(0)}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 75.sp,color: Colors.white),),
                    // Text("${bmiController.bData.value}",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25.sp,color: Colors.white),),

                  ],
                )
              ],
            ),
          ),


          GestureDetector(

            onTap: () {
              bmiController.male.value = false;
              bmiController.female.value = false;
              bmiController.weight.value = 0;
              bmiController.h.value = 0;
              bmiController.age.value = 0;
              Get.toNamed('/hom');
            },
            child: Container(
                height: 8.h,
                width: 100.w,
                color: Color(0xFFEB1555),
                alignment: Alignment.center,
                child: Text("Recheck BMI",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white),)
            ),
          )
        ],
      ),
    ));
  }
}
