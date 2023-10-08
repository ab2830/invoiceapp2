import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../main.dart';
import 'colors_const.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {Key? key,
        this.onTap,

        this.controller,
        this.hintText,
        this.prefixIcon,
        this.suffixIcon,
        this.contentPadding,
        this.validator,
        this.keyboardType,
        this.maxLines = 1,
        this.onChanged,
        this.isReadOnly = false,
        this.textInputType,
        this.fillColor,
        this.maxLength,
        this.textCapitalization = TextCapitalization.sentences,
        this.textInputFormatter,
        this.lableText,
        this.obscureText,
        this.hintFontSize,
        this.hintFontWeight,
        this.fontColor,
        this.isMandatory = true})
      : super(key: key);

  final TextEditingController? controller;

  final Function(String)? onChanged;
  final Function ?onTap;

  final String? hintText;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final String? Function(String?)? validator;

  final EdgeInsetsGeometry? contentPadding;

  final Color? fontColor;

  final int? maxLines;

  final bool isReadOnly;

  final TextInputAction? textInputType;

  final TextInputType? keyboardType;

  final Color? fillColor;

  final int? maxLength;

  final TextCapitalization textCapitalization;

  final List<TextInputFormatter>? textInputFormatter;

  final String? lableText;

  final bool? obscureText;

  final bool isMandatory;

  final double? hintFontSize;

  final FontWeight? hintFontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style:   TextStyle(color: ConstColor.black),
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          onChanged: onChanged,
          readOnly: isReadOnly,
          maxLength: maxLength,
          textInputAction:
          textInputType == null ? TextInputAction.next : textInputType!,
          keyboardType: keyboardType ?? TextInputType.multiline,
          textCapitalization: textCapitalization,
          inputFormatters: textInputFormatter,
          obscureText: obscureText ?? false,
          onFieldSubmitted: (val) {},
          onSaved: (val) {},


          cursorColor: ConstColor.black,
          decoration: InputDecoration(

            filled: true,
            fillColor:Colors.transparent,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color:  ConstColor.borderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder:
            OutlineInputBorder(
                borderSide: BorderSide(
                    color : ConstColor.borderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            isDense: true,
            isCollapsed: false,
            contentPadding: contentPadding ?? EdgeInsets.zero,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: hintFontSize ?? 14,
                fontWeight: hintFontWeight ?? FontWeight.normal),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon ?? const SizedBox(),
            enabledBorder:
            OutlineInputBorder(
                borderSide: BorderSide(
                    color : ConstColor.borderColor,
                    width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            errorBorder:
            OutlineInputBorder(
                borderSide: BorderSide(
                    color : Colors.red,
                    width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder:
            OutlineInputBorder(
                borderSide: BorderSide(
                    color : Colors.red,
                    width: 1.5),
                borderRadius: BorderRadius.circular(10)),
            errorMaxLines: 2,
            errorStyle: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}


// dropDownDecoration(String hintText){
//   return      InputDecoration(
//     filled: true,
//     hintText: hintText,
//     hintStyle: TextStyle(
//         color:ConstColor.hintTextColor,
//         fontSize: 14),
//     fillColor:
//     Colors.grey  ,
//     focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//             color: ConstColor.black
//                 ),
//         borderRadius: BorderRadius.circular(10.r)),
//     border: OutlineInputBorder(
//         borderSide: BorderSide(
//             color: ConstColor.black
//                  ),
//         borderRadius: BorderRadius.circular(10.r)),
//
//     disabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//             color: darkMode.value
//                 ? ConstColor.black
//                 : ConstColor.brownColor),
//         borderRadius: BorderRadius.circular(10.r)),
//
//   );
// }

textFieldInputDacoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
        color:  Colors.grey,
        fontSize: 14),
    fillColor:  Colors.grey  ,
    filled: true,
    border: OutlineInputBorder(
        borderSide:
        BorderSide(
            color:  ConstColor.borderColor  ),
        borderRadius: BorderRadius.circular(10.r)),
    enabledBorder: OutlineInputBorder(
        borderSide:
        BorderSide(
            color:  ConstColor.borderColor  ),
        borderRadius: BorderRadius.circular(10.r)),
    focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(
            color:  ConstColor.borderColor  ),
        borderRadius: BorderRadius.circular(10.r)),
    isDense: true,
    isCollapsed: false,
    contentPadding: EdgeInsets.all(14.sp),
   // focusedErrorBorder:
    // OutlineInputBorder(
    //     borderSide: BorderSide(
    //         color: darkMode.value ? ConstColor.black : ConstColor.brownColor),
    //     borderRadius: BorderRadius.circular(10.r)),
    errorBorder:
    OutlineInputBorder(
        borderSide: BorderSide(
            color:  ConstColor.black ),
        borderRadius: BorderRadius.circular(10.r)),
    errorMaxLines: 2,
    errorStyle: const TextStyle(fontSize: 12),
  );
}
