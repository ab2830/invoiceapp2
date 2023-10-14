import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:freelancing/app/modules/otpverificationview/controllers/otpverificationview_controller.dart';
import 'package:freelancing/utils/model/login_response_model.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/api_services.dart';
import '../../../../utils/network_utils.dart';
import '../../bottamnavigationview/views/bottamnavigationview_view.dart';
import '../../otpverificationview/views/otpverificationview_view.dart';
import 'auth_manger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginviewController extends GetxController {
  //TODO: Implement LoginviewController

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFouce = FocusNode();
  final emailFouce = FocusNode();
  final loginFormKey = GlobalKey<FormState>();
  LoginResponse? loginResponse;
  final count = 0.obs;

  String? buildNumber;
  String? version;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    print("object----${_packageInfo.buildNumber}");
    print("object-ver---${_packageInfo.version}");
  }
  String? verificationId;

  callLogInApi() async {

    final prefs = await SharedPreferences.getInstance();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print("android info::${androidInfo.model}");

    print(deviceInfo.androidInfo);
    var loginUrl = baseurl + login;
    var data = {
      "device_info": {
        "appBuildNumber": _packageInfo.buildNumber,
        "appVersion": _packageInfo.version,
        "deviceId": androidInfo.model.toString(),
        "isLocationEnabled": true,
        "isTablet": false,
        "model": androidInfo.model.toString(),
        "systemName": "android",
        "systemVersion": androidInfo.version.release.toString(),
        "uniqueId": androidInfo.id.toString()
      },
      "device_token": "",
      "is_platform": 1,
      "phone_number": "919558181686",
      "password": "123456"
    };

    print("urllll---$loginUrl");
    print("urllll---$data");

    var finaldata = await APIServices.postLogin(loginUrl, data);

    if (finaldata.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(finaldata.data);
      prefs.setString(kUserId, loginResponse!.data!.user!.userId.toString());
      prefs.setString(kPhone_numberPrefs,
          loginResponse!.data!.user!.phoneNumber.toString());
      prefs.setString(
          kFirstNamePrefs, loginResponse!.data!.user!.firstName.toString());
      prefs.setString(
          kLastNamePrefs, loginResponse!.data!.user!.lastName.toString());
      prefs.setString(kUserRole, loginResponse!.data!.user!.role.toString());

      prefs.setString(
          kprofileImg, loginResponse!.data!.user!.profileImage.toString());

      prefs.setString(
          kEmailPrefs, loginResponse!.data!.user!.emailAddress.toString());

      prefs.setString(kAccessToken, loginResponse!.data!.token.toString());

      print("loginResponse-${loginResponse!.data}");
      print("logintoken:---${loginResponse!.data!.token.toString()}");
     //Get.offAll(BottamnavigationviewView());
     //  var a=Get.put(OtpverificationviewController());
     //  a.usernumber=loginResponse!.data!.user!.phoneNumber.toString();
     //  a.update();

      Get.to(OtpverificationviewView(),arguments: loginResponse!.data!.user!.phoneNumber);
      Get.snackbar(
          "Sucess",
          "Login Sucessfully",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white
      );
    }else{
        Get.snackbar(
          "Error",
          "Please enter valid credentials",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white
        );
    }
  }
  //
  // Future<Null> handleSignIn({AuthCredential? authCredential}) async {
  //
  //   var phoneNo = (phoneCode! + _phoneNo.text).trim();
  //
  //   try {
  //     AuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId!, smsCode: _code);
  //
  //     UserCredential firebaseUser =
  //     await firebaseAuth.signInWithCredential(credential);
  //
  //     // ignore: unnecessary_null_comparison
  //     if (firebaseUser != null) {
  //       // Check is already sign up
  //       final QuerySnapshot result = await FirebaseFirestore.instance
  //           .collection(DbPaths.collectionusers)
  //           .where(Dbkeys.id, isEqualTo: firebaseUser.user!.uid)
  //           .get();
  //       final List documents = result.docs;
  //       final pair = await e2ee.X25519().generateKeyPair();
  //
  //       if (documents.length == 0) {
  //         String? fcmTokenn = await FirebaseMessaging.instance.getToken();
  //         if (fcmTokenn != null) {
  //           await storage.write(
  //               key: Dbkeys.privateKey, value: pair.secretKey.toBase64());
  //           // Update data to server if new user
  //           await FirebaseFirestore.instance
  //               .collection(DbPaths.collectionusers)
  //               .doc(phoneNo)
  //               .set({
  //             Dbkeys.publicKey: pair.publicKey.toBase64(),
  //             Dbkeys.privateKey: pair.secretKey.toBase64(),
  //             Dbkeys.countryCode: phoneCode,
  //             Dbkeys.nickname: _name.text.trim(),
  //             Dbkeys.photoUrl: firebaseUser.user!.photoURL ?? '',
  //             Dbkeys.id: firebaseUser.user!.uid,
  //             Dbkeys.phone: phoneNo,
  //             Dbkeys.phoneRaw: _phoneNo.text,
  //             Dbkeys.authenticationType: AuthenticationType.passcode.index,
  //             Dbkeys.aboutMe: '',
  //             //---Additional fields added for Admin app compatible----
  //             Dbkeys.accountstatus:
  //             widget.isaccountapprovalbyadminneeded == true
  //                 ? Dbkeys.sTATUSpending
  //                 : Dbkeys.sTATUSallowed,
  //             Dbkeys.actionmessage: widget.accountApprovalMessage,
  //             Dbkeys.lastLogin: DateTime.now().millisecondsSinceEpoch,
  //             Dbkeys.joinedOn: DateTime.now().millisecondsSinceEpoch,
  //             Dbkeys.searchKey: _name.text.trim().substring(0, 1).toUpperCase(),
  //             Dbkeys.videoCallMade: 0,
  //             Dbkeys.videoCallRecieved: 0,
  //             Dbkeys.audioCallMade: 0,
  //             Dbkeys.groupsCreated: 0,
  //             Dbkeys.blockeduserslist: [],
  //             Dbkeys.audioCallRecieved: 0,
  //             Dbkeys.mssgSent: 0,
  //             Dbkeys.deviceDetails: mapDeviceInfo,
  //             Dbkeys.currentDeviceID: deviceid,
  //             Dbkeys.phonenumbervariants: phoneNumberVariantsList(
  //                 countrycode: phoneCode, phonenumber: _phoneNo.text)
  //           }, SetOptions(merge: true));
  //           currentUser = firebaseUser.user;
  //           await FirebaseFirestore.instance
  //               .collection(DbPaths.collectiondashboard)
  //               .doc(DbPaths.docuserscount)
  //               .set(
  //               widget.isaccountapprovalbyadminneeded == false
  //                   ? {
  //                 Dbkeys.totalapprovedusers: FieldValue.increment(1),
  //               }
  //                   : {
  //                 Dbkeys.totalpendingusers: FieldValue.increment(1),
  //               },
  //               SetOptions(merge: true));
  //
  //           await FirebaseFirestore.instance
  //               .collection(DbPaths.collectioncountrywiseData)
  //               .doc(phoneCode)
  //               .set({
  //             Dbkeys.totalusers: FieldValue.increment(1),
  //           }, SetOptions(merge: true));
  //
  //           await FirebaseFirestore.instance
  //               .collection(DbPaths.collectionnotifications)
  //               .doc(DbPaths.adminnotifications)
  //               .update({
  //             Dbkeys.nOTIFICATIONxxaction: 'PUSH',
  //             Dbkeys.nOTIFICATIONxxdesc: widget
  //                 .isaccountapprovalbyadminneeded ==
  //                 true
  //                 ? '${_name.text.trim()} has Joined $Appname. APPROVE the user account. You can view the user profile from All Users List.'
  //                 : '${_name.text.trim()} has Joined $Appname. You can view the user profile from All Users List.',
  //             Dbkeys.nOTIFICATIONxxtitle: 'New User Joined',
  //             Dbkeys.nOTIFICATIONxximageurl: null,
  //             Dbkeys.nOTIFICATIONxxlastupdate: DateTime.now(),
  //             'list': FieldValue.arrayUnion([
  //               {
  //                 Dbkeys.docid:
  //                 DateTime.now().millisecondsSinceEpoch.toString(),
  //                 Dbkeys.nOTIFICATIONxxdesc: widget
  //                     .isaccountapprovalbyadminneeded ==
  //                     true
  //                     ? '${_name.text.trim()} has Joined $Appname. APPROVE the user account. You can view the user profile from All Users List.'
  //                     : '${_name.text.trim()} has Joined $Appname. You can view the user profile from All Users List.',
  //                 Dbkeys.nOTIFICATIONxxtitle: 'New User Joined',
  //                 Dbkeys.nOTIFICATIONxximageurl: null,
  //                 Dbkeys.nOTIFICATIONxxlastupdate: DateTime.now(),
  //                 Dbkeys.nOTIFICATIONxxauthor:
  //                 currentUser!.uid + 'XXX' + 'userapp',
  //               }
  //             ])
  //           });
  //
  //           // Write data to local
  //
  //           await widget.prefs.setString(Dbkeys.id, currentUser!.uid);
  //           await widget.prefs.setString(Dbkeys.nickname, _name.text.trim());
  //           await widget.prefs
  //               .setString(Dbkeys.photoUrl, currentUser!.photoURL ?? '');
  //           await widget.prefs.setString(Dbkeys.phone, phoneNo);
  //           await widget.prefs.setString(Dbkeys.countryCode, phoneCode!);
  //           await FirebaseFirestore.instance
  //               .collection(DbPaths.collectionusers)
  //               .doc(phoneNo)
  //               .set({
  //             Dbkeys.notificationTokens: [fcmTokenn]
  //           }, SetOptions(merge: true));
  //           unawaited(widget.prefs.setBool(Dbkeys.isTokenGenerated, true));
  //           await widget.prefs.setString(Dbkeys.isSecuritySetupDone, phoneNo);
  //           await subscribeToNotification(phoneNo, true);
  //           unawaited(Navigator.pushReplacement(
  //               this.context,
  //               MaterialPageRoute(
  //                   builder: (newContext) => Homepage(
  //                     doc: widget.doc,
  //                     currentUserNo: phoneNo,
  //                     prefs: widget.prefs,
  //                   ))));
  //         } else {
  //           unawaited(Navigator.pushReplacement(
  //               this.context,
  //               new MaterialPageRoute(
  //                   builder: (context) => FiberchatWrapper())));
  //           Fiberchat.toast(getTranslated(this.context, 'failedtologin'));
  //         }
  //       } else {
  //         String? fcmToken = await FirebaseMessaging.instance.getToken();
  //         if (fcmToken != null) {
  //           await storage.write(
  //               key: Dbkeys.privateKey, value: documents[0][Dbkeys.privateKey]);
  //
  //           await FirebaseFirestore.instance
  //               .collection(DbPaths.collectionusers)
  //               .doc(phoneNo)
  //               .update(
  //             !documents[0].data().containsKey(Dbkeys.deviceDetails)
  //                 ? {
  //               Dbkeys.authenticationType:
  //               AuthenticationType.passcode.index,
  //               Dbkeys.accountstatus:
  //               widget.isaccountapprovalbyadminneeded == true
  //                   ? Dbkeys.sTATUSpending
  //                   : Dbkeys.sTATUSallowed,
  //               Dbkeys.actionmessage: widget.accountApprovalMessage,
  //               Dbkeys.lastLogin:
  //               DateTime.now().millisecondsSinceEpoch,
  //               Dbkeys.joinedOn:
  //               documents[0].data()![Dbkeys.lastSeen] != true
  //                   ? documents[0].data()![Dbkeys.lastSeen]
  //                   : DateTime.now().millisecondsSinceEpoch,
  //               Dbkeys.nickname: _name.text.trim(),
  //               Dbkeys.searchKey:
  //               _name.text.trim().substring(0, 1).toUpperCase(),
  //               Dbkeys.videoCallMade: 0,
  //               Dbkeys.videoCallRecieved: 0,
  //               Dbkeys.audioCallMade: 0,
  //               Dbkeys.audioCallRecieved: 0,
  //               Dbkeys.mssgSent: 0,
  //               Dbkeys.deviceDetails: mapDeviceInfo,
  //               Dbkeys.currentDeviceID: deviceid,
  //               Dbkeys.phonenumbervariants: phoneNumberVariantsList(
  //                   countrycode:
  //                   documents[0].data()![Dbkeys.countryCode],
  //                   phonenumber:
  //                   documents[0].data()![Dbkeys.phoneRaw]),
  //               Dbkeys.notificationTokens: [fcmToken],
  //             }
  //                 : {
  //               Dbkeys.searchKey:
  //               _name.text.trim().substring(0, 1).toUpperCase(),
  //               Dbkeys.nickname: _name.text.trim(),
  //               Dbkeys.authenticationType:
  //               AuthenticationType.passcode.index,
  //               Dbkeys.lastLogin:
  //               DateTime.now().millisecondsSinceEpoch,
  //               Dbkeys.deviceDetails: mapDeviceInfo,
  //               Dbkeys.currentDeviceID: deviceid,
  //               Dbkeys.phonenumbervariants: phoneNumberVariantsList(
  //                   countrycode:
  //                   documents[0].data()![Dbkeys.countryCode],
  //                   phonenumber:
  //                   documents[0].data()![Dbkeys.phoneRaw]),
  //               Dbkeys.notificationTokens: [fcmToken],
  //             },
  //           );
  //           // Write data to local
  //           await widget.prefs.setString(Dbkeys.id, documents[0][Dbkeys.id]);
  //           await widget.prefs.setString(Dbkeys.nickname, _name.text.trim());
  //           await widget.prefs.setString(
  //               Dbkeys.photoUrl, documents[0][Dbkeys.photoUrl] ?? '');
  //           await widget.prefs
  //               .setString(Dbkeys.aboutMe, documents[0][Dbkeys.aboutMe] ?? '');
  //           await widget.prefs
  //               .setString(Dbkeys.phone, documents[0][Dbkeys.phone]);
  //
  //           await subscribeToNotification(documents[0][Dbkeys.phone], false);
  //           unawaited(Navigator.pushReplacement(
  //               this.context,
  //               new MaterialPageRoute(
  //                   builder: (context) => FiberchatWrapper())));
  //           Fiberchat.toast(getTranslated(this.context, 'welcomeback'));
  //         } else {
  //           unawaited(Navigator.pushReplacement(
  //               this.context,
  //               new MaterialPageRoute(
  //                   builder: (context) => FiberchatWrapper())));
  //           Fiberchat.toast(getTranslated(this.context, 'failedlogin'));
  //         }
  //       }
  //     } else {
  //       Fiberchat.toast(getTranslated(this.context, 'failedlogin'));
  //     }
  //   } catch (e) {
  //     setState(() {
  //       if (currentPinAttemps >= 4) {
  //         currentStatus = LoginStatus.failure.index;
  //         // _phoneNo.clear();
  //         // _code = '';
  //         isCodeSent = false;
  //       }
  //
  //       isShowCompletedLoading = false;
  //       isVerifyingCode = false;
  //       currentPinAttemps++;
  //     });
  //     if (e.toString().contains('invalid') ||
  //         e.toString().contains('code') ||
  //         e.toString().contains('verification')) {
  //       Fiberchat.toast(getTranslated(this.context, 'makesureotp'));
  //     }
  //   }
  // }

    @override
    void onInit() {
      _initPackageInfo();
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
  }

