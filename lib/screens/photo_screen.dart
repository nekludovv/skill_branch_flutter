import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';

const String kFlutterDush =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class FullScreenImage extends StatefulWidget {
  FullScreenImage({this.altDescription, this.userName, this.name, this.photo, Key key}) : super(key: key);

  final String altDescription;
  final String userName;
  final String name;
  final String photo;

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Photo',
          style: AppStyles.h1Black.copyWith(
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back, color: AppColors.manatee),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Photo(
            photoLink: (widget.photo != null && widget.photo.isNotEmpty) ? widget.photo : kFlutterDush,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              (widget.altDescription != null) ? widget.altDescription : '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3,
            ),
          ),
          _buildPhotoMeta(widget.name, widget.userName),
          _buildLikeAndButton(),
        ],
      ),
    );
  }
}

Widget _buildPhotoMeta(String name, String nikName) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: <Widget>[
            UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
            SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name != null ? name : '',
                  style: AppStyles.h1Black,
                ),
                Text(nikName != null ? '@${nikName}' : '',
                  style: AppStyles.h5Black.copyWith(
                    color: AppColors.manatee,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildLikeAndButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Center(
          child: LikeButton(10, true),
        ),
      ),
      Expanded(
        child: Button(
          colour: AppColors.dodgerBlue,
          text: 'Save',
          onPress: () {},
        ),
      ),
      Expanded(
        child: Button(
          colour: AppColors.dodgerBlue,
          text: 'Visit',
          onPress: () {},
        ),
      )
    ],
  );
}