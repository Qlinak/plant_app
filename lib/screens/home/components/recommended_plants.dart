
import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/details_screen.dart';

import '../../../constants.dart';

class RecommendedPlants extends StatelessWidget {
  const RecommendedPlants({
    super.key,
    required this.size,
    required this.nameList,
    required this.countryList,
    required this.imageUrlList,
    required this.priceList,
  });

  final Size size;
  final List<String> nameList;
  final List<String> countryList;
  final List<String> imageUrlList;
  final List<double> priceList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.32,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: nameList.length,
          itemBuilder: (BuildContext context, int index){
            return RecommendedPlantCard(
                size: size,
                plantName: nameList[index],
                countryName: countryList[index],
                imageUrl: imageUrlList[index],
                price: priceList[index],
                onTap: (){
                  print("tapped ${nameList[index]}, navigating to new page...");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context){
                        return DetailsScreen(name: nameList[index], country: countryList[index], price: priceList[index], imageUrl: imageUrlList[index],);
                      }));
                }
            )
            ;
          }
      ),
    );
  }
}

class RecommendedPlantCard extends StatelessWidget {
  const RecommendedPlantCard({
    super.key,
    required this.size,
    required this.plantName,
    required this.countryName,
    required this.imageUrl,
    required this.price,
    required this.onTap,
  });

  final Size size;
  final String plantName, countryName, imageUrl;
  final double price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding),
      width: size.width * 0.4,
      child: Column(
        children: [
          Image.asset(imageUrl),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-5, 10),
                      blurRadius: 10,
                      color: kPrimaryColor.withOpacity(0.23)
                  )
                ]
            ),
            child: Material(
              color: Colors.white,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
              child: InkWell(
                onTap: (){onTap();},
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding / 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(plantName),
                            const Spacer(),
                            Text("\$$price", style: const TextStyle(color: kPrimaryColor),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: kDefaultPadding / 4),
                          child: Row(
                            children: [
                              Text(
                                countryName,
                                style: TextStyle(
                                  color: kPrimaryColor.withOpacity(0.5),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
