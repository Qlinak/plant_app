
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedIndex = 0;
  var colorList = [kPrimaryColor, kBackgroundColor, kBackgroundColor];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ink(
              decoration: ShapeDecoration(
                  color: kBackgroundColor,
                  shape: const CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: colorList[0],
                      offset: const Offset(-5, 5),
                      blurRadius: 10,
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex = 0;
                      colorList = [kPrimaryColor, kBackgroundColor, kBackgroundColor];
                    });
                  },
                  icon: SvgPicture.asset("assets/icons/flower.svg")
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                  color: kBackgroundColor,
                  shape: const CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: colorList[1],
                      offset: const Offset(-5, 5),
                      blurRadius: 10,
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex = 1;
                      colorList = [kBackgroundColor, kPrimaryColor, kBackgroundColor];
                    });
                  },
                  icon: SvgPicture.asset("assets/icons/heart.svg")
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                  color: kBackgroundColor,
                  shape: const CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: colorList[2],
                      offset: const Offset(-5, 5),
                      blurRadius: 10,
                    )
                  ]
              ),
              child: IconButton(
                  onPressed: (){
                    setState(() {
                      selectedIndex = 2;
                      colorList = [kBackgroundColor, kBackgroundColor, kPrimaryColor];
                    });
                  },
                  icon: SvgPicture.asset("assets/icons/user.svg")
              ),
            ),
          ],
        ),
      ),
    );
  }
}