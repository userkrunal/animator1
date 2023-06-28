import 'package:get/get.dart';

class BmiController extends GetxController
{
  RxInt weight=0.obs;
  RxInt age=0.obs;
  RxDouble h=0.0.obs;

  RxBool male=false.obs;
  RxBool female=false.obs;

  void changGender(String gender)
  {
    if(gender=="male")
      {
        if(male.value==true)
          {
            male.value=false;
          }
        else
          {
            male.value=true;
            female.value=false;
          }
      }
    else
      {
        if(female.value==true)
          {
            female.value=false;
          }
        else
          {
            female.value=true;
            male.value=false;
          }
      }
  }


  void changHeight(double height)
  {
    h.value=height;
  }

  void incWeight()
  {
    weight.value ++;
  }

  void decWeight()
  {
    if(weight.value>=1)
      {
        weight.value --;
      }
  }


  void decAge()
  {
    if(age.value>=1)
      {
        age.value --;
      }
  }

  void incAge()
  {
      age.value ++;
  }


  RxDouble bValue = 20.0.obs;
  RxString bData = "normal".obs;


  void calBMI()
  {
    bValue.value=(weight.value/(h.value*h.value))*10000;



    if(bValue.value < 16)
    {
      bData.value = "Severe Thinness";
    }
    else if(bValue.value < 17 && bValue.value >= 16)
    {
      bData.value = "Moderate Thinness";
    }
    else if(bValue.value < 18.5 && bValue.value >= 17)
    {
      bData.value = "Mild Thinness";
    }
    else if(bValue.value < 25 && bValue.value >= 18.5)
    {
      bData.value = "Normal";
    }
    else if(bValue.value < 30 && bValue.value >= 25)
    {
      bData.value = "OverWeight";

    }
    else
    {
      bData.value = "Obese Class";
    }
  }

}