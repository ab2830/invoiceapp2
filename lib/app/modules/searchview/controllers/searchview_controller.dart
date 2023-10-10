import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/model/invoice_model.dart';
import '../../../../utils/network_utils.dart';

class SearchviewController extends GetxController {
  //TODO: Implement SearchviewController

  final count = 0.obs;
  final searchController = TextEditingController();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  int page_no = 1;
  String search = '';
  int page_record = 10;
  int dataLength = 0;

  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;
  bool hasNextPage = true;
  List<InvoiceListModel> invoceListData = [];
  List<InvoiceListModel> tempInvoceListData = [];
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
  searchProduct(String value) async {
    tempInvoceListData=invoceListData;
    update();
    invoceListData=[];

    if (value.isEmpty) {
      invoceListData = [];
    }
    var data = {"search": value, "page_no": page_no, "page_record": page_record};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(kAccessToken);
    var carListUrl = baseurl + getallBillList;

    final finaldata = await await APIServices.postWithDio(carListUrl, data,
        token: authToken);
    final invoiceData = finaldata.data;

    print("insdiee----${invoiceData}");
    if (invoiceData['statusCode'] == 200) {
      if (invoiceData['data']['car_brand_data'] != null) {
        List<InvoiceListModel> peginationData =invoiceData['data']['invoice_data']['rows']
            .map<InvoiceListModel>((json) => InvoiceListModel.fromJson(json))
            .toList();

        dataLength = invoiceData['data']['invoice_data']['count'];
        print("this data dataLength--${dataLength}");

        print("this data car--${dataLength}");
        print("this data car--${invoiceData['data']['invoice_data']['count']}");
      }
    }
  }
  emptySearchdata() {
    invoceListData = [];
    firstLoad();
    update();
  }

  void firstLoad() async {
    print("callllll----33");
    isFirstLoadRunning = true;
    update();
    try {
      var data = {"search": "", "page_no": 1, "page_record": page_record};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var authToken = prefs.getString(kAccessToken);
      var carListUrl = baseurl + getallBillList;

      final finaldata = await await APIServices.postWithDio(carListUrl, data,
          token: authToken);
      final invoiceData = finaldata.data;


      if (invoiceData['statusCode'] == 200) {
        if (invoiceData['data']['invoice_data'] != null) {
          print("iiiiiiii-${invoiceData['data']['invoice_data']}");
           invoceListData =invoiceData['data']['invoice_data']['rows']
              .map<InvoiceListModel>((json) => InvoiceListModel.fromJson(json))
              .toList();
update();
          dataLength = invoiceData['data']['invoice_data']['count'];
          print("this data dataLength--${dataLength}");

          print("this data car--${dataLength}");
          print("this data car--${invoiceData['data']['invoice_data']['count']}");
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong00--serch view');
      }
    }

    isFirstLoadRunning = false;
    update();
  }

  void loadMore() async {
    print("call loade more");
    if (isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        invoceListData.length != dataLength &&
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
        var carListUrl = baseurl + getallBillList;

        final finaldata = await await APIServices.postWithDio(carListUrl, data,
            token: authToken);
        final invoiceData = finaldata.data;
        if (invoiceData['statusCode'] == 200) {
          if (invoiceData['data']['invoice_data'] != null) {
            List<InvoiceListModel> peginationData =invoiceData['data']['invoice_data']['rows']
                .map<InvoiceListModel>((json) => InvoiceListModel.fromJson(json))
                .toList();
            invoceListData.addAll(peginationData);

            print("this data car--${invoceListData.length}");
            print("this data car--${invoceListData}");
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
      print("all data get:---${invoceListData.length}");
    }
  }

}
