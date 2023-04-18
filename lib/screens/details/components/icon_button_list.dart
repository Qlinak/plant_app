import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class DetailPageIconButtons extends StatelessWidget {
  const DetailPageIconButtons({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            FeatureButton(size: size, iconUrl: "assets/icons/sun.svg", onPress: (){},),
            FeatureButton(size: size, iconUrl: "assets/icons/icon_2.svg", onPress: (){},),
            FeatureButton(size: size, iconUrl: "assets/icons/icon_3.svg", onPress: (){},),
            FeatureButton(size: size, iconUrl: "assets/icons/icon_4.svg", onPress: (){},),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  const FeatureButton({
    super.key,
    required this.size, required this.iconUrl, required this.onPress,
  });

  final Size size;
  final String iconUrl;
  final Function onPress;

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
                  onPressed: () { onPress(); },
                  icon: SvgPicture.asset(iconUrl),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

