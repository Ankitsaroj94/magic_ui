import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ninja_ui/ninja_ui.dart';

/// A widget that displays a loading indicator, adapting to the platform.
///
/// The [NinjaUi] can display either a [CupertinoActivityIndicator] for iOS
/// or a [CircularProgressIndicator] for other platforms. The size, color, and
/// optional stroke width can be customized.
class NinjaUi extends StatelessWidget {
  /// Creates a [NinjaUi] widget.
  ///
  /// The [size] and [color] parameters must not be null.
  /// The [strokeWidth] is optional and defaults to 2 if not provided.
  const NinjaUi({
    super.key,
    required this.size,
    required this.color,
    this.strokeWidth,
  });

  /// The size of the loader.
  final double size;

  /// The color of the loader.
  final Color color;

  /// The stroke width of the loader, applicable for non-iOS platforms.
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    // Determine the widget size and shape
    return size.square(
      child:
          defaultTargetPlatform == TargetPlatform.iOS
              ? CupertinoActivityIndicator(
                // Set color for iOS platform
                color: color,
              )
              : CircularProgressIndicator(
                // Set stroke width and color for other platforms
                strokeWidth: strokeWidth ?? 2,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
    );
  }

  /// Provides a default loader with a predefined size and color.
  static Widget defaultLoader() =>
      const NinjaUi(size: 30, color: AppColors.primary);
}
