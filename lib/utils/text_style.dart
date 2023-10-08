import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freelancing/utils/colors_const.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle billTextStyle(){
  return GoogleFonts.dmSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ConstColor.rbillTextColor
  );
}