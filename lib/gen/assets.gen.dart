/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Neutral_emoji.png
  AssetGenImage get neutralEmoji =>
      const AssetGenImage('assets/icons/Neutral_emoji.png');

  /// File path: assets/icons/angryemoji.png
  AssetGenImage get angryemoji =>
      const AssetGenImage('assets/icons/angryemoji.png');

  /// File path: assets/icons/app_tutorials.gif
  AssetGenImage get appTutorials =>
      const AssetGenImage('assets/icons/app_tutorials.gif');

  /// File path: assets/icons/confused_emoji.png
  AssetGenImage get confusedEmoji =>
      const AssetGenImage('assets/icons/confused_emoji.png');

  /// File path: assets/icons/dashboard_tutoiral.gif
  AssetGenImage get dashboardTutoiral =>
      const AssetGenImage('assets/icons/dashboard_tutoiral.gif');

  /// File path: assets/icons/footwhite.svg
  String get footwhite => 'assets/icons/footwhite.svg';

  /// File path: assets/icons/happy_emoji.png
  AssetGenImage get happyEmoji =>
      const AssetGenImage('assets/icons/happy_emoji.png');

  /// File path: assets/icons/linearprogess.svg
  String get linearprogess => 'assets/icons/linearprogess.svg';

  /// File path: assets/icons/sad_emoji.png
  AssetGenImage get sadEmoji =>
      const AssetGenImage('assets/icons/sad_emoji.png');

  /// File path: assets/icons/sleepwhite.svg
  String get sleepwhite => 'assets/icons/sleepwhite.svg';

  /// List of all assets
  List<dynamic> get values => [
        neutralEmoji,
        angryemoji,
        appTutorials,
        confusedEmoji,
        dashboardTutoiral,
        footwhite,
        happyEmoji,
        linearprogess,
        sadEmoji,
        sleepwhite
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/Animation - 1735748164091 (2).json
  String get animation17357481640912 =>
      'assets/lottie/Animation - 1735748164091 (2).json';

  /// File path: assets/lottie/heartbeat.json
  String get heartbeat => 'assets/lottie/heartbeat.json';

  /// List of all assets
  List<String> get values => [animation17357481640912, heartbeat];
}

class $AssetsVediosGen {
  const $AssetsVediosGen();

  /// File path: assets/vedios/SplashVideo.mp4
  String get splashVideo => 'assets/vedios/SplashVideo.mp4';

  /// List of all assets
  List<String> get values => [splashVideo];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsVediosGen vedios = $AssetsVediosGen();
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
    bool gaplessPlayback = false,
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
