import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/model/tyre_model.dart';
import '../../../../utils/network_utils.dart';

class TyreselectController extends GetxController {
  //TODO: Implement SelectcarController
  final searchController = TextEditingController();
  int page_no = 1;
  String search = '';
  int page_record = 10;
  int dataLength = 0;
  final count = 0.obs;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  bool hasNextPage = true;
  List<Rows> tyreListData = [];




  ScrollController? scrollController;

  @override
  void onInit() {
    isFirstLoadRunning = true;
    firstLoad();
    scrollController = ScrollController()..addListener((){
      if(scrollController!.position.pixels ==scrollController!.position.maxScrollExtent){
        loadMore();
      }
    });
    super.onInit();
  }

  void firstLoad() async {
    isFirstLoadRunning = true;
    update();
    try {
      var data = { "page_no": 1, "page_record": page_record};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var authToken = prefs.getString(kAccessToken);
      var carListUrl = baseurl + tyrelist;

      final finaldata = await await APIServices.postWithDio(carListUrl, data,
          token: authToken);
      final carData = finaldata.data;

      print("insdiee----${carData}");
      if (carData['statusCode'] == 200) {
        if (carData['data']['tyre_brand_data'] != null) {
          tyreListData = carData['data']['tyre_brand_data']['rows']
              .map<Rows>((json) => Rows.fromJson(json))
              .toList();
          dataLength = carData['data']['tyre_brand_data']['count'];
          print("this data dataLength--${dataLength}");
update();
          print("this data car--${tyreListData.length}");
          print("this data car--${tyreListData}");
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong00--tyreselect controller');
      }
    }

    isFirstLoadRunning = false;
    update();
  }

  void loadMore() async {
    if (isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        tyreListData.length != dataLength &&
        scrollController!.position.pixels ==scrollController!.position.maxScrollExtent) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      page_no += 1; // Increase _page by 1

      update();
      try {
        var data = {
          "search": "",
          "page_no": page_no,
          "page_record": page_record
        };
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var authToken = prefs.getString(kAccessToken);
        var carListUrl = baseurl + tyrelist;

        final finaldata = await await APIServices.postWithDio(carListUrl, data,
            token: authToken);
        final carData = finaldata.data;
        if (carData['statusCode'] == 200) {
          if (carData['data']['tyre_brand_data'] != null) {
            List<Rows> peginationData = carData['data']['tyre_brand_data']
            ['rows']
                .map<Rows>((json) => Rows.fromJson(json))
                .toList();
            tyreListData.addAll(peginationData);
            print("this data car--${tyreListData.length}");
            print("this data car--${tyreListData}");
          }
        } else {
          hasNextPage = false;
          update();
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      isLoadMoreRunning = false;
      update();
    } else {
      print("all data get:---${tyreListData.length}");
    }
  }


  // searchBrand(String value) async {
  //   print("search data::--${value}");
  //   if (value.isEmpty) {
  //     tyreListData = [];
  //   print("search data::--${search}");
  //   var data = {"search": value, "page_no": page_no, "page_record": page_record};
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var authToken = prefs.getString(kAccessToken);
  //   var carListUrl = baseurl + tyrelist;
  //   print("url::$carListUrl");
  //
  //   final finaldata = await await APIServices.postWithDio(carListUrl, data,
  //       token: authToken);
  //   final carData = finaldata.data;
  //
  //   print("insdiee----${carData}");
  //   if (carData['statusCode'] == 200) {
  //     if (carData['data']['tyre_brand_data'] != null) {
  //       tyreListData = carData['data']['tyre_brand_data']['rows']
  //           .map<Rows>((json) => Rows.fromJson(json))
  //           .toList();
  //       dataLength = carData['data']['tyre_brand_data']['count'];
  //       update();
  //       print("this data dataLength--${dataLength}");
  //
  //
  //       print("this data car--${tyreListData.length}");
  //       print("this data car--${tyreListData}");
  //     }
  //   }}
  // }
  searchProduct(String value) async {

    if (value.isEmpty) {
      tyreListData = [];
    }
    var data = {"search": value, "page_no": page_no, "page_record": page_record};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(kAccessToken);
    var carListUrl = baseurl + tyrelist;

    final finaldata = await await APIServices.postWithDio(carListUrl, data,
        token: authToken);
    final carData = finaldata.data;

    print("insdiee----${carData}");
    if (carData['statusCode'] == 200) {
      if (carData['data']['tyre_brand_data'] != null) {
        tyreListData = carData['data']['tyre_brand_data']['rows']
            .map<Rows>((json) => Rows.fromJson(json))
            .toList();
        dataLength = carData['data']['tyre_brand_data']['count'];
        update();
        print("this data dataLength--${dataLength}");


        print("this data car--${tyreListData.length}");
        print("this data car--${tyreListData}");
      }
    }
  }
  emptySearchdata() {
    tyreListData = [];
    firstLoad();

  }
  // Future<void> fetchCarData(int pageKey) async {
  //   var data = {"search": "", "page_no": 1, "page_record": 10};
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var authToken = prefs.getString(kAccessToken);
  //   var carurl = baseurl + carList;
  //
  //   try {
  //     final finaldata = await await APIServices.postWithDio(
  //         carurl, data,
  //         token: authToken);
  //
  //     if (finaldata.statusCode == 200) {
  //       print("car dtaa---${finaldata}");
  //     } else if (finaldata.statusCode == 401) {
  //       Get.snackbar("Error", "Invalid token",
  //           snackPosition: SnackPosition.BOTTOM, colorText: Colors.black);
  //     }
  //
  //   } catch (error) {
  //     pagingController.error = error;
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
