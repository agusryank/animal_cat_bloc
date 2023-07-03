import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../core/app_config.dart';

// Get Image ========================================
class GetImage extends StatelessWidget {
  final String path;
  final BoxFit? fit;

  /// [width, height]
  final dynamic size;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Function(double?)? progress;
  final Color? skeletonColor;

  GetImage(this.path,
      {this.fit = BoxFit.cover,
      this.size = 100,
      this.margin,
      this.borderRadius,
      this.progress,
      this.skeletonColor});

  @override
  Widget build(BuildContext context) {
    bool isSvg = path.split('.').last.toLowerCase() == 'svg';

    // check if path is url
    if (path.startsWith('http') || path.startsWith('https')) {
      if (isSvg) {
        return Container(
          margin: margin,
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: SvgPicture.network(path,
                fit: fit ?? BoxFit.none,
                width: size is List ? size[0].toDouble() : size.toDouble(),
                height: size is List ? size[1].toDouble() : size.toDouble()),
          ),
        );
      }

      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          fit: fit,
          imageUrl: path,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            // download progress
            double? prog = downloadProgress.progress ?? 0.0;

            if (progress != null) {
              log('--- total size ${downloadProgress.totalSize}');
              log('--- download progress: $prog');

              progress!(prog);
            }

            return Skeleton(
                size: size, highlightColor: skeletonColor ?? Colors.black54);
          },
          errorWidget: (context, url, error) => Center(
              // child: Icon(La.exclamation),
              ),
        ),
      );
    }

    return isSvg
        ? Container(
            margin: margin,
            child: ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.zero,
              child: SvgPicture.asset('${Config.assetImage}/' + path,
                  fit: fit ?? BoxFit.none,
                  width: size is List ? size[0].toDouble() : size.toDouble(),
                  height: size is List ? size[1].toDouble() : size.toDouble()),
            ))
        : Container(
            width: size is List ? size[0].toDouble() : size.toDouble(),
            height: size is List ? size[1].toDouble() : size.toDouble(),
            margin: margin,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(path.isEmpty
                      ? '${Config.assetImage}/profile.png'
                      : '${Config.assetImage}/' + path),
                  fit: fit),
            ),
          );
  }
}

// Skeleton ========================================
class Skeleton extends StatelessWidget {
  final Color baseColor, highlightColor, color;
  final double radius;
  final EdgeInsets? margin;
  final bool darkMode;

  /// [width, height]
  final dynamic size;

  const Skeleton(
      {Key? key,
      this.baseColor = Colors.black26,
      this.highlightColor = Colors.black12,
      this.color = Colors.black54,
      this.margin,
      this.size = const [50, 15],
      this.radius = 0,
      this.darkMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor:
              darkMode ? Colors.white.withOpacity(.5) : highlightColor,
          child: Container(
            width: size is List ? size[0].toDouble() : size.toDouble(),
            height: size is List
                ? size.length == 1
                    ? 15.0
                    : size[1].toDouble()
                : size.toDouble(),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(radius)),
          ),
        ),
      );
}

/* --------------------------------------------------------------------------
| Poslign
| ---------------------------------------------------------------------------
| Shortcut of `Positioned.fill` with `Align` and `Container` inside
| */

class Poslign extends StatelessWidget {
  final AlignmentGeometry alignment;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final bool ignoring;
  const Poslign(
      {super.key,
      required this.alignment,
      this.child,
      this.ignoring = false,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: IgnorePointer(
      ignoring: ignoring,
      child: Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          child: child,
        ),
      ),
    ));
  }
}
