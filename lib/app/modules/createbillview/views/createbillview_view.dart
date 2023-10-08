import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancing/app/modules/tyresize/views/tyresize_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors_const.dart';
import '../../../../utils/common_button.dart';
import '../../../../utils/common_text_field.dart';
import '../../../../utils/string_const.dart';
import '../../../../utils/text_style.dart';
import '../../companySelect/views/tyreselect_view.dart';
import '../../selectcar/views/selectcar_view.dart';

import '../controllers/createbillview_controller.dart';

class CreatebillviewView extends GetView<CreatebillviewController> {
  CreatebillviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = Get.put(CreatebillviewController());
    a.getInvoiceNumber();
    return Scaffold(
        backgroundColor: ConstColor.appBgColor,
        appBar: AppBar(
          elevation: 0,
          title: Text('Create Bill',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: GetBuilder<CreatebillviewController>(builder: (context) {
          return GestureDetector(
            onTap: () {
              controller.unFoucsTotal(controller.unchipValue, controller.untyid);
              controller.getSubToal();

              FocusScope.of(Get.context!).unfocus();
            },
            child: SingleChildScrollView(
              child:
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                        width: Get.width,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CommonTextField(
                                  hintText: billNo,
                                  isReadOnly: true,
                                  controller: controller.billNoController,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.h),
                                )),
                                SizedBox(
                                  width: 16.w,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 38.h,
                                    child: TextFormField(
                                      onTap: () {
                                        print("hiiiiiiiiiiii");
                                        controller.selectDate();
                                      },
                                      readOnly: true,
                                      controller: controller.dateController,
                                      decoration: InputDecoration(
                                          hintText: date,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: ConstColor.borderColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color : ConstColor.borderColor,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(10)),
                                          disabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color : ConstColor.borderColor,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: ConstColor.borderColor,
                                                width: 1.5),
                                          )),
                                    ),
                                  ),
                                  // CommonTextField(
                                  //   hintText: date,
                                  //   isReadOnly: true,
                                  //   onTap: (){
                                  //     print("clckkk");
                                  //     controller.selectDate();
                                  //   },
                                  //   controller: controller.dateController,
                                  //   contentPadding:
                                  //   EdgeInsets.symmetric(horizontal: 8.h),
                                  // )
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                        width: Get.width,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Column(
                              children: [
                                CommonTextField(
                                  hintText: carNo,
                                  controller: controller.carNoController,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.h),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return carNumberError;
                                    } else if (value.trim().isEmpty) {
                                      return carNumberError;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                CommonTextField(
                                  hintText: customer_name,
                                  controller: controller.customerNameController,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.h),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return nameError;
                                    } else if (value.trim().isEmpty) {
                                      return nameError;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                // SizedBox(
                                //   height: 16.h,
                                // ),
                                // CommonTextField(
                                //   hintText: tSize,
                                //   controller: controller.tyreSizeController,
                                //   contentPadding:
                                //       EdgeInsets.symmetric(horizontal: 8.h),
                                //   suffixIcon: Icon(FontAwesomeIcons.angleDown),
                                // ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                        width: Get.width,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  onTap: () {
                                    print("hiiiiiiiiiiii");
                                    Get.to(SelectcarView());
                                  },
                                  readOnly: true,
                                  controller: controller.carNameController,

                                  decoration: InputDecoration(
                                      hintText: carname,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color : ConstColor.borderColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.circular(10)),
                                      disabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color : ConstColor.borderColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                      )),

                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return carNumberError;
                                    } else if (value.trim().isEmpty) {
                                      return carNumberError;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),

