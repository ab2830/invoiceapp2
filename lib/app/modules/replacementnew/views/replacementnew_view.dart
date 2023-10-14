import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/replacementnew_controller.dart';

class ReplacementnewView extends GetView<ReplacementnewController> {
  const ReplacementnewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReplacementnewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReplacementnewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
