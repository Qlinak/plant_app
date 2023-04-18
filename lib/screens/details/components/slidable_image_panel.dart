import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class ImagePanel extends StatefulWidget {
  const ImagePanel({
    super.key,
    required this.size, required this.imageList,
  });

  final Size size;
  final List<String> imageList;

  @override
  State<ImagePanel> createState() => _ImagePanelState();
}

class _ImagePanelState extends State<ImagePanel> {
  var activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * (3/4),
      width: widget.size.width * (2/3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(-10, 10),
              color: kPrimaryColor.withOpacity(0.2),
              blurRadius: 20
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            itemCount: widget.imageList.length,
            pageSnapping: true,
            allowImplicitScrolling: true,
            onPageChanged: (page){
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
               return ClipRRect(
                 borderRadius: const BorderRadius.only(
                   topLeft: Radius.circular(60),
                   bottomLeft: Radius.circular(60),
                 ),
                 child: Stack(
                     children: [
                       Positioned(
                         left: 0,
                         bottom: 0,
                         top: 0,
                         child: Image(
                           image: AssetImage(widget.imageList[index]),
                           fit: BoxFit.fill,
                         ),
                       ),
                     ]
                 ),
               );
             },
          ),
          Positioned(
            bottom: kDefaultPadding / 2,
            child: Row(
              children: indicators(widget.imageList.length, activePage),
            ),
          )
        ]
      ),
    );
  }
}

List<Widget> indicators(numImages,currentIndex) {
  return List<Widget>.generate(numImages, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}