import 'package:barex_website/bloc/menu_item/menu_item_cubit.dart';
import 'package:barex_website/constants/size_config.dart';
import 'package:barex_website/constants/styles.dart';
import 'package:barex_website/widgets/top_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> topMenuItems = ['Home', 'About', 'Reach Us'];

  List<Widget> screens = [
    HomePage(),
    WhyBarEx(),
    AboutPage(),
    BarterWithUs(),
    ContactUs()
  ];

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  int getIndex(index) {
    if (index == 1)
      return 2;
    else if (index == 2)
      return 4;
    else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MenuItemCubit, MenuItemState>(
        listener: (context, state) {
          if (state is MenuItemSelected) {
            itemScrollController.scrollTo(
                index: getIndex(state.index),
                duration: Duration(milliseconds: 100));
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  itemCount: screens.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Color color =
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0);
                    return Container(
                        constraints: BoxConstraints(
                          minHeight: 600,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(color: primaryColor, width: 10),
                          left: index % 2 == 0
                              ? BorderSide(color: primaryColor, width: 10)
                              : BorderSide(),
                          right: index % 2 == 1
                              ? BorderSide(color: primaryColor, width: 10)
                              : BorderSide(),
                        )),

                        //color: color,
                        child: screens[index]);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SvgPicture.asset(
                      "logo.svg",
                      height: 100,
                    )),
                Expanded(child: NavigationBarWeb(topMenuItems)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

double fontSizeTitle = 24 * 3;
double fontSizePara = 32;
double reactSizePara = 16 * 2;
double horizontalSpacing = 20 * 5;
double titleSpacing = 12;
double spaceBetweenWidgets = 50;
String titleBar = "Bar";
String titleEx = "Ex";
double imageHeight = 450;
double imageWidth = 700;
double containerBorderRadius = 200;
double minParaWidth = 250;
double spaceBetweenBarEx = 8;
double spaceBetweenTitle = 16;

Widget getParaText(String para) => Container(
    constraints: BoxConstraints(maxWidth: 750),
    child: Text(
      para,
      style: TextStyle(
        fontSize: fontSizePara,
      ),
      softWrap: true,
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String para =
        "BarEx is a digital platform for exchange of businesses,where the businessman,vendors and buyers can come together on the same platform.";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: spaceBetweenTitle),
                child: Row(
                  children: [
                    Text(
                      titleBar,
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: spaceBetweenBarEx,
                    ),
                    Text(titleEx,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              getParaText(para)
            ],
          ),
          SizedBox(
            width: spaceBetweenWidgets,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(containerBorderRadius),
              child: (SvgPicture.asset("balls.svg", height: imageHeight))),
        ],
      ),
    );
  }
}

class WhyBarEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String why = "Why";
    String para =
        "Get your customised barter deals with BarEx.\nGrowing business on digital platform";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(containerBorderRadius),
              child: (SvgPicture.asset("key_hands.svg", height: imageHeight))),
          SizedBox(
            width: spaceBetweenWidgets,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: spaceBetweenTitle),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          why,
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: spaceBetweenBarEx,
                        ),
                        Text(
                          titleBar,
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(titleEx,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: fontSizeTitle,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),
              getParaText(para)
            ],
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String about = "About";
    String para =
        "We are money free system of exchange.\nExchange your properties, assets and services with us.";
    //String subtitle = "BUY! SELL! TRADE! BARTER!";
    List<String> subtitle = ["BUY", "SELL", "TRADE", "BARTER"];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: spaceBetweenTitle),
                child: Row(
                  children: [
                    Text(
                      about,
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: spaceBetweenBarEx,
                    ),
                    Text(
                      titleBar,
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: spaceBetweenBarEx,
                    ),
                    Text(titleEx,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Row(
                children: List.generate(subtitle.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Text(
                          subtitle[index],
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: fontSizeTitle - 24,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "!",
                          style: TextStyle(
                              color: blackTextColor,
                              fontSize: fontSizeTitle - 24,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              getParaText(para)
            ],
          ),
          SizedBox(
            width: spaceBetweenWidgets,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(containerBorderRadius),
              child:
                  (SvgPicture.asset("swap_example.svg", height: imageHeight))),
        ],
      ),
    );
  }
}

