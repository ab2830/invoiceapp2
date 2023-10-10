import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:freelancing/main.dart';
import 'package:share_plus/share_plus.dart';


import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../controllers/invoicepdf_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class InvoicepdfView extends GetView<InvoicepdfController> {
  const InvoicepdfView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginCon = Get.put(InvoicepdfController());
    return GetBuilder<InvoicepdfController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('invoiceView',
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: Colors.black)),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  // controller.searchController.clear();
                  // controller.update();
                  Get.back();
                },
                child: Icon(
                  FontAwesomeIcons.angleLeft,
                  color: Colors.black,
                )),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () async {
                    logger.d("-------------${loginCon.response}");
                   // final bytes = loginCon.response.bodyBytes;
                    await FlutterShare.shareFile(
                      title: 'Share PDF',
                      text: 'Sharing a PDF file from the web',
                      filePath: 'dummy.pdf',
                      fileType: 'application/pdf',

                    );

                    // final documentDirectory = (await getExternalStorageDirectory())?.path;
                    // File imgFile = File('$documentDirectory/flutter.png');
                    // imgFile.writeAsBytesSync(loginCon.response);
                    // await Share.shareFiles([imgFile.path ], text: 'Image Shared');
                    // // await WhatsappShare.shareFile(
                    // //   phone: "9662747949",
                    // //   filePath: ['$documentDirectory/flutter.png'],
                    // // );
                  },
                  child: Icon(
                    FontAwesomeIcons.shareNodes,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: SfPdfViewer.network(
            'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
          ),
        );
      }
    );
  }
}
