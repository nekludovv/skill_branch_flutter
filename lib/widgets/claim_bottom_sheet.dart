import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:FlutterGalleryApp/res/res.dart';

class ClaimBottomSheet extends StatelessWidget {
  ClaimBottomSheet({this.onClaims});
  final ValueChanged<int> onClaims;

  static const List climeTypes = ['adult', 'harm', 'bully', 'spam', 'copyright', 'hate'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: climeTypes.map((e) {
          int index = climeTypes.indexOf(e);
          return _buildClaimElement(e, index, context);
        }).toList()
          ..add(
            SizedBox(height: 30),
          ),
      ),
    );
  }

  Widget _buildClaimElement(String type, int index, BuildContext context) {
    return InkWell(
      splashColor: AppColors.dodgerBlue,
      onTap: () {
        onClaims(index);
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: Center(
              child: Text(
                type.toUpperCase(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}