import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';

import 'package:gallery_saver/gallery_saver.dart';

const String kFlutterDush =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class FullScreenImageArguments {
  FullScreenImageArguments({
    this.key,
    this.photo,
    this.altDescription,
    this.userName,
    this.name,
    this.userPhoto,
    this.heroTag,
    this.settings,
  });
  final Key key;
  final String photo;
  final String altDescription;
  final String userName;
  final String name;
  final String userPhoto;
  final String heroTag;
  final RouteSettings settings;
}

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {this.photo ='',
      this.altDescription ='',
      this.userName ='',
      this.name ='',
      this.userPhoto ='',
      this.heroTag,
      Key key})
      : super(key: key);

  final String photo;
  final String altDescription;
  final String userName;
  final String name;
  final String userPhoto;
  final String heroTag;

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<FullScreenImage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    _playAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body:SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: widget.heroTag,
            child: Photo(
              photoLink: (widget.photo != null && widget.photo.isNotEmpty)
                  ? widget.photo
                  : kFlutterDush,
            ),
          ),
          const SizedBox(height: 11),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              (widget.altDescription != null) ? widget.altDescription : '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(height: 9),
//        _buildPhotoMeta(widget.name, widget.userName),
          PhotoMetaUser(
            controller: _animationController,
            name: widget.name,
            nikName: widget.userName,
            userPhoto: widget.userPhoto,
          ),
          const SizedBox(height: 17),
          _buildLikeAndButton(),
        ],
      ),
    ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: AppColors.grayChateau,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => ClaimBottomSheet(
                    onClaims: (int value) {
                      Navigator.pop(context);
                    },
                  ),
            );
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: AppColors.grayChateau,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: AppColors.white,
      centerTitle: true,
      title: Text('Photo', style: Theme.of(context).textTheme.headline5),
    );
  }
/*  Widget _buildPhotoMeta(String name, String nikName) {
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
  }*/

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
            onPress: () {
              _savePicture (context);
            },
          ),
        ),

        const SizedBox(width: 12),
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

  void _savePicture (BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Downloading photos"),
          content: Text('Are you sure you want to upload a photo?'),
          actions: <Widget>[
            FlatButton(
              child: Text("Download"),
              onPressed: () {
                GallerySaver.saveImage(widget.photo).then((bool success) {
                  print ('Saving photo ${widget.photo}');
                  Navigator.of(context).pop();
                });
              },
            ),
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

} // _PhotoScreenState


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
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class PhotoMetaUser extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> opacityUserAvatar;
  final Animation<double> opacityUserName;
  final String name;
  final String nikName;
  final String userPhoto;
  PhotoMetaUser(
      {this.controller, this.name, this.nikName, this.userPhoto, Key key})
      : opacityUserAvatar = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.5, curve: Curves.ease),
          ),
        ),
        opacityUserName = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1.0, curve: Curves.ease),
          ),
        ),
        super(key: key);

  Widget _buildPhotoMeta(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Opacity(
                opacity: opacityUserAvatar.value,
                child: UserAvatar((userPhoto != null && userPhoto.isNotEmpty)
                    ? userPhoto
                    : kFlutterDush),
              ),
              SizedBox(width: 6),
              Opacity(
                opacity: opacityUserName.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      (name != null) ? name : '',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      (nikName != null) ? '@$nikName' : '',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: AppColors.manatee,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildPhotoMeta,
      animation: controller,
    );
  }
}
