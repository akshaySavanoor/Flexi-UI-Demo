import 'package:flexi_ui/flexi_ui.dart';
import 'package:flexi_ui_demo/colors.dart';
import 'package:flutter/material.dart';

class FlexiUiDemoApp extends StatelessWidget {
  const FlexiUiDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                toolbarHeight: const Tuple2(56, 80).aw,
                leading: IconButton(
                  iconSize: const Tuple2(32, 64).aw,
                  onPressed: () {
                    _showProfileDialog(context);
                  },
                  color: AppColors.darkSlateBlue,
                  icon: const Icon(Icons.person),
                ),
                actions: ScreenAdaptiveConfig.instance!.isPhonePortrait
                    ? [mobileDropDownOption(context)]
                    : webDropDownOption()),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: const Tuple2(22, 64).aw,
                  ),
                  Text(
                    "Welcome to Flexi UI",
                    style: TextStyle(
                        fontSize: const Tuple2(32, 94).aw,
                        fontWeight: FontWeight.w900,
                        color: AppColors.deepGreen),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Transform Your Flutter Development Experience",
                    style: TextStyle(
                        fontSize: const Tuple2(18, 34).aw,
                        fontWeight: FontWeight.w600,
                        color: AppColors.deepGreen),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: const Tuple2(32, 168).aw),
                    child: Text(
                      "Flexi UI is a Simple yet powerful Flutter package designed"
                      " to simplify and enhance your UI development process."
                      " Whether you're building mobile or web applications,"
                      " Flexi UI offers a suite of tools to help you create responsive, modern,"
                      " and visually stunning interfaces with ease.",
                      style: TextStyle(
                          fontSize: const Tuple2(14, 18).aw,
                          fontWeight: FontWeight.w400,
                          color: AppColors.slateBlue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: const Tuple2(22, 44).aw,
                  ),
                  SizedBox(
                    height: const Tuple2(300, 500).aw,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            ScreenAdaptiveConfig.instance!.isPhonePortrait
                                ? 3
                                : 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(const Tuple2(8, 16).aw),
                            child: _imageCard(),
                          );
                        }),
                  ),
                  SizedBox(
                    height: const Tuple2(22, 44).aw,
                  ),
                  responsiveText(),
                  SizedBox(
                    height: const Tuple2(22, 44).aw,
                  ),
                  adaptiveText(),
                  SizedBox(
                    height: const Tuple2(22, 44).aw,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Tuple2(16, 64).aw),
                    child: Container(
                      width: 1.w,
                      height: 1,
                      color: AppColors.deepGreen,
                    ),
                  ),
                  SizedBox(
                    height: const Tuple2(22, 44).aw,
                  ),
                  Center(
                    child: Image.network(
                      "https://fastly.picsum.photos/id/16/2500/1667.jpg?hmac=uAkZwYc5phCRNFTrV_prJ_0rP0EdwJaZ4ctje2bY7aE",
                      height: const Tuple2(300, 500).aw,
                      width: 0.8.w,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: const Tuple2(22, 44).aw,
                  ),
                  _responsiveButton(),
                  SizedBox(
                    height: Tuple2(22, 44).aw,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget mobileDropDownOption(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.slateBlue,
      onSelected: (String value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $value')),
        );
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'home',
            child: Text('HOME'),
          ),
          const PopupMenuItem<String>(
            value: 'about',
            child: Text('ABOUT'),
          ),
          const PopupMenuItem<String>(
            value: 'portfolio',
            child: Text('PORTFOLIO'),
          ),
          const PopupMenuItem<String>(
            value: 'contact',
            child: Text('CONTACT'),
          ),
        ];
      },
      icon: Icon(
        Icons.menu,
        color: AppColors.darkSlateBlue,
        size: const Tuple2(32, 64).aw,
      ),
    );
  }

  List<Widget> webDropDownOption() {
    return List.generate(
      4,
      (index) {
        final labels = ['HOME', 'ABOUT', 'PORTFOLIO', 'CONTACT'];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: const Tuple2(8, 16).aw),
          child: TextButton(
            onPressed: () {},
            child: Text(
              labels[index],
              style: TextStyle(
                fontSize: const Tuple2(16, 22).aw,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _imageCard() {
    final borderRadius =
        BorderRadius.all(Radius.circular(const Tuple2(10, 20).d));
    final imageRadius = BorderRadius.only(
      topLeft: Radius.circular(const Tuple2(10, 20).d),
      topRight: Radius.circular(const Tuple2(10, 20).d),
    );
    final containerRadius = BorderRadius.only(
      bottomLeft: Radius.circular(const Tuple2(10, 20).d),
      bottomRight: Radius.circular(const Tuple2(10, 20).d),
    );

    return SizedBox(
      height: const Tuple2(300, 500).aw,
      width: const Tuple2(200, 400).aw,
      child: LayoutBuilder(builder: (context, constraints) {
        ResponsiveCardConfig().init(
          currentParentWidth: constraints.maxWidth,
          currentParentHeight: constraints.maxHeight,
          targetParentWidth: 200,
          targetParentHeight: 300,
        );
        return Container(
          height: constraints.minHeight,
          width: constraints.maxWidth,
          decoration: BoxDecoration(borderRadius: borderRadius),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: imageRadius,
                child: Image.network(
                  width: 200.fw,
                  height: 150.fh,
                  "https://fastly.picsum.photos/id/16/2500/1667.jpg?hmac=uAkZwYc5phCRNFTrV_prJ_0rP0EdwJaZ4ctje2bY7aE",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: constraints.maxWidth,
                height: 150.fh,
                decoration: BoxDecoration(
                  color: AppColors.lightSteelBlue,
                  borderRadius: containerRadius,
                ),
                child: Column(
                  children: [
                    Text(
                      "Responsive Card",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.fw,
                        color: AppColors.darkSlateBlue,
                      ),
                    ),
                    Text(
                      "Responsive card automatically adjusts its layout to provide a smooth and intuitive interface across mobile, tablet, and desktop screens",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.fw,
                        color: AppColors.slateBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _responsiveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: const Tuple2(16, 64).aw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconWithText(Icons.arrow_back, "Previous"),
          iconWithText(Icons.arrow_forward, "Next", isIconLeading: false),
        ],
      ),
    );
  }

  Widget iconWithText(IconData icon, String text, {bool isIconLeading = true}) {
    final width = const Tuple2(100, 160).aw;
    final padding = EdgeInsets.all(const Tuple2(6, 8).aw);
    final borderRadius = BorderRadius.circular(const Tuple2(4, 8).d);
    final iconSize = const Tuple2(16, 24).aw;
    final textSize = const Tuple2(16, 26).aw;
    final spacing = const Tuple2(4, 8).aw;
    const color = AppColors.slateBlue;
    const textColor = AppColors.deepGreen;

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      child: Container(
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: isIconLeading
              ? [
                  Icon(icon, color: textColor, size: iconSize),
                  SizedBox(width: spacing),
                  Text(text,
                      style: TextStyle(fontSize: textSize, color: textColor)),
                ]
              : [
                  Text(text,
                      style: TextStyle(fontSize: textSize, color: textColor)),
                  SizedBox(width: spacing),
                  Icon(icon, color: textColor, size: iconSize),
                ],
        ),
      ),
    );
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.symmetric(horizontal: const Tuple2(8, 16).aw),
          titlePadding: EdgeInsets.all(const Tuple2(8, 16).aw),
          actionsPadding: EdgeInsets.all(const Tuple2(8, 16).aw),
          scrollable: true,
          backgroundColor: AppColors.slateBlue,
          title: Row(
            children: [
              Icon(Icons.person,
                  size: const Tuple2(10, 20).d, color: AppColors.darkSlateBlue),
              const SizedBox(width: 10),
              Text(
                'Profile',
                style: TextStyle(fontSize: const Tuple2(18, 24).aw),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: AppColors.darkSlateBlue,
                radius: const Tuple2(20, 26).d,
                backgroundImage:
                    const NetworkImage('https://picsum.photos/id/237/200/300'),
              ),
              SizedBox(height: const Tuple2(4, 10).aw),
              Text(
                'Buddy',
                style: TextStyle(
                    fontSize: const Tuple2(14, 18).aw,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: const Tuple2(4, 10).aw),
              const Text('Email: buddy@dogmail.com'),
              const Text('Phone: +1234567890'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: AppColors.darkSlateBlue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget responsiveText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: const Tuple2(16, 64).aw),
      child: Text(
        "This is responsive text that scales based on screen size with an initial value of 12.rw, targeted for a design minimum width of 360 and the default device type of phone portrait. The scaled rounded value is ${12.rw.round()}.",
        style: TextStyle(
          fontSize: 12.rw,
          fontWeight: FontWeight.w400,
          color: AppColors.deepGreen,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget adaptiveText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: const Tuple2(16, 64).aw),
      child: Text(
        "This is adaptive text that scales based on the minimum and maximum screen width(useful when you have figma designs.) with a size of Tuple2(12, 32).aw, following the default values for designMinWidth and designMaxWidth. The scaled rounded value is ${const Tuple2(12, 32).aw.round()}.",
        style: TextStyle(
          fontSize: const Tuple2(12, 32).aw,
          fontWeight: FontWeight.w400,
          color: AppColors.deepGreen,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
