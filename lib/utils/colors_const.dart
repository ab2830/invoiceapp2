import 'dart:ui';

import 'package:flutter/material.dart';

class ConstColor {


  static Color appPrimary1 = fromHex('#48B1BF');
  static Color appPrimary2 = fromHex('#008DD4');
  static Color dividerColor = fromHex('#DFEBF1');
  static Color  appBgColor = fromHex('#EDF1F3');
  static Color  borderColor = fromHex('#DCE4E7');
  static Color  hintTextColor = fromHex('#839FAC');
  static Color  rbillColor = fromHex('#EDF1F3');
  static Color  rbillTextColor = fromHex('#33444C');
  static Color  invoicebox = fromHex('  #008DD433');


  static Color  black=Colors.black;
  static Color  white=Colors.white;




  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
