import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserAvatar extends StatelessWidget {
  UserAvatar(this.avatarLink);
  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50), //BorderRadius.all(Radius.circular(50.0)
          child: CachedNetworkImage(
            imageUrl: avatarLink,
            width: 40,
            height: 40,
            fit: BoxFit.fill, //BoxFit.cover,
          ),
    );
  }
}