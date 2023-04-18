
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitileWithMoreButton extends StatelessWidget {
  const TitileWithMoreButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.size,
  });

  final String title;
  final Function onPress;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding, bottom: kDefaultPadding / 2),
      child: SizedBox(
        height: size.height * 0.05,
        child: Row(
          children: [
            TitileWithCustomUnderline(title: title),
            const Spacer(),
            MoreButton(onPress: onPress),
          ],
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.onPress,
  });

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: (){ },
        child: const Text(
          'More',
          style: TextStyle(
            color: Colors.white,
          ),
        )
    );
  }
}

class TitileWithCustomUnderline extends StatelessWidget {
  const TitileWithCustomUnderline({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
