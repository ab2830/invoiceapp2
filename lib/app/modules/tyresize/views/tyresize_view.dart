import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/assets_const.dart';
import '../../../../utils/colors_const.dart';
import '../../../../utils/string_const.dart';
import '../../createbillview/controllers/createbillview_controller.dart';
import '../controllers/tyresize_controller.dart';

class TyresizeView extends GetView<TyresizeController> {
    TyresizeView({Key? key}) : super(key: key);
    final tyresizeController = Get.put(TyresizeController());
  @override
  Widget build(BuildContext context) {
    var con = Get.put(TyresizeController());
    con.firstLoad();
    return GetBuilder<TyresizeController>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('Tyre Size',
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: Colors.black)),
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: (){
                    controller.searchController.clear();
                    controller.update();
                    Get.back();
                  },
                  child: Icon(FontAwesomeIcons.angleLeft,color: Colors.black,)),
            ),

            body:  Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0.w, vertical: 15.0.h),
                  child: TextFormField(
                    cursorColor: ConstColor.borderColor,
                    controller: con.searchController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,

                    onChanged: (value) {
                      ///search logic
                      if (value.trim().isNotEmpty) {
                        controller.searchProduct(value);
                      } else {
                        controller.emptySearchdata();
                      }
                    },
                    decoration: InputDecoration(
                      // fillColor: darkMode.value
                      //     ? ConstColor.gray200
                      //     : ConstColor.appColor2,
                      // filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:  ConstColor.borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:  ConstColor.borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:  ConstColor.borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      isDense: true,
                      isCollapsed: false,
                      contentPadding:
                      const EdgeInsets.only(top: 12, left: 10),
                      hintText: searchHere,
                      hintStyle:   TextStyle(
                          color: ConstColor.hintTextColor, fontSize: 16),
                      suffixIcon:IconButton(icon: Icon(FontAwesomeIcons.xmark),onPressed: (){
                        controller.searchController.clear();
                        controller.emptySearchdata();
                      },),
                      // Padding(
                      //   padding: const EdgeInsets.all(5),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         color:  ConstColor.borderColor,
                      //         borderRadius: BorderRadius.circular(8)),
                      //     child: Image.asset(
                      //       searchPng,
                      //       color:   ConstColor.black
                      //       ,
                      //     ),
                      //   ),
                      // ),
                      errorMaxLines: 2,
                      errorStyle: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),

                //CMT ------DAKSH NEW API
                // Expanded(
                //   child: SingleChildScrollView(
                //     physics: const  NeverScrollableScrollPhysics(),
                //     child: tyresizeController.tyreListData.isEmpty && tyresizeController.searchController.text.isNotEmpty?   Center(child: const Text("No Data Found")):
                //       ListView.builder(
                //         controller: tyresizeController.scrollController,
                //         itemCount: tyresizeController.tyreListData.length,
                //         physics: const AlwaysScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemBuilder: (_, index) =>
                //             Card(
                //               margin: const EdgeInsets.symmetric(
                //                   vertical: 8, horizontal: 10),
                //               child: GestureDetector(
                //                 onTap: (){
                //                   var con=Get.put(CreatebillviewController());
                //                   con.tyre_SizeId=controller.tyreListData[index].tyreTypeId;
                //                   con.tyreSizeController.text=controller.tyreListData[index].title.toString();
                //                   con.update();
                //                   Get.back();
                //                 },
                //                 child: ListTile(
                //                   title: Text(controller.tyreListData[index].title
                //                       .toString()),
                //
                //                 ),
                //               ),
                //             ),
                //       ),
                //   ),
                // ),
                Expanded(
                  child:
                  tyresizeController.tyreListData.isEmpty && tyresizeController.searchController.text.isNotEmpty?
                  const Center(child: Text("No Data Found")):
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller:  tyresizeController.scrollController,
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 16),
                      physics: const  NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // controller: selectcarController.scrollController,
                      itemCount: tyresizeController.tyreListData.length,
                      itemBuilder: (_, index) =>
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: GestureDetector(
                              onTap: (){
                                var con=Get.put(CreatebillviewController());
                                con.tyre_SizeId=controller.tyreListData[index].tyreTypeId;
                                               con.tyreSizeController.text=controller.tyreListData[index].title.toString();
                                            con.update();
                                       Get.back();
                              },
                              child: ListTile(

                                title: Text(controller.tyreListData[index].title
                                    .toString(),
                                    style: GoogleFonts.dmSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                        color: Colors.black)),

                              ),
                            ),
                          ),
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (controller.isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (controller.hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
          );
        }
    );
  }}
//   }
//         );
//       }
//     );
//   }
// }
