import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../demo_class.dart';
import '../../../../main.dart';
import '../../../../utils/api_services.dart';
import '../../../../utils/model/bill_details_model.dart';
import '../../../../utils/network_utils.dart';
import '../../bottamnavigationview/controllers/bottamnavigationview_controller.dart';
import '../../homeview/controllers/homeview_controller.dart';
import '../../searchview/controllers/searchview_controller.dart';

enum BillTyep { GSTBill, NonGSTBill }

class EditbilldataController extends GetxController {
  var id = Get.arguments;
  Rx<BillTyep> selecteBillTyep = BillTyep.GSTBill.obs;

  List<String> warentyType = ["Kilometer", "Months"];
  String selectedwarentyType = "Kilometer";
  String defaultKm = "10000";
  String defaultMonth = "6";
  List<String> warentyTypeKm = [
    "10000",
    "200000",
    "30000",
    "40000",
    "50000",
    "60000",
    "70000",
    "80000",
    "90000",
    "100000"
  ];
  List<String> warentyTypeMonth = [
    "6",
    "12",
    "18",
    "24",
    "30",
    "36",
    "42",
    "48",
    "54",
    "60",
    "66",
    "72",
    "78"
  ];
  bool isCarNameEdit=false;
  bool isTyreSizeEdit=false;
  bool isCompanyEdit=false;
  var user_id;

  void updateselecteBillTyep(BillTyep nb) {
    print("nb--------${nb}");
    if (nb == BillTyep.GSTBill) {
      isgstBill.value = true;
      update();
    } else {
      isgstBill.value = false;
      update();
    }
    selecteBillTyep.value = nb;
    print("bill tyep:-${selecteBillTyep.value}-------${isgstBill}");
    getSubToal();
  }

  bool isChecked = true;
  RxBool isAliment = true.obs;
  bool? checkboxValue;
  String? selectewarenty;

  List<String> selectewarentyTyep = ['KM', 'Month'];
  double subtotal = 0.0;
  double totalGst = 0.0;

  //
  final billNoController = TextEditingController();
  final dateController = TextEditingController();
  final discountController = TextEditingController();
  final carNoController = TextEditingController();
  final customerNameController = TextEditingController();
  final tyreSizeController = TextEditingController();
  final carNameController = TextEditingController();
  final kmController = TextEditingController();
  final warentyvalueController = TextEditingController();
  final aligmnetPrice = TextEditingController();
  final tyerCompanyController = TextEditingController();
  final tyerPriceController = TextEditingController();
  List<TextEditingController>? priceControllers = [];
  int? tyre_CompanyId;
  int? tyre_SizeId;
  DateTime? selectedDate;

  //car name id
  int? selectCarID;
  double grandTotal = 0.0;
  double gstAmount = 0.0;
  double amount = 0.0;
  double aligement = 0.0;

  final formKey = GlobalKey<FormState>();

