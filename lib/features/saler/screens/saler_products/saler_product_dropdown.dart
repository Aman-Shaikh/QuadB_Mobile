import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../controllers/saler_products_controller.dart';

Widget WProductDropdown(hint,List<String> list,dropvalue,ProductsController controller) {
  return Obx(()=> Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: myWhiteColor, borderRadius: BorderRadius.circular(12.0)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
              hint: Text(
                "$hint",
                style: TextStyle(color: lightGrey),
              ),
              value: dropvalue.value == '' ? null : dropvalue.value,
              isExpanded: true,
              items: list.map( (e){
                return DropdownMenuItem(child:Text(e.toString()),value:e,);
          }).toList(),
              onChanged: (newValue) {
                if(hint == "Choose Category")
                  {
                    controller.subcategoryvalue.value = '';
                       controller.populateSubCategoryList(newValue.toString());
                  }
                  dropvalue.value = newValue.toString();


              })),
    ),
  );
}
