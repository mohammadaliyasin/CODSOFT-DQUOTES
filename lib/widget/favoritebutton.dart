import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const FavoriteButton({
    required this.isFavorite,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 40,
        color: isFavorite ? Colors.red : Color(0xffd8f3dc),
      ),
      onPressed: onPressed,
    );
  }
}