class BarterWithUs extends StatelessWidget {
  TextEditingController emailController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      nameController = TextEditingController();

  Widget getDecoration(Widget child) => Container(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: child);

  Widget getPair(String title, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getDecoration(Text(title)),
          SizedBox(
            width: spaceBetweenBarEx * 2,
          ),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                filled: true,
                //hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: title,
                fillColor: Colors.white),
            style: TextStyle(fontSize: 12),
          ))
        ],
      ),
    );
  }

  Widget enquiryForm() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getPair("Name", nameController),
          getPair("E-mail", emailController),
          getPair("Phone", phoneNumberController),
          SizedBox(
            height: 80,
          ),
          Center(
              child: ElevatedButton(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  Text("SUBMIT".toUpperCase(), style: TextStyle(fontSize: 14)),
            ),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)))),
            onPressed: () {},
          ))
        ],
      );

  @override
  Widget build(BuildContext context) {
    String why = "WANT to";
    String para = "Write to us!! We will customise your barter deals.";

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: imageHeight,
            width: imageWidth,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(containerBorderRadius)),
            child: enquiryForm(),
          ),
          SizedBox(
            width: spaceBetweenWidgets,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: spaceBetweenTitle),
                child: Row(
                  children: [
                    Text(
                      why,
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("BARTER",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontSizeTitle,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: spaceBetweenBarEx,
                    ),
                    Text(
                      "?",
                      style: TextStyle(
                          color: blackTextColor,
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              getParaText(para)
            ],
          ),
        ],
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  TextEditingController emailController = TextEditingController(),
      phoneNumberController = TextEditingController(),
      nameController = TextEditingController();

  Widget getDecoration(Widget child) => Container(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: child);

  Widget getPair(IconData iconData, String details) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            iconData,
            size: 45,
            color: Colors.white,
          ),
          SizedBox(
            width: spaceBetweenBarEx * 2,
          ),
          Text(
            details,
            style: TextStyle(
              fontSize: reactSizePara,
              color: Colors.white,
            ),
            softWrap: true,
          )
        ],
      ),
    );
  }

  Widget reachDetails() => Container(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getPair(FontAwesomeIcons.instagram, "barex.in"),
              getPair(FontAwesomeIcons.phone, "+91-9925720096"),
              getPair(FontAwesomeIcons.mapLocation,
                  "C/10, Nandanvan Chambers,\nOpp. Town Hall, Ellisbridge,\nAhmedabad,\nGujarat - 380006"),
            ],
          ),
        ),
      );
  Color footerColor = Colors.grey;
  double footerheight = 24;

  Widget getDivider() => Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: VerticalDivider(
          color: footerColor,
          thickness: 2,
        ),
      );

  @override
  Widget build(BuildContext context) {
    String why = "Why";
    String para =
        "Get your customised barter deals with BarEx.\nGrowing business on digital platform.";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalSpacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "REACH US",
                    style: TextStyle(
                        color: blackTextColor,
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: spaceBetweenWidgets,
              ),
              Container(
                height: imageHeight,
                width: imageWidth,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(containerBorderRadius)),
                child: reachDetails(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Divider(color: footerColor),
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(
                  Icons.copyright_outlined,
                  color: footerColor,
                  size: footerheight,
                ),
              ),
              Text(
                "2022 BarEx",
                style: TextStyle(color: footerColor, fontSize: footerheight),
              ),
              getDivider(),
              Text(
                "All Rights Reserved",
                style: TextStyle(color: footerColor, fontSize: footerheight),
              ),
              getDivider(),
              Text(
                "Designed by BarEx",
                style: TextStyle(color: footerColor, fontSize: footerheight),
              ),
            ],
          ),
        )
      ],
    );
  }
}
