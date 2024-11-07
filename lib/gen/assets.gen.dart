/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/all_issues.png
  AssetGenImage get allIssues =>
      const AssetGenImage('assets/images/all_issues.png');

  /// File path: assets/images/all_staff.png
  AssetGenImage get allStaff =>
      const AssetGenImage('assets/images/all_staff.png');

  /// File path: assets/images/bed.png
  AssetGenImage get bed => const AssetGenImage('assets/images/bed.png');

  /// Directory path: assets/images/bottom_bar
  $AssetsImagesBottomBarGen get bottomBar => const $AssetsImagesBottomBarGen();

  /// File path: assets/images/change_requests.png
  AssetGenImage get changeRequests =>
      const AssetGenImage('assets/images/change_requests.png');

  /// File path: assets/images/create_issue.svg
  String get createIssue => 'assets/images/create_issue.svg';

  /// File path: assets/images/create_staff.png
  AssetGenImage get createStaff =>
      const AssetGenImage('assets/images/create_staff.png');

  /// File path: assets/images/dorm1.png
  AssetGenImage get dorm1 => const AssetGenImage('assets/images/dorm1.png');

  /// File path: assets/images/dorm2.png
  AssetGenImage get dorm2 => const AssetGenImage('assets/images/dorm2.png');

  /// File path: assets/images/dorm3.png
  AssetGenImage get dorm3 => const AssetGenImage('assets/images/dorm3.png');

  /// File path: assets/images/dorm4.png
  AssetGenImage get dorm4 => const AssetGenImage('assets/images/dorm4.png');

  /// File path: assets/images/hostel.svg
  String get hostel => 'assets/images/hostel.svg';

  /// File path: assets/images/hostel_fees.png
  AssetGenImage get hostelFees =>
      const AssetGenImage('assets/images/hostel_fees.png');

  /// File path: assets/images/lady.png
  AssetGenImage get lady => const AssetGenImage('assets/images/lady.png');

  /// File path: assets/images/lady_ident.png
  AssetGenImage get ladyIdent =>
      const AssetGenImage('assets/images/lady_ident.png');

  /// File path: assets/images/logo.jpg
  AssetGenImage get logoJpg => const AssetGenImage('assets/images/logo.jpg');

  /// File path: assets/images/logo.svg
  String get logoSvg => 'assets/images/logo.svg';

  /// File path: assets/images/man_ident.png
  AssetGenImage get manIdent =>
      const AssetGenImage('assets/images/man_ident.png');

  /// File path: assets/images/person.png
  AssetGenImage get person => const AssetGenImage('assets/images/person.png');

  /// File path: assets/images/profile.svg
  String get profile => 'assets/images/profile.svg';

  /// File path: assets/images/room_availability.png
  AssetGenImage get roomAvailability =>
      const AssetGenImage('assets/images/room_availability.png');

  /// List of all assets
  List<dynamic> get values => [
        allIssues,
        allStaff,
        bed,
        changeRequests,
        createIssue,
        createStaff,
        dorm1,
        dorm2,
        dorm3,
        dorm4,
        hostel,
        hostelFees,
        lady,
        ladyIdent,
        logoJpg,
        logoSvg,
        manIdent,
        person,
        profile,
        roomAvailability
      ];
}

class $AssetsImagesBottomBarGen {
  const $AssetsImagesBottomBarGen();

  /// File path: assets/images/bottom_bar/category.png
  AssetGenImage get category =>
      const AssetGenImage('assets/images/bottom_bar/category.png');

  /// File path: assets/images/bottom_bar/category_selected.png
  AssetGenImage get categorySelected =>
      const AssetGenImage('assets/images/bottom_bar/category_selected.png');

  /// File path: assets/images/bottom_bar/home.png
  AssetGenImage get home =>
      const AssetGenImage('assets/images/bottom_bar/home.png');

  /// File path: assets/images/bottom_bar/home_selected.png
  AssetGenImage get homeSelected =>
      const AssetGenImage('assets/images/bottom_bar/home_selected.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [category, categorySelected, home, homeSelected];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
