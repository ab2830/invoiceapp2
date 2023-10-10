import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancing/app/modules/editbilldata/controllers/editbilldata_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/colors_const.dart';
import '../../../../utils/string_const.dart';
import '../../createbillview/controllers/createbillview_controller.dart';
import '../controllers/tyreselect_controller.dart';

class CompanySelecation extends GetView<TyreselectController> {
  CompanySelecation({Key? key}) : super(key: key);
  final tyreselectController = Get.put(TyreselectController());

  @override
  Widget build(BuildContext context) {
    var con = Get.put(TyreselectController());
    con.firstLoad();
    return GetBuilder<TyreselectController>(builder: (context) {
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
              onTap: () {
                controller.searchController.clear();
                controller.update();
                Get.back();
              },
              child: Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
              )),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
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
                      borderSide: BorderSide(color: ConstColor.borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ConstColor.borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ConstColor.borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  isDense: true,
                  isCollapsed: false,
                  contentPadding: const EdgeInsets.only(top: 12, left: 10),
                  hintText: searchHere,
                  hintStyle:
                      TextStyle(color: ConstColor.hintTextColor, fontSize: 16),
                  suffixIcon: IconButton(
                    icon: Icon(FontAwesomeIcons.xmark),
                    onPressed: () {
                      controller.searchController.clear();
                      controller.emptySearchdata();
                    },
                  ),
                  errorMaxLines: 2,
                  errorStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            Expanded(
              child: tyreselectController.tyreListData.isEmpty &&
                      tyreselectController.searchController.text.isNotEmpty
                  ? Center(child: const Text("No Data Found"))
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 16),
                      shrinkWrap: true,
                      controller: tyreselectController.scrollController,
                      itemCount: tyreselectController.tyreListData.length,
                      itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            var con = Get.put(CreatebillviewController());
                            var edit=Get.put(EditbilldataController());
                            if(edit.isCompanyEdit==false){
                              con.tyre_CompanyId =
                                  controller.tyreListData[index].tyreBrandId;

                              con.untyid =
                                  controller.tyreListData[index].tyreBrandId;
                              con.unchipValue =
                                  controller.tyreListData[index].title.toString();

                              con.update();

                              con.addChip(
                                  controller.tyreListData[index].title.toString(),
                                  controller.tyreListData[index].tyreBrandId!
                                      .toInt());
                              Get.back();
                            }else{
                              edit.tyre_CompanyId =
                                  controller.tyreListData[index].tyreBrandId;

                              edit.untyid =
                                  controller.tyreListData[index].tyreBrandId;
                              edit.unchipValue =
                                  controller.tyreListData[index].title.toString();

                              edit.update();

                              edit.addChip(
                                  controller.tyreListData[index].title.toString(),
                                  controller.tyreListData[index].tyreBrandId!
                                      .toInt());
                              Get.back();
                            }

                          },
                          child: ListTile(
                            title: Text(
                                controller.tyreListData[index].title.toString(),
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
    });
  }
}
//   }
//         );
//       }
//     );
//   }
// }
