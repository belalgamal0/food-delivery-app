import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String imageUr;
  const CircularImage({super.key, required this.imageUr});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: SizedBox(width: 70,height: 70,
        child: CachedNetworkImage(errorWidget: (context, url, error) => Image.asset("assets/icons/recipe_placeholder.jpeg"),
            fit: BoxFit.fill, imageUrl: imageUr),
      ),
    );
  }
}
