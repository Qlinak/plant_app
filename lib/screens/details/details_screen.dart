import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/details_page_details.dart';
import 'package:plant_app/screens/details/components/icon_button_list.dart';
import 'package:plant_app/screens/details/components/slidable_image_panel.dart';

import 'components/buy_now_button.dart';
import 'components/favorite_button.dart';

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
                  DetailPageIconButtons(size: size),
                  ImagePanel(size: size, imageList: const ["assets/images/img.png", "assets/images/img2.png", "assets/images/img3.png"],),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    DetailsPageDetails(size: size, name: name, price: price, country: country),
                    Expanded(
                      child: Row(
                        children: [
                          DetailsPageBugNowButton(size: size),
                          DetailsPageFavoriteButton(size: size),
                        ],
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