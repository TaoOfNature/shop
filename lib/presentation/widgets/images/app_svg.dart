import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.errorWidget,
  });

  final String path;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  bool get _isNetwork =>
      path.startsWith('http://') || path.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final colorFilter =
        color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

    if (_isNetwork) {
      return SvgPicture.network(
        path,
        width: width,
        height: height,
        fit: fit,
        colorFilter: colorFilter,
        placeholderBuilder: (_) =>
            placeholder ??
            const Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        errorBuilder: (_, _, _) =>
            errorWidget ??
            const Icon(
              Icons.broken_image_outlined,
              size: 20,
            ),
      );
    }

    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      colorFilter: colorFilter,
    );
  }
}
