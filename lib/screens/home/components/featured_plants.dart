
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    super.key,
    required this.size,
    required this.bottomImageUrlList,
  });

  final Size size;
  final List<String> bottomImageUrlList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.285,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bottomImageUrlList.length,
        itemBuilder: (BuildContext context, int index) {
          return FeaturedPlantCard(size: size, imageUrl: bottomImageUrlList[index], onTap: (){ print("buttom: $index"); },);
        },
      ),
    );
  }
}

class FeaturedPlantCard extends StatelessWidget {
  const FeaturedPlantCard({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.onTap,
  });

  final Size size;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        bottom: kDefaultPadding / 2,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          height: size.height * 0.25,
          width: size.width * 0.7,
          child: Container(
            decoration: BoxDecoration(
              boxShadow:  [
                BoxShadow(
                    offset: const Offset(-5, 10),
                    blurRadius: 10,
                    color:  kPrimaryColor.withOpacity(0.23)
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onTap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
