import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/model/invoice_model.dart';
import '../../../../utils/network_utils.dart';

class ReplacementnewController extends GetxController {
  //TODO: Implement ReplacementnewController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final searchController = TextEditingController();

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

  void firstLoad({String? search}) async {

    isFirstLoadRunning = true;
    update();
    try {
      var data = {"search": search, "page_no": 1, "page_record": page_record};
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
}
