import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationManager extends GetxController with CacheManager {
  var isLogged = false.obs;


  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() async {
    final token = await getToken();
    print("login status---");
    if (token != null && token != '') {
      isLogged.value = true;
    }
  }
}

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(CacheManagerKey.cacheToken.toString(), token ?? "");
    return true;
  }

  Future<String?> getToken() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString(CacheManagerKey.cacheToken.toString());
  }

  Future<void> removeToken() async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove(CacheManagerKey.cacheToken.toString());
  }
}

enum CacheManagerKey { cacheToken }
