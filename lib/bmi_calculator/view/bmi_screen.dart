import 'package:animator1/bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> with SingleTickerProviderStateMixin{

  BmiController bmiController=Get.put(BmiController());

  AnimationController? animationController;
  Animation? leftAnimation;
  Animation? rightAnimation;
  Animation? alignAnimation;


  @override
  void initState() {
    super.initState();

    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 900));

    leftAnimation=Tween<Alignment>(begin: Alignment(-300,0),end: Alignment(0, 0)).animate(animationController!);
    rightAnimation=Tween<Alignment>(begin: Alignment(300,0),end: Alignment(0, 0)).animate(animationController!);

    alignAnimation=Tween<Alignment>(begin: Alignment(20,0), end: Alignment(0,0)).animate(animationController!);

    animationController!.forward();
    animationController!.addListener(() {
      setState(() {

      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xff000E21),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("BMI CALCULATOR",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Colors.white)),
                GestureDetector(
                  onTap: () {
                    bmiController.male.value=false;
                    bmiController.female.value=false;
                    bmiController.weight.value=0;
                    bmiController.h.value=0;
                    bmiController.age.value=0;
                  },
                    child: Icon(Icons.refresh,size: 25,color: Colors.white70,))
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              SizedBox(width: 3.w),
              Expanded(
                child: Align(
                  alignment: leftAnimation!.value,
                  child: GestureDetector(
                    onTap: () {
                      bmiController.changGender("Male");
                    },
                    child: Obx(
                      () =>Container(height: 45.w,width: 45.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: bmiController.male.value == false?Color(0xff111F38):Colors.pinkAccent),
                        child:Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.male_rounded,size: 60.sp,
                                color: Colors.white70,
                              ),
                              Text("Male",style: TextStyle(fontSize: 18.sp,color: Colors.white70,fontWeight: FontWeight.w400),)
                            ],
                          ),
                        ),
                    ),
                    ),
                  ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Align(
                  alignment: rightAnimation!.value,
                  child: GestureDetector(
                    onTap: () {
                      bmiController.changGender("Female");
                    },
                    child: Obx(
                      () => Container(height: 45.w,width: 45.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:bmiController.female.value == true? Colors.pinkAccent:Color(0xff111F38)),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.female_rounded,size: 60.sp,color: Colors.white70,),
                              Text("Female",style: TextStyle(fontSize: 18.sp,color: Colors.white70,fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                    ),
                    ),
                  ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Align(
            alignment: alignAnimation!.value,
            child: Container(
              height: 28.h,
              width: 95.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: Color(0xff111F38)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    "Height",
                    style: TextStyle(
                        fontSize: 22.sp,color: Colors.white70,fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 1.h,),
                  Obx(() => Text(
                    '${bmiController.h.value.toStringAsPrecision(3)} cm',
                    style: TextStyle(
                        fontSize: 18.sp,color: Colors.white70,fontWeight: FontWeight.w400),
                  )),
                  SizedBox(height: 1.5.h,),
                  Obx(
                        () => Slider(
                      value: bmiController.h.value,
                      onChanged: (value) {
                        bmiController.h.value = value;
                      },
                      max: 200,
                      divisions: 200,
                      inactiveColor: Colors.white24,
                      activeColor: Colors.pink,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Align(
                  alignment: leftAnimation!.value,
                  child: Container(
                    height: 45.w,
                    width: 45.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text("Weight",style: TextStyle(fontSize: 20.sp,color: Colors.white70,fontWeight: FontWeight.w400)),
                        SizedBox(height: 1.h),
                        Obx(() => Text("${bmiController.weight.value}",style: TextStyle(fontSize: 18.sp,color: Colors.white70,fontWeight: FontWeight.w400))),
                        SizedBox(height: 1.5.h,),
                        Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                          GestureDetector(
                            onTap: () => bmiController.incWeight(),
                            child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                              child: Icon(Icons.add,size: 20.sp,color: Colors.white,),),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () => bmiController.decWeight(),
                            child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                              child: Icon(Icons.remove,size: 20.sp,color: Colors.white,),),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: rightAnimation!.value,
                  child: Container(
                    height: 45.w,
                    width: 45.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text("Age",style: TextStyle(fontSize: 20.sp,color: Colors.white70,fontWeight: FontWeight.w400)),
                        SizedBox(height: 1.h),
                        Obx(() => Text("${bmiController.age.value}",style: TextStyle(fontSize: 18.sp,color: Colors.white70,fontWeight: FontWeight.w400))),
                        SizedBox(height: 1.5.h),
                        Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                          GestureDetector(
                            onTap: () => bmiController.incAge(),
                            child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                              child: Icon(Icons.add,size: 20.sp,color: Colors.white70)),
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () => bmiController.decAge(),
                            child: Container(width:13.w,height: 13.w,alignment: Alignment.center,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white12),
                              child: Icon(Icons.remove,size: 20.sp,color: Colors.white70),),
                          ),
                        ],),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: ()  {
              if(bmiController.male.value == false && bmiController.female.value == false)
              {
                Get.showSnackbar(GetSnackBar(
                  message: 'Please Select Gender',
                  duration: const Duration(seconds: 2),),
                );
              }

              else if(bmiController.h.value==0)
              {
                Get.showSnackbar(GetSnackBar(
                  message: 'Please Select Height',
                  duration: const Duration(seconds: 2),),
                );
              }

              else if(bmiController.weight.value==0)
              {
                Get.showSnackbar(GetSnackBar(
                  message: 'Please Select Weight',
                  duration: const Duration(seconds: 2),),
                );
              }

              else if(bmiController.age.value==0)
              {
                Get.showSnackbar(GetSnackBar(
                  message: 'Select your Age',
                  duration: const Duration(seconds: 2),),
                );
              }

              else if(
              (bmiController.male.value == true || bmiController.female.value ==true)
                  && bmiController.h.value!=0
                  && bmiController.weight.value!=0
                  && bmiController.age.value!=0)
              {
                bmiController.calBMI();
                Get.toNamed("/bmishow");
              }

            },
            child: Container(
                height: 8.h,
                width: 100.w,
                color: Color(0xFFEB1555),
                alignment: Alignment.center,
                child: Text("Calculate Your BMI",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp,color: Colors.white),)
            ),
          )
        ],
      ),

    ),

    );
  }
}
