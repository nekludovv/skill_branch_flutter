import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';

const String kFlutterDash = 'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {
  Feed({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Photo', style: Theme.of(context).textTheme.headline5,
               ),
        backgroundColor: AppColors.white,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
          return Column (
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/fullScreenImage',
                      arguments: FullScreenImageArguments(
                          photo: kFlutterDash,
                          altDescription: 'This is text about pucture',
                          userName: 'kaparray',
                          name: 'Kirill Adeshchenko',
                          userPhoto: 'https://skill-branch.ru/img/speakers/Adechenko.jpg',
                          heroTag: 'photo_$index',
                          settings: RouteSettings(arguments: kFlutterDash)),
                    );
 /*                   Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      FullScreenImage(
                      name: 'Kirill Adechenko',
                      userName: 'kaparray',
                      userPhoto: 'https://skill-branch.ru/img/speakers/Adechenko.jpg',
                      altDescription: 'This is text about pucture',
                      photo: kFlutterDash,
                      heroTag: 'photo_$index',
                      ),
                  ),
                  );
 */               },
                child:
                  _buildItem(index: index), // Photo(photoLink: kFlutterDash),
              ),
              Divider(thickness: 2,color: AppColors.mercury,),
            ],);
          }),
    );
  }

  Widget _buildItem({int index}) {
        return Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'photo_$index',
              child:Photo(photoLink: kFlutterDash),
            ),
            _buildPhotoMeta(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child:
               Text ('This is text about picture',
                 maxLines: 3,
                 overflow: TextOverflow.ellipsis,
                 style: Theme.of(context).textTheme.headline6,
               ),
            )
          ],
       );
  }

  Widget _buildPhotoMeta() {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Row (
            children: [
              UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
              SizedBox (width: 6),
              Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text ("Kirill Adechenko", style: Theme.of(context).textTheme.headline6),
                  Text ("@kaparray", style: Theme.of(context).textTheme.headline6),
              ],
              ),
            ],
          ),
          LikeButton(10, true),
        ],
        ),
      );
  }

} // END class _FeedState