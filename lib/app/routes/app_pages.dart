import 'package:get/get.dart';

import '../modules/bottamnavigationview/bindings/bottamnavigationview_binding.dart';
import '../modules/bottamnavigationview/views/bottamnavigationview_view.dart';
import '../modules/checkconnection/bindings/checkconnection_binding.dart';
import '../modules/checkconnection/views/checkconnection_view.dart';
import '../modules/companySelect/bindings/tyreselect_binding.dart';
import '../modules/companySelect/views/tyreselect_view.dart';
import '../modules/createbillview/bindings/createbillview_binding.dart';
import '../modules/createbillview/views/createbillview_view.dart';
import '../modules/editbill/bindings/editbill_binding.dart';
import '../modules/editbill/views/editbill_view.dart';
import '../modules/editbilldata/bindings/editbilldata_binding.dart';
import '../modules/editbilldata/views/editbilldata_view.dart';
import '../modules/edittyrebrand/bindings/edittyrebrand_binding.dart';
import '../modules/edittyrebrand/views/edittyrebrand_view.dart';
import '../modules/fillterdashboard/bindings/fillterdashboard_binding.dart';
import '../modules/fillterdashboard/views/fillterdashboard_view.dart';
import '../modules/homeview/bindings/homeview_binding.dart';
import '../modules/homeview/views/homeview_view.dart';
import '../modules/invoicelist/bindings/invoicelist_binding.dart';
import '../modules/invoicelist/views/invoicelist_view.dart';
import '../modules/invoicepdf/bindings/invoicepdf_binding.dart';
import '../modules/invoicepdf/views/invoicepdf_view.dart';
import '../modules/loginview/bindings/loginview_binding.dart';
import '../modules/loginview/views/loginview_view.dart';
import '../modules/otpverificationview/bindings/otpverificationview_binding.dart';
import '../modules/otpverificationview/views/otpverificationview_view.dart';
import '../modules/profileview/bindings/profileview_binding.dart';
import '../modules/profileview/views/profileview_view.dart';
import '../modules/replacementbill/bindings/replacementbill_binding.dart';
import '../modules/replacementbill/views/replacementbill_view.dart';
import '../modules/searchview/bindings/searchview_binding.dart';
import '../modules/searchview/views/searchview_view.dart';
import '../modules/selectcar/bindings/selectcar_binding.dart';
import '../modules/selectcar/views/selectcar_view.dart';
import '../modules/splashview/bindings/splashview_binding.dart';
import '../modules/splashview/views/splashview_view.dart';
import '../modules/tyresize/bindings/tyresize_binding.dart';
import '../modules/tyresize/views/tyresize_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHVIEW;

  static final routes = [
    GetPage(
      name: _Paths.SPLASHVIEW,
      page: () => SplashviewView(),
      binding: SplashviewBinding(),
    ),
    GetPage(
      name: _Paths.LOGINVIEW,
      page: () => LoginviewView(),
      binding: LoginviewBinding(),
    ),
    GetPage(
      name: _Paths.OTPVERIFICATIONVIEW,
      page: () => const OtpverificationviewView(),
      binding: OtpverificationviewBinding(),
    ),
    GetPage(
      name: _Paths.BOTTAMNAVIGATIONVIEW,
      page: () => BottamnavigationviewView(),
      binding: BottamnavigationviewBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEVIEW,
      page: () => const ProfileviewView(),
      binding: ProfileviewBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHVIEW,
      page: () => SearchviewView(),
      binding: SearchviewBinding(),
    ),
    GetPage(
      name: _Paths.HOMEVIEW,
      page: () => HomeviewView(),
      binding: HomeviewBinding(),
    ),
    GetPage(
      name: _Paths.CREATEBILLVIEW,
      page: () => CreatebillviewView(),
      binding: CreatebillviewBinding(),
    ),
    GetPage(
      name: _Paths.REPLACEMENTBILL,
      page: () => const ReplacementbillView(),
      binding: ReplacementbillBinding(),
    ),
    GetPage(
      name: _Paths.SELECTCAR,
      page: () => SelectcarView(),
      binding: SelectcarBinding(),
    ),
    GetPage(
      name: _Paths.TYRESELECT,
      page: () => CompanySelecation(),
      binding: TyreselectBinding(),
    ),
    GetPage(
      name: _Paths.TYRESIZE,
      page: () => TyresizeView(),
      binding: TyresizeBinding(),
    ),
    GetPage(
      name: _Paths.INVOICELIST,
      page: () => const InvoicelistView(),
      binding: InvoicelistBinding(),
    ),
    GetPage(
      name: _Paths.CHECKCONNECTION,
      page: () => const CheckconnectionView(),
      binding: CheckconnectionBinding(),
    ),
    GetPage(
      name: _Paths.EDITBILL,
      page: () => const EditbillView(),
      binding: EditbillBinding(),
    ),
    GetPage(
      name: _Paths.EDITTYREBRAND,
      page: () => EdittyrebrandView(),
      binding: EdittyrebrandBinding(),
    ),
    GetPage(
      name: _Paths.EDITBILLDATA,
      page: () => const EditbilldataView(),
      binding: EditbilldataBinding(),
    ),
    GetPage(
      name: _Paths.INVOICEPDF,
      page: () => const InvoicepdfView(),
      binding: InvoicepdfBinding(),
    ),
    GetPage(
      name: _Paths.FILLTERDASHBOARD,
      page: () =>  FillterdashboardView(),
      binding: FillterdashboardBinding(),
    ),
  ];
}
