import 'package:flutter/material.dart';



import 'colors_const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        required this.onPressed,
        required this.title,
        this.maxHeight,
        this.minHeight,
        this.minWidth,
        this.maxWidth,
        this.color,
        this.textColor,
        this.fontWeight,
        this.fontSize,
        this.isOutLined = false})
      : super(key: key);

  final Function()? onPressed;
  final String title;
  final bool isOutLined;
  final double? minWidth;
  final double? maxWidth;
  final double? maxHeight;
  final double? minHeight;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        minWidth: minWidth ?? double.infinity,
        maxHeight: maxHeight ?? 80,
        minHeight: minHeight ?? 50,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isOutLined
              ? ConstColor.appPrimary1
              : color ?? ConstColor.appPrimary2),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: color ?? ConstColor.appPrimary1),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize ?? 16,
              color: textColor ??Colors.black,
              fontWeight: fontWeight ?? FontWeight.w300),
        ),
      ),
    );
  }
}

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton(
      {Key? key,
        required this.onPressed,
        required this.title,
        this.maxHeight,
        this.minHeight,
        this.minWidth,
        this.maxWidth,
        this.child,
        this.color,
        this.textColor,
        this.fontWeight,
        this.fontSize,
        this.backgroundColor,
        this.borderSideColor,
        this.isOutLined = false})
      : super(key: key);

  final Function()? onPressed;
  final String title;
  final bool isOutLined;
  final double? minWidth;
  final double? maxWidth;
  final double? maxHeight;
  final double? minHeight;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? child;
  final Color? backgroundColor;
  final Color? borderSideColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        minWidth: minWidth ?? 130,
        maxHeight: maxHeight ?? 50,
        minHeight: minHeight ?? 50,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(backgroundColor ?? Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor ?? ConstColor.appPrimary1),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              title,
              style: TextStyle(
                color: textColor ?? ConstColor.appPrimary1,
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.w300,
              ),
            ),
      ),
    );
  }
}

class CustomBorderIconButton extends StatelessWidget {
  const CustomBorderIconButton(
      {Key? key,
        required this.onPressed,
        required this.icon,
        this.maxHeight,
        this.minHeight,
        this.minWidth,
        this.maxWidth,
        this.child,
        this.color,
        this.iconColor,
        this.fontWeight,
        this.fontsize,
        this.backgroundColor,
        this.borderSideColor,
        this.isOutLined = false})
      : super(key: key);

  final Function()? onPressed;
  final IconData icon;
  final bool isOutLined;
  final double? minWidth;
  final double? maxWidth;
  final double? maxHeight;
  final double? minHeight;
  final Color? color;
  final Color? iconColor;
  final FontWeight? fontWeight;
  final double? fontsize;
  final Widget? child;
  final Color? backgroundColor;
  final Color? borderSideColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        minWidth: minWidth ?? 130,
        maxHeight: maxHeight ?? 50,
        minHeight: minHeight ?? 50,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(backgroundColor ?? Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor ?? ConstColor.appPrimary1),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child ??
            Icon(
              icon,
              color: iconColor,
            ),
      ),
    );
  }
}
