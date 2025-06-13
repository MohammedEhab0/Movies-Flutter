import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/Data/models/MovieRespone.dart';
import 'package:movies/ui/Widgets/movie_item.dart';
import 'package:movies/utils/app_colors.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.height,
    required this.slider,
  });

  final double height;
  final List<Movies> slider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: height * 0.42,
        enlargeCenterPage: true,
        viewportFraction: 0.45,
        enableInfiniteScroll: true,
      ),
      itemCount: slider.length,
      itemBuilder: (context, index, pageIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ItemBuilder(slider: slider, index: index),
        );
      },
    );
  }
}
