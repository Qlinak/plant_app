import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/featured_plants.dart';
import 'package:plant_app/screens/home/components/recommended_plants.dart';
import 'package:plant_app/screens/home/components/titile_with_more_button.dart';

import 'header_with_search_box.dart';

class Body extends StatelessWidget{
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var userName = "Neville";
    var title1 = "Recommended";
    var title2 = "Featured Plants";
    var imageUrlList = ["assets/images/image_1.png", "assets/images/image_2.png", "assets/images/image_3.png"];
    var nameList = ["SAMANTHA", "ANGELICA", "BABYCITA"];
    var countryList = ["RUSSIA", "UK", "CHINA"];
    var priceList = <double>[400, 540, 999];

    var bottomImageUrlList = ["assets/images/bottom_img_1.png", "assets/images/bottom_img_2.png"];
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: [
              HeaderWithSearchBox(size: size, userName: userName),
              TitileWithMoreButton(title: title1, onPress: (){ }, size: size,),
              RecommendedPlants(size: size, nameList: nameList, countryList: countryList, imageUrlList: imageUrlList, priceList: priceList),
              TitileWithMoreButton(title: title2, onPress: (){ }, size: size),
              FeaturedPlants(size: size, bottomImageUrlList: bottomImageUrlList),
            ],
          ),
        ),
      ],
    );
  }

}

