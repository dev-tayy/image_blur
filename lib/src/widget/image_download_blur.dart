import 'dart:ui';

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDownloadBlur extends StatefulWidget {
  final String imageUrl;

  final BoxFit? fit;

  final double? height;

  final double? width;

  final BlendMode? colorBlendMode;

  final Color? color;

  final Alignment alignment;

  final Rect? centerSlice;

  final Animation<double>? opacity;

  final FilterQuality filterQuality;

  final ImageRepeat repeat;

  final bool matchTextDirection;

  final bool gapLessPlayback;

  final String? semanticLabel;

  final ImageFrameBuilder? frameBuilder;

  final ImageLoadingBuilder? loadingBuilder;

  final ImageErrorWidgetBuilder? errorBuilder;

  final bool isAntiAlias;

  final Map<String, String>? headers;

  final int? cacheWidth;

  final int? cacheHeight;

  final TileMode tileMode;

  final Duration fadeInDuration;

  final Color backgroundImage;

  final double scale;

  final int? memCacheHeight;

  final int? memCacheWidth;

  final Color? placeholderColor;

  const ImageDownloadBlur({
    required this.imageUrl,
    super.key,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.colorBlendMode = BlendMode.srcIn,
    this.color,
    this.alignment = Alignment.center,
    this.centerSlice,
    this.opacity,
    this.filterQuality = FilterQuality.low,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.gapLessPlayback = false,
    this.semanticLabel,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.isAntiAlias = false,
    this.headers,
    this.cacheWidth,
    this.cacheHeight,
    this.tileMode = TileMode.decal,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.backgroundImage = const Color.fromRGBO(238, 238, 238, 1),
    this.scale = 1.0,
    this.memCacheHeight,
    this.memCacheWidth,
    this.placeholderColor = const Color.fromRGBO(224, 224, 224, 1),
  });

  @override
  // ignore: library_private_types_in_public_api
  _ImageDownloadBlurState createState() => _ImageDownloadBlurState();
}

class _ImageDownloadBlurState extends State<ImageDownloadBlur> {
  double blurValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      color: widget.placeholderColor,
      child: FastCachedImage(
        errorBuilder: (context, url, error) => const Icon(Icons.error),
        url: widget.imageUrl,
        height: widget.height,
        width: widget.width,
        fit: widget.fit,
        cacheHeight: widget.memCacheHeight,
        cacheWidth: widget.memCacheWidth,
        loadingBuilder: (context, downloadProgress) {
          if (downloadProgress.totalBytes != null) {
            double progressValue = (downloadProgress.downloadedBytes /
                    downloadProgress.totalBytes!) *
                25;

            blurValue = 25 - progressValue;
            return ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: blurValue,
                sigmaY: blurValue,
                tileMode: TileMode.decal,
              ),
              child: Image.network(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                colorBlendMode: widget.colorBlendMode,
                color: widget.color,
                alignment: widget.alignment,
                centerSlice: widget.centerSlice,
                errorBuilder: widget.errorBuilder,
                filterQuality: widget.filterQuality,
                gaplessPlayback: widget.gapLessPlayback,
                isAntiAlias: widget.isAntiAlias,
                opacity: widget.opacity,
                semanticLabel: widget.semanticLabel,
                repeat: widget.repeat,
                matchTextDirection: widget.matchTextDirection,
                cacheHeight: widget.cacheHeight,
                cacheWidth: widget.cacheWidth,
                frameBuilder: widget.frameBuilder,
                scale: widget.scale,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