  final count = 0.obs;
  RxBool isShow = false.obs;
  RxBool isgstBill = true.obs;
  List<String> dropdownOptions = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];
  final List<BillingItem> billingItems = [];

  setDefaultDate() {
    dateController.text =
        dateController.text = DateFormat("dd-MM-yyyy").format(DateTime.now());
  }

  Future<void> selectDate() async {
    print("calllll--9");
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2023, 8),
        lastDate: DateTime(2101),
        initialDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = DateFormat("dd-MM-yyyy")
          .format(DateTime.parse(selectedDate.toString()));
      print("slected date--${selectedDate}");
    }
  }

  getSubToal() {
    print("get aligemnt isChecked::-${isChecked}");

    if (aligmnetPrice.text != null && aligmnetPrice.text != '') {
      aligement = double.parse(aligmnetPrice.text);
    }

    print("get aligemnt::-${aligement}");
    var billAmount = aligement + calculateTotal();
    double? ind = 0.0;
    if (discountController.text != null && discountController.text != '') {
      ind = double.parse(discountController.text);
    }

    subtotal = billAmount - ind;
    print("get aligemnt::-${subtotal}");
    if (isgstBill.value == true) {
      totalGst = (subtotal * 18) / 100;
    } else {
      totalGst = 0.0;
    }
    update();
    grandTotal = subtotal + totalGst;
    print("gst:::${totalGst}");
  }

  double calculateTotal() {
    return billingItems.fold(
        0, (total, item) => total + (item.quantity * item.price));
  }

  addPrice(double price, String name) {
    print("callllllll funcation");
    print("name::---name--${name}");
    print("pirce::---pirce--${price}");
    billingItems.forEach((element) {
      if (element.itemName == name) {
        print("helloo:: element.price--${element.quantity}");
        print("helloo:: element.price--${price}");
        element.price = price;

        calculateTotal();

        print("helloo:: element.price--${element.price}");
        getSubToal();
        update();
        update();
      }
    });
    getSubToal();
    update();
    print("print after price add::---***");
    billingItems.forEach((element) {
      print("print after price add::element.itemName--***${element.itemName}");
      print("print after price add::rate---***${element.rate}");
      print("print after price add::--quantity-***${element.quantity}");
      print("print after price add::---***");
    });
  }

  var unchipValue;
  var untyid;

  unFoucsTotal(String chipValue, int tyre_brand_id) {
    addChip(chipValue, tyre_brand_id);
  }

  void addChip(String chipValue, int tyre_brand_id) {
    selectedChips.add(chipValue);
    update();
    bool foundMatchingItem = false;

    for (var item in billingItems) {
      if (item.itemName == chipValue) {
        print("adddddd chippp-----found");
        item.quantity = item.quantity + 1;
        foundMatchingItem = true;
        update();
        break; // Exit the loop since the item was found and updated
      }
    }

    if (!foundMatchingItem) {
      print("adddddd chippp-----not found");
      final newItem = BillingItem(
        index: billingItems.length + 1,
        itemName: chipValue,
        itemID: tyre_brand_id,
        price: 0,
        rate: 0,
        quantity: 1,
      );
      billingItems.add(newItem);

      print("adddddd chippp-----not found---${billingItems.length}");

      update();
    }

    update();
  }

  Map<String, TextEditingController> _controllerMap = Map();

  TextEditingController getControllerOf(String name) {
    print("nam,eeeeee---------${name}");
    var controller = _controllerMap[name];
    if (controller == null) {
      controller = TextEditingController(text: name);
      _controllerMap[name] = controller;
      _controllerMap[name]?.text = 0.toString();
    }
    return controller;
  }

  void removeChip(
    String chipValue,
  ) {
    for (var item in billingItems) {
      if (item.itemName == chipValue) {
        if (item.quantity != 1) {
          item.quantity = item.quantity - 1;
          update();
        } else {
          billingItems
              .removeWhere((element) => element.itemName == item.itemName);
          print("item.indexitem.itemName----${item.index}");

          _controllerMap[item.index]?.text = '0';
          _controllerMap[item.index]?.dispose();

          billingItems.removeWhere((item) => item.itemName == chipValue);

          update();
        }
        getSubToal();

        break; // Exit the loop since the item was found and updated
      }
    }

    selectedChips.remove(chipValue);

    update();
  }

  // getInvoiceNumber() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var authToken = prefs.getString(kAccessToken);
  //
  //   var invoice = baseurl + getInvoiceNo + "/1"; //make dynamic
  //   var response =
  //   await APIServices.getMethodWithHeaderDio(invoice, token: authToken);
  //   print("object-----${response.data['data']['invoice_number']}");
  //   billNoController.text = response.data['data']['invoice_number'].toString();
  //   update();
  // }

  List<String> selectedChips = [];

  SubmitBill() async {
    print("billllll saveee----");

    var itemsList = [];

    for (var i = 0; i < billingItems.length; i++) {
      for (var a = 0; a < billingItems[i].quantity; a++) {
        var item = {
          "_invoice_item_id": 0,
          "item_type": 1,
          "tyre_brand_id": billingItems[i].itemID,
          "price": billingItems[i].price,
          "total": billingItems[i].price
        };
        itemsList.add(item);
      }
    }
    if (discountController.text != null && discountController.text != '') {
      var ind = double.parse(discountController.text);
      var item = {
        "_invoice_item_id": 0,
        "item_type": 3,
        "tyre_brand_id": 0,
        "price": ind,
        "total": ind
      };
      itemsList.add(item);
    }

    if (isChecked == true) {
      var ind = double.parse(aligmnetPrice.text);
      var item = {
        "_invoice_item_id": 0,
        "item_type": 2,
        "tyre_brand_id": 0,
        "price": ind,
        "total": ind
      };
      itemsList.add(item);
    }
    if (isgstBill.value == true) {
      var item = {
        "_invoice_item_id": 0,
        "item_type": 4,
        "tyre_brand_id": 0,
        "price": gstAmount,
        "total": gstAmount
      };
      itemsList.add(item);
    }

    logger.d("this new itme tyre_SizeIdtyre_SizeId::---${tyre_SizeId}");

    var date = DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(selectedDate ?? DateTime.now());
    print("yeeee date:-${date}");
    var data = {
      "invoice_id": user_id,
      "invoice_type": 1,
      "user_id": 0,
      "user_name": customerNameController.text,
      "invoice_no": int.parse(billNoController.text.toString()),
      "invoice_date": date,
      "car_no": carNoController.text,
      "is_gst": isgstBill.value == true ? 0 : 1,
      "is_alignment_balancing": isChecked == true ? 1 : 0,
      "tyre_type_id": int.parse(tyre_SizeId.toString())  ,
      "car_brand_id": selectCarID,
      "subtotal": subtotal,
      "final_total": grandTotal,
      "current_km": kmController.text,
      "warrenty_type": selectedwarentyType == 'Kilometer' ? 1 : 2,
      "warrenty_value": selectedwarentyType == 'Kilometer'
          ? int.parse(defaultKm)
          : int.parse(defaultMonth),
      "invoice_item": itemsList
    };
    logger.d(data);
    var creteInvoiceUrl = baseurl + creteInvoice;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(kAccessToken);
    var response =
        await APIServices.putWithDio(creteInvoiceUrl, data, token: authToken);
    logger.d("reponse::--${response}");

    //   print("reponse:222:--${response.data}");
    if (response.data['message'] == "Success.") {
      var  bottam = Get.put(
          BottamnavigationviewController());

      var home = Get.put(HomeviewController());
      var search = Get.put(SearchviewController());
      search.emptySearchdata();

      search.update();

      home.getDashBoardData();
      home.update();
      bottam.persistentTabController!.index=2;
      bottam.update();
      Get.back();
      Get.snackbar("Success", "Invoice create Successfully",
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    } else {
      Get.snackbar("Error", response.data['message'],
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    setDefaultDate();
    //getInvoiceNumber();
    getInvoiceData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  var userid;

  getInvoiceData() async {
    if(id !=null){
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(kAccessToken);

    var invoice = baseurl + getInvoiceDetails + "/$id"; //make dynamic

    var response =
        await APIServices.getMethodWithHeaderDio(invoice, token: authToken);
    final invoicedata = response.data;
    logger.d("yeeeeeee-----${invoicedata['data']['invoiceData']}");
    var a = InvoiceData.fromJson(invoicedata['data']['invoiceData']);
    billNoController.text = a.invoiceId.toString();
    carNoController.text = a.carNo.toString();
    customerNameController.text = a.userName.toString();
    user_id = a.userId;
    tyre_SizeId=a.tyreType!.tyreTypeId;
    carNameController.text =a.carBrand!.title.toString();
    selectCarID = a.carBrandId!.toInt();
    tyreSizeController.text = a.tyreType!.title.toString();
    kmController.text = a.currentKm.toString();
    selectedwarentyType = a.warrentyType == 1 ? "Kilometer" : "Months";
    if (a.warrentyType == 1) {
      defaultKm = a.warrentyValue.toString();
    } else {
      defaultMonth = a.warrentyValue.toString();
    }

    for (var b = 0; b < a.innerInvoice!.length; b++) {
      if (a.innerInvoice?[b].itemType == 1) {
        addChip(a.innerInvoice![b].tyreBrand!.title.toString(), 0);
         await addPrice(a.innerInvoice![b].price!.toDouble(), a.innerInvoice![b].tyreBrand!.title.toString());

        bool foundMatchingItem = false;
        print("in-----22222--55");


        for (var item in billingItems) {

          if (item.itemName == a.innerInvoice![b].tyreBrand!.title.toString()) {
            double.parse(
                getControllerOf(
                    item.index
                    .toString())
                .text= a.innerInvoice![b].price.toString());

            print("adddddd chippp-----found");
          //  item.quantity = item.quantity + 1;

            foundMatchingItem = true;
            update();
            break; // Exit the loop since the item was found and updated
          }
        }

        if (!foundMatchingItem) {
          final billingItem = BillingItem(
              itemID: a.innerInvoice![b].tyreBrandId!.toInt(),
              rate: a.innerInvoice![b].price!.toDouble(),
              index: 1,
              itemName: a.innerInvoice![b].tyreBrand!.title.toString(),
              price: a.innerInvoice![b].price!.toDouble(),
              quantity: 0);
          billingItems.add(billingItem);

          print("adddddd chippp-----not found---${billingItems.length}");

          update();
        }


        update();
      } else if (a.innerInvoice?[b].itemType == 2) {
        aligmnetPrice.text = a.innerInvoice![b].price.toString();
      }
    }

    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}}
