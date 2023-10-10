import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancing/utils/colors_const.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/string_const.dart';
import '../../editbill/controllers/editbill_controller.dart';
import '../controllers/edittyrebrand_controller.dart';

class EdittyrebrandView extends GetView<EdittyrebrandController> {
  EdittyrebrandView({Key? key}) : super(key: key);
  final edittyrebrandController = Get.put(EdittyrebrandController());

  @override
  Widget build(BuildContext context) {
    var con = Get.put(EdittyrebrandController());
    con.firstLoad();
    return GetBuilder<EdittyrebrandController>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text('Select Company',
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
                    controller: controller.searchController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      print("tyre selec::tt");
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
                      errorMaxLines: 2,
                      errorStyle: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Expanded(
                  child:
                  edittyrebrandController.tyreListData.isEmpty && edittyrebrandController.searchController.text.isNotEmpty?
                  Center(child: const Text("No Data Found")):
                  ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    controller: edittyrebrandController.scrollController,
                    itemCount: edittyrebrandController.tyreListData.length,
                    itemBuilder: (_, index) =>
                        Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          child: GestureDetector(
                            onTap: (){
                              var con=Get.put(EditbillController());
                              con.tyre_CompanyId=controller.tyreListData[index].tyreBrandId;

                              con.untyid=controller.tyreListData[index].tyreBrandId;
                              con.unchipValue=controller.tyreListData[index].title.toString();

                              con.update();


                              con.addChip(controller.tyreListData[index].title.toString(),controller.tyreListData[index].tyreBrandId!.toInt());
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
