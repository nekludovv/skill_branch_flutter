/// To use this font, place it in your fonts/ directory and include the
/// following in your pubspec.yaml
/// flutter:
///   fonts:
///    - family:  AppIcons
///      fonts:
///       - asset: fonts/AppIcons.ttf
import 'package:flutter/widgets.dart';

class AppIcons {
  AppIcons._();

  static const _kFontFam = 'AppIcons';
  static const _kFontPkg = null;

  static const IconData like_fill = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData like = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData home = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
