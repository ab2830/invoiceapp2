import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profileview_controller.dart';

class ProfileviewView extends GetView<ProfileviewController> {
  const ProfileviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
