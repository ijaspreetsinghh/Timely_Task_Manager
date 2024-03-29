import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:timely/core/services/navigationService.dart';
import 'package:timely/core/viewmodel/fifthTab_viewModel.dart';
import 'package:timely/meta/view/Screens/MainAppPages/profileInformationPage.dart';
import 'package:timely/meta/widgets/components.dart';
import '../../../../main.dart';
import '../../../widgets/constants.dart';

class FifthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FifthTabViewModel>.reactive(
        onModelReady: (model) => model.initialize(),
        fireOnModelReadyOnce: true,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: kHPadding * 1.5, vertical: kVPadding * 2),
                  children: [
                    FormHeading(
                      title: 'Settings',
                      fontSize: 28,
                    ),
                    SizedBox(
                      height: kVPadding * 3,
                    ),
                    GestureDetector(
                      onTap: () => NavigationService.instance
                          .pushNamed(ProfileInformationPage.route),
                      child: Row(
                        children: [
                          Hero(
                            tag: 'Display Image',
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: kBlackTextColor.withOpacity(.03),
                              backgroundImage: NetworkImage(model.photoURL ??
                                  defaultProfilePictureLocation),
                            ),
                          ),
                          SizedBox(
                            width: kHPadding,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.displayName ?? 'NA',
                                  overflow: TextOverflow.ellipsis,
                                  style: kCircularStdText.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                                Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    model.email ?? 'NA',
                                    overflow: TextOverflow.ellipsis,
                                    style: kCircularStdText.copyWith(
                                        color: kBlackTextColor.withOpacity(.7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: kHPadding,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kBlackTextColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: kVPadding * 3,
                    ),
                    SettingsListTileOptions(
                      title: 'Help and Support',
                      onPressed: () =>
                          NavigationService.instance.showAlertWithOneButton(
                        title: 'Help centre',
                        content:
                            "For any assistance or support, please reach out to us via email 'jaspreet.codrity@gmail.com.'",
                        primaryActionTitle: 'Copy email',
                        primaryAction: () async {
                          await Clipboard.setData(ClipboardData(
                                  text: 'jaspreet.codrity@gmail.com'))
                              .then((value) async {
                            NavigationService.instance.goBack();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Email copied',
                                  style: kCircularStdText.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                duration: Duration(milliseconds: 500),
                              ),
                            );
                          });
                        },
                      ),
                      imagePath: 'assets/images/help.png',
                    ),
                    Divider(),
                    SettingsListTileOptions(
                      title: 'About Timely',
                      onPressed: () =>
                          NavigationService.instance.showAboutAppDialog(),
                      imagePath: 'assets/images/info.png',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => FifthTabViewModel());
  }
}

class SettingsListTileOptions extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function onPressed;
  SettingsListTileOptions(
      {@required this.imagePath,
      @required this.title,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.white,
      selectedTileColor: Colors.white,
      hoverColor: Colors.white,
      tileColor: Colors.white,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      leading: Image(
        height: 26,
        image: AssetImage(
          imagePath,
        ),
      ),
      title: Text(
        title,
        style: kCircularStdText.copyWith(
            fontSize: 16, fontWeight: FontWeight.w600),
      ),
      // trailing: Icon(
      //   Icons.arrow_forward_ios_rounded,
      //   size: 20,
      //   color: kBlackTextColor.withOpacity(.7),
      // ),
      onTap: onPressed,
    );
  }
}
