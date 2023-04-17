import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

const spaceTakenByHeader = 0.2;
const spaceTakenByUserBanner = spaceTakenByHeader * 0.5;
const marginRatioBetweenHeaderAndContent = 0.25;


class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    super.key,
    required this.size,
    required this.userName,
  });

  final Size size;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * spaceTakenByHeader,
      child: Stack(
        children: [
          UnderSearchBox(size: size),
          const SearchBox(),
          NameLogoBanner(size: size, userName: userName),
        ],
      ),
    );
  }
}

class NameLogoBanner extends StatelessWidget {
  const NameLogoBanner({
    super.key,
    required this.size,
    required this.userName,
  });

  final Size size;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding * marginRatioBetweenHeaderAndContent),
      height: size.height * spaceTakenByUserBanner,
      child: Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child:
              Text("Hi $userName!",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Image.asset("assets/images/logo.png"),
          ],
        ),
      ),
    );
  }
}

class UnderSearchBox extends StatelessWidget {
  const UnderSearchBox({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2 - 27,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36),
          )
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23)
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5),),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                SvgPicture.asset("assets/icons/search.svg"),
              ],
            ),
          ),
        )
    );
  }
}