                                ////
                                SizedBox(
                                  height: 16.h,
                                ),
                                TextFormField(
                                  onTap: () {
                                    Get.to(TyresizeView());
                                  },
                                  readOnly: true,
                                  controller: controller.tyreSizeController,
                                  decoration: InputDecoration(
                                      hintText: tSize,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color : ConstColor.borderColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.circular(10)),
                                      disabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color : ConstColor.borderColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                      )),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return tyreSizeError;
                                    } else if (value.trim().isEmpty) {
                                      return tyreSizeError;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),

                                ///
                                SizedBox(
                                  height: 16.h,
                                ),
                                TextFormField(
                                  onTap: () {
                                    Get.to(CompanySelecation());
                                  },

                                  readOnly: true,
                                  controller: controller.tyerCompanyController,
                                  decoration: InputDecoration(
                                      hintText: companyname,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color : ConstColor.borderColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.circular(10)),
                                      disabledBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color : ConstColor.borderColor,
                                              width: 1.5),
                                          borderRadius: BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ConstColor.borderColor,
                                            width: 1.5),
                                      )),

                                ),
                                if (controller.selectedChips.length != 0)
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                if (controller.selectedChips.length != 0)
                                  GetBuilder<CreatebillviewController>(
                                      builder: (context) {
                                    return Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(16)),
                                          border: Border.all(
                                            color: ConstColor.borderColor,
                                          )),
                                      child: Wrap(
                                        spacing: 8.0,
                                        children: controller.selectedChips
                                            .map((chipValue) {
                                          return Chip(
                                            label: Text(chipValue),
                                            onDeleted: () {
                                              controller.removeChip(chipValue);
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  }),
                                SizedBox(
                                  height: 16.h,
                                ),
                                CommonTextField(
                                  hintText: km,
                                  controller: controller.kmController,
                                  keyboardType: TextInputType.number,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.h),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return currentkmError;
                                    } else if (value.trim().isEmpty) {
                                      return currentkmError;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),

                                GetBuilder<CreatebillviewController>(
                                    builder: (context) {
                                  return TextButton(
                                      onPressed: () {
                                        controller.isChecked =
                                            controller.isChecked == false
                                                ? true
                                                : false;

                                        controller.update();
                                        controller.aligmnetPrice.text ="0";
                                        controller.getSubToal();
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: 24.0,
                                                width: 24.0,
                                                child: Checkbox(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4)),
                                                    value: controller.isChecked,
                                                    onChanged: (value) {
                                                      controller.aligmnetPrice.text ="0";


                                                      controller.isChecked =
                                                          controller.isChecked ==
                                                                  false
                                                              ? true
                                                              : false;
                                                      controller.update();
                                                      controller.getSubToal();
                                                    })),
                                            // You can play with the width to adjust your
                                            // desired spacing
                                            SizedBox(width: 4.0),
                                            Text(chekcboxText,
                                                style: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12.sp,
                                                    color: Colors.black))
                                          ]));
                                }),

                                GetBuilder<CreatebillviewController>(
                                    builder: (context) {
                                  return controller.isChecked == true
                                      ?    SizedBox(
                                    height: 38.h,
                                    child:
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      onTap: () {
                                        // print("hiiiiiiiiiiii");
                                        // controller.selectDate();
                                      },
                                      onFieldSubmitted: (v){
                                        controller.getSubToal();
                                      },
                                      readOnly: false,
                                      controller: controller.aligmnetPrice,
                                      decoration: InputDecoration(
                                          hintText: alimnetPrice,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: ConstColor.borderColor,
                                                width: 1.5),
                                          ),
                                          enabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color : ConstColor.borderColor,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(10)),
                                          disabledBorder:  OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color : ConstColor.borderColor,
                                                  width: 1.5),
                                              borderRadius: BorderRadius.circular(10)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: ConstColor.borderColor,
                                                width: 1.5),
                                          )),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return alimnetPrice;
                                        } else if (value.trim().isEmpty) {
                                          return alimnetPrice;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ):SizedBox();

                                  // CommonTextField(
                                  //
                                  //         hintText: aligmnetPrice,
                                  //         controller: controller.aligmnetPrice,
                                  //         keyboardType: TextInputType.number,
                                  //         contentPadding:
                                  //             EdgeInsets.symmetric(horizontal: 8.h),
                                  //       )
                                  //     : SizedBox();
                                }),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: controller.warentyvalueController,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(12.0),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: ConstColor.borderColor,
                                            )),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                              color: ConstColor.borderColor,
                                            )),
                                            fillColor: Colors.white,
                                            hintText: 'Enter warranty ',
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return warrentyError;
                                            } else if (value.trim().isEmpty) {
                                              return warrentyError;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: ConstColor.borderColor,
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          )),
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            value: controller.selectewarenty,
                                            items: controller.selectewarentyTyep
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: const TextStyle(
                                                        fontSize: 12.0),
                                                  ));
                                            }).toList(),
                                            onChanged: (value) {
                                              controller.selectewarenty =
                                                  value.toString();
                                              controller.update();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  backdrop,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500, fontSize: 16.sp),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(() => Radio(
                                          value: BillTyep.GSTBill,
                                          groupValue:
                                              controller.selecteBillTyep.value,
                                          onChanged: (newBill) {
                                            controller
                                                .updateselecteBillTyep(newBill!);
                                            controller.getSubToal();
                                          },
                                        )),
                                    Text(gstbill),
                                    Obx(() => Radio(
                                          value: BillTyep.NonGSTBill,
                                          groupValue:
                                              controller.selecteBillTyep.value,
                                          onChanged: (newBill) {
                                            controller
                                                .updateselecteBillTyep(newBill!);
                                            controller.getSubToal();
                                          },
                                        )),
                                    Text(nongstBill),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: Get.width,
                      color: Colors.white,
                      child: controller.billingItems.length != 0
                          ? Column(
                              children: [
                                GetBuilder<CreatebillviewController>(
                                    builder: (context) {
                                  return FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: DataTable(
                                      columns: <DataColumn>[
                                        DataColumn(
                                            label: Text(discrpction,
                                                textAlign: TextAlign.center)),
                                        DataColumn(
                                            label: Text(qty,
                                                textAlign: TextAlign.center)),
                                        DataColumn(
                                            label: Text(rate,
                                                textAlign: TextAlign.center)),
                                        DataColumn(
                                            label: Text("Total",
                                                textAlign: TextAlign.center)),
                                      ],
                                      rows: controller.billingItems
                                          .map((billingItem) {
                                        final total = billingItem.quantity *
                                            billingItem.price;
                                        return DataRow(cells: [
                                          DataCell(
                                            Text(
                                              billingItem.itemName.toString(),
                                              textAlign: TextAlign.center,
                                              style: billTextStyle(),
                                            ),
                                          ),
                                          DataCell(Text(
                                              billingItem.quantity.toString(),
                                              textAlign: TextAlign.center,
                                              style: billTextStyle())),
                                          DataCell(TextFormField(


                                            keyboardType: TextInputType.number,
                                            controller: controller.getControllerOf(
                                                billingItem.index.toString()),
                                            onFieldSubmitted: (a) {
                                              controller.addPrice(
                                                  double.parse(controller
                                                          .getControllerOf(
                                                              billingItem.index
                                                                  .toString())
                                                          .text)
                                                      .toDouble(),
                                                  billingItem.itemName);

                                            },
                                            onTapOutside: (v){
                                              print("object-----click outside;;");
                                              controller.addPrice(
                                                  double.parse(controller
                                                      .getControllerOf(
                                                      billingItem.index
                                                          .toString())
                                                      .text)
                                                      .toDouble(),
                                                  billingItem.itemName);
                                              controller.getSubToal();
                                            },
                                            // validator: (value) {
                                            //   if (value!.isEmpty) {
                                            //     return warrentyError;
                                            //   } else if (value.trim().isEmpty) {
                                            //     return warrentyError;
                                            //   } else {
                                            //     return null;
                                            //   }
                                            // },
                                          )),
                                          // DataCell(Text(billingItem.price.toString(),textAlign: TextAlign.center)),
                                          DataCell(Text(total.toString(),
                                              textAlign: TextAlign.center,
                                              style: billTextStyle())),
                                        ]);
                                      }).toList(),
                                    ),
                                  );
                                }),
                                Divider(
                                  thickness: 1.5,
                                  color: ConstColor.hintTextColor,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: ConstColor.rbillTextColor)),
                                      Text(
                                          "${controller.calculateTotal().toStringAsFixed(2)}",
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: ConstColor.rbillTextColor))
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),
                                Divider(
                                  thickness: 1.5,
                                  color: ConstColor.hintTextColor,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                //disc
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "Discount",
                                        style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: ConstColor.rbillTextColor),
                                      )),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                          child:   SizedBox(
                                            height: 38.h,
                                            child:
                                            TextFormField(
                                              onTap: () {
                                                print("hiiiiiiiiiiii");
                                                //controller.selectDate();
                                              },
                                              readOnly: false,
                                              controller: controller.discountController,
                                              onFieldSubmitted: (v){
                                                controller.getSubToal();
                                              },
                                              decoration: InputDecoration(
                                                  hintText: discount,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: ConstColor.borderColor,
                                                        width: 1.5),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color: ConstColor.borderColor,
                                                        width: 1.5),
                                                  )),
                                            ),
                                          ),
                                      //     CommonFTextField(
                                      //   hintText: discount,
                                      //   keyboardType: TextInputType.number,
                                      //   controller: controller.discountController,
                                      //
                                      //   contentPadding:
                                      //       EdgeInsets.symmetric(horizontal: 8.h),
                                      // )
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 16.h,
                                ),
                                if(controller.isChecked==true)
                                GetBuilder<CreatebillviewController>(
                                    builder: (context) {
                                      return GetBuilder<CreatebillviewController>(
                                          builder: (context) {
                                            return controller.isgstBill.value == true
                                                ?
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          "Alignment",
                                                          style: GoogleFonts.dmSans(
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontSize: 16.sp,
                                                              color: ConstColor
                                                                  .rbillTextColor))),
                                                  Text("${controller.aligement.toStringAsFixed(2)}",
                                                      style: GoogleFonts.dmSans(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 16.sp,
                                                          color: ConstColor
                                                              .rbillTextColor))
                                                ],
                                              ),
                                            )
                                                : SizedBox();
                                          });
                                    }),
                                if(controller.isChecked==true)
                                Divider(
                                  thickness: 1.5,
                                  color: ConstColor.hintTextColor,
                                ),


                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Sub Total",
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: ConstColor.rbillTextColor)),
                                      Text(
                                          "${controller.subtotal.toStringAsFixed(2)}",
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: ConstColor.rbillTextColor))
                                    ],
                                  ),
                                ),


                                if (controller.isgstBill.value == true)
                                  Divider(
                                    thickness: 1.5,
                                    color: ConstColor.hintTextColor,
                                  ),
                                if (controller.isgstBill.value == true)
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                GetBuilder<CreatebillviewController>(
                                    builder: (context) {
                                  return GetBuilder<CreatebillviewController>(
                                      builder: (context) {
                                    return controller.isgstBill.value == true
                                        ?
                                    Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        "GST(SGST+CGST) 18%",
                                                        style: GoogleFonts.dmSans(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16.sp,
                                                            color: ConstColor
                                                                .rbillTextColor))),
                                                Text("${controller.totalGst.toStringAsFixed(2)}",
                                                    style: GoogleFonts.dmSans(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16.sp,
                                                        color: ConstColor
                                                            .rbillTextColor))
                                              ],
                                            ),
                                          )
                                        : SizedBox();
                                  });
                                }),

                                SizedBox(
                                  height: 8.h,
                                ),
                                Divider(
                                  thickness: 1.5,
                                  color: ConstColor.hintTextColor,
                                ),



                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Grand Total",
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: ConstColor.rbillTextColor)),
                                      Text(
                                          "${controller.grandTotal.toStringAsFixed(2)}",
                                          style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp,
                                              color: ConstColor.rbillTextColor))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Container(
                                    child: CustomButton(
                                      maxHeight: 80.h,
                                      color: ConstColor.appPrimary2,
                                      onPressed: () {

                                        if (controller.formKey.currentState!.validate()) {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          controller.SubmitBill();
                                        }
                                        else{
                                          Get.snackbar(
                                              "Error",
                                              "Total can't be zero",
                                              snackPosition: SnackPosition.BOTTOM,
                                              colorText: Colors.black
                                          );
                                        }
                                      },
                                      title: "Save",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 45.h,
                                ),
                              ],
                            )
                          : SizedBox(),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
