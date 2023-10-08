import 'package:freelancing/utils/api_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/model/dashboard_model.dart';
import '../../../../utils/network_utils.dart';

class HomeviewController extends GetxController {
  //TODO: Implement HomeviewController
  DashboardStat? dashboardStat;
  final count = 0.obs;

  @override
  void onInit() {
    getDashBoardData();
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
  DashboardStat? dashboardStats;

  getDashBoardData() async {
    var dashboard = baseurl + dashboardstats;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString(kAccessToken);
    var response =
        await APIServices.getMethodWithHeaderDio(dashboard, token: authToken);
    print("ths is dashboad response:--${response}");
    if (response.data['statusCode'] == 200) {
      print("object------------");
      dashboardStats = DashboardStat.fromJson(response.data['data']);
      update();
    }
  }
}
