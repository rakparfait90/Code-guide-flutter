import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'model/Db4Model.dart';
import 'utils/Db4SliderWidget.dart';
import 'utils/DbColors.dart';
import 'utils/DbDataGenerator.dart';
import 'utils/DbStrings.dart';

class DemoDashboard4Body extends StatefulWidget {
  static String tag = '/DemoDashboard4Body';

  @override
  DemoDashboard4BodyState createState() => DemoDashboard4BodyState();
}
const fontMedium = 'Medium';
class DemoDashboard4BodyState extends State<DemoDashboard4Body> {
  bool passwordVisible = false;
  bool isRemember = false;
  var currentIndexPage = 0;
  List<Db4Category>? mFavouriteList;
  List<Db4Slider>? mSliderList;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    mFavouriteList = db5GetCategoryItems();
    mSliderList = db4GetSliders();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db4_colorPrimary);

    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: db4_colorPrimary,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //Header
            Container(
              height: 70,
              margin: EdgeInsets.all(16),

            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                padding: EdgeInsets.only(top: 28),
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(color: db4_LayoutBackgroundWhite, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    //Body
                    Db4SliderWidget(mSliderList),
                    SizedBox(height: 20),
                    //Footer
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Db4GridListing(mFavouriteList, false),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Text(""),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}


// ignore: must_be_immutable
class Db4SliderWidget extends StatelessWidget {
  List<Db4Slider>? mSliderList;

  Db4SliderWidget(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    final Size cardSize = Size(width, width / 1.8);

    return Db4CarouselSlider(
      viewportFraction: 0.9,
      height: cardSize.height,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList!.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: cardSize.height,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(slider.image, fit: BoxFit.fill, width: MediaQuery.of(context).size.width, height: cardSize.height),
                  Padding(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(db4_avl_balance, style: primaryTextStyle(color: white, size: 16)),
                          Text(slider.balance, style: boldTextStyle(color: white, size: 24, fontFamily: 'Bold'))
                        ],
                      ),
                      padding: EdgeInsets.all(14)),
                  Container(
                    padding: EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[Text(db4_account_number, style: primaryTextStyle(color: white, size: 16)), Text(slider.accountNo, style: secondaryTextStyle(color: white, size: 20))],
                          ),
                        ),
                        Text("VISA", style: boldTextStyle(color: white, size: 24, fontFamily: 'Bold'))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
class Db4GridListing extends StatelessWidget {
  List<Db4Category>? mFavouriteList;
  var isScrollable = false;

  Db4GridListing(this.mFavouriteList, this.isScrollable);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: isScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        itemCount: mFavouriteList!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: white, boxShadow: defaultBoxShadow(), borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: width / 7.5,
                    width: width / 7.5,
                    margin: EdgeInsets.only(bottom: 4, top: 8),
                    padding: EdgeInsets.all(width / 30),
                    decoration: BoxDecoration(color: mFavouriteList![index].color, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: SvgPicture.asset(
                      mFavouriteList![index].icon,
                      color: white,
                    ),
                  ),
                  Text(
                    mFavouriteList![index].name,
                    style: secondaryTextStyle(size: 14),
                  )
                ],
              ),
            ),
          );
        });
  }
}
