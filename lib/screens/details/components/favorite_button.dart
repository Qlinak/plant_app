import 'package:flutter/material.dart';

class DetailsPageFavoriteButton extends StatelessWidget {
  const DetailsPageFavoriteButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
      ),
      child: Stack(
          children: [
            const Center(
              child: Text(
                "Favorite",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                ),
              ),
            ),
          ]
      ),
    );
  }
}
