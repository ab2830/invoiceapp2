import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancing/utils/colors_const.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/common_button.dart';
import '../../../../utils/common_text_field.dart';
import '../../../../utils/model/invoice_model.dart';
import '../../../../utils/network_utils.dart';
import '../../../../utils/string_const.dart';
import '../../replacementbill/views/replacementbill_view.dart';
import '../controllers/searchview_controller.dart';

class SearchviewView extends GetView<SearchviewController> {
  SearchviewView({Key? key}) : super(key: key);
  var search = Get.put(SearchviewController());


  @override
  Widget build(BuildContext context) {
    var search2 = Get.put(SearchviewController());
    search2.firstLoad();



    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Invoice List',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                  color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                controller.searchController.clear();
                controller.emptySearchdata();

                controller.update();
                Get.back();
              },
              child: const Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
              )),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CommonTextField(
                hintText: searchHint,
                controller: controller.searchController,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.h),
                prefixIcon: Icon(FontAwesomeIcons.search),
                suffixIcon:IconButton(icon: Icon(FontAwesomeIcons.xmark),onPressed: (){
                  controller.searchController.clear();
                  controller.emptySearchdata();
                  //controller.invoceListData=controller.tempInvoceListData;
                  controller.update();
                 // controller.emptySearchdata();
                },),
                  onChanged: (value) {
                    ///search logic
                    if (value.trim().isNotEmpty) {
                      controller.searchProduct(value);
                    } else {
                      controller.emptySearchdata();
                    }
                  },

                // suffixIcon: Icon(FontAwesomeIcons.angleDown),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child:
              search.invoceListData.isEmpty && search.searchController.text.isNotEmpty?
              const Center(child: Text("No Data Found")):
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
              controller:  search.scrollController,
                child: RefreshIndicator(
                  onRefresh: ()async{
                    await Future.delayed(Duration(seconds: 2));
                    controller.firstLoad();
                  },
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: 16),
                    physics: const  NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // controller: search.scrollController,
                    itemCount:search.invoceListData.length,
                    itemBuilder: (_, index) {
                      List<InvoiceDataInner> data=[];


                      return Container(
                          color: Colors.white,

                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: ConstColor.appPrimary2,
                                      borderRadius: BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "INVOICE",
                                    style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12.sp,
                                        color: ConstColor.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [



                                    Expanded(
                                      child: Wrap(
                                        children: controller.invoceListData[index].invoiceData!.map((item) => Text(item.tyreBrandTitle.toString()+ " X "+item.count.toString()+" ",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: ConstColor.rbillTextColor
                                            )

                                        )).toList().cast<Widget>(),
                                      )

                                      // Text("MRF X 2  Apollo X 2",
                                      //   style: GoogleFonts.dmSans(
                                      //       fontSize: 16,
                                      //       fontWeight: FontWeight.w700,
                                      //       color: ConstColor.rbillTextColor
                                      //   ),),
                                    ),

                                    SvgPicture.asset("assets/Edit.svg",height: 25.h,width: 25.w,)

                                  ],
                                ),
                                SizedBox(height: 8.h,),
                                Text(controller.invoceListData[index].tyreTypeTitle.toString(),
                                    style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColor.rbillTextColor
                                    )
                                ),

                                SizedBox(height: 8.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text("warranty: ${controller.invoceListData[index].warrentyValue.toString()}  ${ controller.invoceListData[index].warrentyValue==2?"Month":"Kilometer"}",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: ConstColor.appPrimary2
                                        )
                                    ),
                                    Text("${controller.invoceListData[index].currentKm.toString()} Kilometer",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: ConstColor.appPrimary2
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h,),
                                Text("Replacement Bill",
                                    style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColor.rbillTextColor
                                    )
                                ),
                                SizedBox(height: 8.h,),
                                Text(dataFormate.format(DateTime.parse(controller.invoceListData[index].invoiceDate.toString())).toString(),
                                    style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ConstColor.rbillTextColor
                                    )
                                ),
                                SizedBox(height: 8.h,),

                              ],
                            ),
                          ),
                        );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(color: ConstColor.dividerColor,);
                    },
                  ),
                ),
              ),
            ),

            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 8.w),
            //   child: CustomButton(
            //     maxHeight: 80.h,
            //     color: ConstColor.appPrimary2,
            //     onPressed: () {
            //       Get.to(ReplacementbillView());
            //       // if (controller.loginFormKey.currentState!.validate()) {
            //       //   FocusManager.instance.primaryFocus?.unfocus();
            //       //   controller.callLoginApi();
            //       // }
            //     },
            //     title: "Search",
            //     fontWeight: FontWeight.w700,
            //     fontSize: 16.sp,
            //     textColor: Colors.white,
            //   ),
            // ),
          ],
        ));
  }
}
