import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../core/manager/colors_manager.dart';

class NetworkImagesSlider extends StatefulWidget {
  const NetworkImagesSlider({
    Key? key,
    required this.images,
    required this.height,
  }) : super(key: key);

  final List<String> images;

  final double height;

  @override
  State<NetworkImagesSlider> createState() => _NetworkImagesSliderState();
}

class _NetworkImagesSliderState extends State<NetworkImagesSlider> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: CarouselSlider(
            items: widget.images
                .map((imageUrl) => Image.network(imageUrl))
                .toList(),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            int index = entry.key;
            bool isSelected = _currentImageIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              child: Container(
                width: 7,
                height: 7,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? ColorsManager.primary : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
