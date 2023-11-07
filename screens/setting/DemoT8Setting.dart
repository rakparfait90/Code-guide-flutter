import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T8Colors.dart';
import '../utils/T8Constant.dart';
import '../utils/T8Strings.dart';

class DemoT8Setting extends StatefulWidget {
  static String tag = '/DemoT8Setting';

  @override
  DemoT8SettingState createState() => DemoT8SettingState();
}

class DemoT8SettingState extends State<DemoT8Setting> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8),
                    Container(
                      decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, radius: 8, showShadow: true),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DemoT8SettingOptionPattern1(Icons.person, t8_lbl_edit_profile, t8_username),
                          DemoT8SettingOptionPattern1(Icons.email, t8_lbl_email, t8_email),
                          DemoT8SettingOptionPattern1(Icons.vpn_key, t8_lbl_password, t8_sub_info_password),
                        ],
                      ),
                    ),
                    Container(
                      decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, radius: 8, showShadow: true),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          DemoT8SettingOptionPattern2(Icons.star, t8_lbl_scoreboard),
                          DemoT8SettingOptionPattern2(Icons.add_box, t8_lbl_new_course),
                          DemoT8SettingOptionPattern2(Icons.notifications, t8_lbl_study_reminder),
                        ],
                      ),
                    ),
                    Container(
                      decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, radius: 8, showShadow: true),
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          DemoT8SettingOptionPattern3(Icons.help, t8_lbl_help),
                          DemoT8SettingOptionPattern3(Icons.security, t8_lbl_privacy),
                          DemoT8SettingOptionPattern3(Icons.chat_bubble, t8_lbl_contact_us),
                        ],
                      ),
                    ),
                    text(t8_lbl_logout, textColor: t8_colorPrimary, fontSize: textSizeLargeMedium, textAllCaps: true, fontFamily: fontBold)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget DemoT8SettingOptionPattern1(var settingIcon, var heading, var info) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(settingIcon, color: t8_white),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(heading, textColor: appStore.textPrimaryColor),
                text(info, textColor: appStore.textSecondaryColor, fontSize: textSizeSMedium),
              ],
            ),
          ],
        ),
        Icon(Icons.keyboard_arrow_right, color: appStore.iconColor)
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget DemoT8SettingOptionPattern2(var icon, var heading) {
  bool isSwitched1 = false;

  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(icon, color: t8_white),
            ),
            SizedBox(width: 16),
            text(heading, textColor: appStore.textPrimaryColor),
          ],
        ),
        Switch(
          value: isSwitched1,
          onChanged: (value) {
            isSwitched1 = value;
          },
          activeTrackColor: t8_colorPrimary,
          activeColor: t8_view_color,
        )
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget DemoT8SettingOptionPattern3(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: t8_color_setting),
              width: 45,
              height: 45,
              padding: EdgeInsets.all(4),
              child: Icon(icon, color: t8_white),
            ),
            SizedBox(width: 16),
            text(heading, textColor: appStore.textPrimaryColor),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: appStore.iconColor,
        )
      ],
    ),
  );
}
