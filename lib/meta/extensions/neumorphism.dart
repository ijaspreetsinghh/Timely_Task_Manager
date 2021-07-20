import 'package:flutter/material.dart';
import 'package:timely/meta/widgets/constants.dart';

extension Neumorphism on Widget {
  addNeumorphism({
    double borderRadius = kBorderRadius,
    Offset offset = kOffset,
    double blurRadius = 30.0,
    Color topShadowColor = kTopShadowColor,
    Color bottomShadowColor = kBottomShadowColor,
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
                color: bottomShadowColor,
                blurRadius: blurRadius,
                offset: offset),
            BoxShadow(
                offset: Offset(-offset.dx, -offset.dx),
                blurRadius: blurRadius,
                color: topShadowColor)
          ]),
      child: this,
    );
  }
}
