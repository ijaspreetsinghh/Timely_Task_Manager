import 'package:flutter/material.dart';
import '../../constants.dart';

class FifthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0, backgroundColor: Colors.white,
            flexibleSpace: Container(
              color: kPrimaryColor,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHPadding * 1.5),
                    child: Text(
                      'Select day to views tasks ',
                      style: kCircularStdText.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: kVPadding * 2,
                  ),
                  SizedBox(
                    height: kVPadding,
                  ),
                ],
              ),
            ),
            // backgroundColor: kGreyWhite,
            toolbarHeight: 160,
            automaticallyImplyLeading: false,
            foregroundColor: Colors.red,
          ),
          backgroundColor: kPrimaryColor,
          body: Container(
            decoration: BoxDecoration(
                color: kGreyWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kBorderRadius * 2),
                    topRight: Radius.circular(kBorderRadius * 2))),
            padding: EdgeInsets.symmetric(
                vertical: kVPadding, horizontal: kHPadding * .7),
          ),
        ),
      ),
    );
  }
}
