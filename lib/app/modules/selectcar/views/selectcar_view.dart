import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/assets_const.dart';
import '../../../../utils/colors_const.dart';
import '../../../../utils/string_const.dart';
import '../../createbillview/controllers/createbillview_controller.dart';
import '../../editbilldata/controllers/editbilldata_controller.dart';
import '../controllers/selectcar_controller.dart';

class SelectcarView extends GetView<SelectcarController> {
    SelectcarView({Key? key}) : super(key: key);
    final selectcarController = Get.put(SelectcarController());

  @override
  Widget build(BuildContext context) {
    var carname = Get.put(SelectcarController());
    return GetBuilder<SelectcarController>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('Select Car',
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: Colors.black)),
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: (){
                    // controller.searchController.clear();
                    // controller.update();
                    Get.back();
                  },
                  child: Icon(FontAwesomeIcons.angleLeft,color: Colors.black,)),
            ),

            body:  GetBuilder<SelectcarController>(
              builder: (context) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w, vertical: 15.0.h),
                      child: TextFormField(
                        cursorColor: ConstColor.borderColor,
                        controller: carname.searchController,
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
                          // suffixIcon: Padding(
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
                               suffixIcon:IconButton(icon: Icon(FontAwesomeIcons.xmark),onPressed: (){
                controller.searchController.clear();
                controller.emptySearchdata();
                },),
                          errorMaxLines: 2,
                          errorStyle: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),

                      Expanded(
                        child:
                selectcarController.carListData.isEmpty && selectcarController.searchController.text.isNotEmpty?
                const Center(child: Text("No Data Found")):
                        SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller:  selectcarController.scrollController,
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 16),
                            physics: const  NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // controller: selectcarController.scrollController,
                            itemCount: selectcarController.carListData.length,
                            itemBuilder: (_, index) =>
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  child: GestureDetector(
                                    onTap: (){
                                      var con=Get.put(CreatebillviewController());
                                      var edit=Get.put(EditbilldataController());
                                      print("value of------${edit.isCarNameEdit}");
                                      if(edit.isCarNameEdit==false){
                                        con.selectCarID=controller.carListData[index].carBrandId;
                                        con.carNameController.text=controller.carListData[index].title.toString();
                                        con.update();
                                        Get.back();

                                      }
                                      else{
                                        print("edit carrrrrr");
                                        edit.selectCarID=controller.carListData[index].carBrandId;
                                        edit.carNameController.text=controller.carListData[index].title.toString();
                                        edit.update();
                                        Get.back();

                                      }

                                    },
                                    child: ListTile(
                                      title: Text(controller.carListData[index].title
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
                //     if (controller.hasNextPage == false)
                // Container(
                //   padding: const EdgeInsets.only(top: 30, bottom: 40),
                //   color: Colors.amber,
                //   child: const Center(
                //     child: Text('You have fetched all of the content'),
                //   ),
                // ),
                ],
                );
              }
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
