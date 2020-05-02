import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/res/res.dart';

class Button extends StatelessWidget {
  final Color colour;
  final String text;
  final Function onPress;

  Button({@required this.colour, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: AppStyles.h5Black.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}