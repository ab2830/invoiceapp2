import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/checkconnection_controller.dart';

class CheckconnectionView extends GetView<CheckconnectionController> {
  const CheckconnectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckconnectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CheckconnectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
