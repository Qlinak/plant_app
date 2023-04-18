import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class DetailsPageBugNowButton extends StatelessWidget {
  const DetailsPageBugNowButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
        color: kPrimaryColor,
      ),
      child: Stack(
          children: [
            const Center(
              child: Text(
                "Bug Now",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(30)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ]
      ),
    );
  }
}
