import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({super.key, required this.name, required this.country, required this.price, required this.imageUrl});

  final String name, country, imageUrl;
  final double price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: size.height * (3/4),
                    width: size.width * (1/3),
                    child: Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding, bottom: kDefaultPadding * 2, top: kDefaultPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () { Navigator.pop(context); },
                            icon: SvgPicture.asset("assets/icons/back_arrow.svg")
                          ),
                          FeatureButton(size: size, iconUrl: "assets/icons/sun.svg",),
                          FeatureButton(size: size, iconUrl: "assets/icons/icon_2.svg",),
                          FeatureButton(size: size, iconUrl: "assets/icons/icon_3.svg",),
                          FeatureButton(size: size, iconUrl: "assets/icons/icon_4.svg",),
                        ],
                      ),
                    ),
                  ),
                  ImagePanel(size: size),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: size.height * (1/8),
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ],
                  // name, price, country bottom buy bar
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.size, required this.iconUrl,
  });

  final Size size;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.13,
      width: size.width * 0.13,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            color: kPrimaryColor.withOpacity(0.4),
            blurRadius: 20,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Material(
              child: IconButton(
                onPressed: () { },
                icon: SvgPicture.asset(iconUrl),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class ImagePanel extends StatelessWidget {
  const ImagePanel({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * (3/4),
      width: size.width * (2/3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-10, 10),
            color: kPrimaryColor.withOpacity(0.2),
            blurRadius: 20
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        ),
        child: Stack(
          children: const [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              child: Image(
                image: AssetImage("assets/images/img.png"),
                fit: BoxFit.fill,
              ),
            ),
          ]
        ),
      ),
    );
  }
}