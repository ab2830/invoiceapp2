import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invoicelist_controller.dart';

class InvoicelistView extends GetView<InvoicelistController> {
  const InvoicelistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InvoicelistView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InvoicelistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
