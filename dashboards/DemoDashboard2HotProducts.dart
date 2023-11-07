import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'model/Db2Model.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard2HotProducts extends StatefulWidget {
  static String tag = '/DemoDashboard2HotProducts';
  @override
  DemoDashboard2HotProductsState createState() => DemoDashboard2HotProductsState();
}

const CURVE_HEIGHT = 100.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.8;
const fontMedium = 'Medium';

class DemoDashboard2HotProductsState extends State<DemoDashboard2HotProducts> {
  late List<Db2ShopModel> mListings1;

  @override
  void initState() {
    super.initState();
    mListings1 = db2getFeatured();
  }

  @override
  Widget build(BuildContext context) {
    Widget db2Label(var text) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text, style: primaryTextStyle(size: 20, color: db2_textColorPrimary, fontFamily: fontMedium)),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: db2_lbl_view_all, style: primaryTextStyle(size: 14, color: db2_textColorSecondary)),
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: db2_textColorSecondary,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    changeStatusColor(db2_colorSecondary);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    //Hot Products
                    db2Label(db2_lbl_hot_product),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mListings1.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Db2Product(mListings1[index], index);
                          }),
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}

// ignore: must_be_immutable
class Db2Product extends StatelessWidget {
  late Db2ShopModel model;

  Db2Product(Db2ShopModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(model.img, fit: BoxFit.cover, height: 170, width: MediaQuery.of(context).size.width),
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.name),
                Text(
                  "\$100",
                  style: primaryTextStyle(color: db2_textColorSecondary, fontFamily: fontMedium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

