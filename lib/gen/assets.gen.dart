// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/attatch.png
  AssetGenImage get attatch => const AssetGenImage('assets/icons/attatch.png');

  /// File path: assets/icons/post_task.png
  AssetGenImage get postTask =>
      const AssetGenImage('assets/icons/post_task.png');

  /// File path: assets/icons/test_icon.png
  AssetGenImage get testIcon =>
      const AssetGenImage('assets/icons/test_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [attatch, postTask, testIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/customer.png
  AssetGenImage get customer =>
      const AssetGenImage('assets/images/customer.png');

  /// File path: assets/images/logo.svg
  String get logo => 'assets/images/logo.svg';

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/onboardingPro1.png
  AssetGenImage get onboardingPro1 =>
      const AssetGenImage('assets/images/onboardingPro1.png');

  /// File path: assets/images/onboardingPro2.png
  AssetGenImage get onboardingPro2 =>
      const AssetGenImage('assets/images/onboardingPro2.png');

  /// File path: assets/images/onboardingPro3.png
  AssetGenImage get onboardingPro3 =>
      const AssetGenImage('assets/images/onboardingPro3.png');

  /// File path: assets/images/person.png
  AssetGenImage get person => const AssetGenImage('assets/images/person.png');

  /// File path: assets/images/profile_person_back.png
  AssetGenImage get profilePersonBack =>
      const AssetGenImage('assets/images/profile_person_back.png');

  /// File path: assets/images/service_provider.png
  AssetGenImage get serviceProvider =>
      const AssetGenImage('assets/images/service_provider.png');

  /// File path: assets/images/state_card_back.png
  AssetGenImage get stateCardBack =>
      const AssetGenImage('assets/images/state_card_back.png');

  /// List of all assets
  List<dynamic> get values => [
    customer,
    logo,
    onboarding1,
    onboarding2,
    onboarding3,
    onboardingPro1,
    onboardingPro2,
    onboardingPro3,
    person,
    profilePersonBack,
    serviceProvider,
    stateCardBack,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
