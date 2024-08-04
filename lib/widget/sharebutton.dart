import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  final String contentToShare;

  ShareButton({required this.contentToShare});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Share.share(contentToShare);
      },
      icon: Icon(
        Icons.share,
        size: 40,
        color: Color(0xffd8f3dc),
      ),
    );
  }
}