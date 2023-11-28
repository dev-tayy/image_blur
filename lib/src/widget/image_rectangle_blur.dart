import 'dart:ui';
import 'package:flutter/material.dart';
import '../tools/shimmer_image_tools.dart';

// ignore: must_be_immutable
class ImageRectangleBlur extends StatefulWidget {
  final String? imageNetwork;

  final String? imageAssets;

  final int durationShimmer;

  final int durationBlur;

  final double? height;

  final double? width;

  final BoxFit? fit;

  final BlendMode? colorBlendMode;

  final Color? color;

  final AlignmentGeometry alignment;

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

  final bool isBlur;

  final bool isShimmer;

  Map<String, String>? headers;

  final int? cacheWidth;

  final int? cacheHeight;

  final Color baseColorShimmer;

  final Color highlightColorShimmer;

  final Color colorShimmer;

  ImageRectangleBlur(
      {Key? key,
      this.imageNetwork,
      this.imageAssets,
      this.durationShimmer = 3,
      this.durationBlur = 2,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
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
      this.isBlur = true,
      this.isShimmer = true,
      this.headers,
      this.cacheWidth,
      this.cacheHeight,
      this.baseColorShimmer = const Color.fromRGBO(224, 224, 224, 1),
      this.highlightColorShimmer = const Color.fromRGBO(245, 245, 245, 1),
      this.colorShimmer = Colors.white})
      : super(key: key);

  @override
  State<ImageRectangleBlur> createState() => _ImageRectangleBlurState();
}

class _ImageRectangleBlurState extends State<ImageRectangleBlur>
    with SingleTickerProviderStateMixin {
   late AnimationController blurController;
  late Animation<double> sigmaXAnimation;
  bool showImage = false;

  @override
  void initState() {
    blurController = AnimationController(duration: Duration(seconds: widget.durationBlur), vsync: this);
    sigmaXAnimation = Tween<double>(begin: 5, end: 0.0).animate(blurController);

    blurController.forward().then((_) {
      setState(() {
        showImage = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    blurController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          showImage
              ? (widget.imageAssets != null || widget.imageNetwork != null)
                  ? (widget.imageAssets != null
                      ? Image.asset(
                          widget.imageAssets!,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        )
                      : Image.network(
                          widget.imageNetwork!,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ))
                  : const Text("Image not provided")
              : const SizedBox.shrink(),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigmaXAnimation.value,
                sigmaY: sigmaXAnimation.value,
                tileMode: TileMode.decal,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
