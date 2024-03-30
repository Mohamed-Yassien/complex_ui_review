import 'package:complex_ui_review/widgets/app_colors.dart';
import 'package:flutter/material.dart';


enum TextStyleEnum {
  normal,
  title,
  caption,
}

class CustomText extends StatelessWidget {
  TextStyle getTextStyle(TextStyleEnum textStyleEnum,
      {Color? color,
      double? fontsize,
      String? fontFamily,
      TextOverflow? overflow,
      double? height,
      TextDecoration? decoration,
      FontWeight? weight}) {
    switch (textStyleEnum) {
      case TextStyleEnum.title:
        return TextStyle(
          fontSize: 18,
          color: AppColors.black,
          fontFamily: "Noto",
          height: 1.5,
          fontWeight: FontWeight.bold,
        ).copyWith(
            decoration: decoration,
            color: color ?? AppColors.black,
            fontWeight: weight,
            fontSize: fontsize,
            height: height,
            overflow: overflow ?? TextOverflow.visible,
            fontFamily: fontFamily ?? "FFShamelFamily");
      case TextStyleEnum.caption:
        return const TextStyle(
          fontSize: 13,
          color: Color(0xff8D8D8D),
          fontFamily: "Noto",
          height: 1.5,
          fontWeight: FontWeight.w300,
        ).copyWith(
            decoration: decoration,
            color: color ?? AppColors.black,
            fontWeight: weight,
            fontSize: fontsize,
            height: height,
            overflow: overflow ?? TextOverflow.visible,
            fontFamily: fontFamily ?? "Noto");

      default:
        return TextStyle(
                fontSize: 17,
                color: AppColors.black,
                fontFamily: "Noto",
                height: 1.5,
                fontWeight: FontWeight.w500)
            .copyWith(
                decoration: decoration,
                color: color ?? AppColors.black,
                fontWeight: weight,
                fontSize: fontsize,
                height: height,
                overflow: overflow ?? TextOverflow.visible,
                fontFamily: fontFamily ?? "Noto");
    }
  }

  const CustomText(
    this.text, {
    Key? key,
    this.textStyleEnum,
    this.color,
    this.height = 1.5,
    this.fontSize,
    this.weight,
    this.fontFamily,
    this.align,
    this.decoration,
    this.overflow,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final TextStyleEnum? textStyleEnum;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final String? fontFamily;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final TextAlign? align;
  final FontWeight? weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style: getTextStyle(
        textStyleEnum ?? TextStyleEnum.normal,
        color: color,
        height: height,
        fontsize: fontSize,
        fontFamily: fontFamily,
        overflow: overflow,
        decoration: decoration,
        weight: weight,
      ),
    );
  }
}
