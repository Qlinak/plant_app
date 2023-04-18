import 'package:flutter/cupertino.dart';
import 'package:plant_app/constants.dart';

class DetailsPageDetails extends StatelessWidget {
  const DetailsPageDetails({
    super.key,
    required this.size,
    required this.name,
    required this.price,
    required this.country,
  });

  final Size size;
  final String name;
  final double price;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: SizedBox(
        height: size.height * (1/8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: kDefaultPadding / 2, left: kDefaultPadding, right: kDefaultPadding),
              child: Row(
                children: [
                  Text(
                    name.toLowerCase().substring(0, 1).toUpperCase() + name.toLowerCase().substring(1),
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const Spacer(),
                  Text("\$$price",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25,
                    ),),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: kDefaultPadding, left: kDefaultPadding, right: kDefaultPadding, top: kDefaultPadding / 2),
              child: Row(
                children: [
                  Text(
                    country,
                    style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                      fontSize: 20,
                    ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}