import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  String svgicon;

  CustomSuffixIcon({required this.svgicon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: SvgPicture.asset(svgicon, color: Color(0xFF00b4d8)),
    );
  }
}