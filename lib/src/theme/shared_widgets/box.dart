import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/theme/shared_widgets/custom_buttons.dart';

import 'box_header.dart';

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.title,
    required this.child,
    this.space = 0,
    this.color,
    this.viewMore,
    this.viewMoreTitle,
    this.isHeaderViewMore = false,
    this.padding = EdgeInsets.zero,
    this.margin = const EdgeInsets.only(bottom: 50),
  });

  final String title;
  final Widget child;
  final double space;
  final Color? color;
  final VoidCallback? viewMore;
  final String? viewMoreTitle;
  final bool isHeaderViewMore;
  final EdgeInsets padding;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BoxHeader(
            title: title,
            color: color ?? Colors.transparent,
            viewMore: isHeaderViewMore ? viewMore : null,
            viewMoreTitle: viewMoreTitle,
          ),
          SizedBox(height: space),
          child,
          if (viewMore != null &&
              viewMoreTitle != null &&
              !isHeaderViewMore) ...[
            SizedBox(height: space),
            TextButtonWithUnderLine(title: viewMoreTitle!, onPressed: viewMore),
          ],
        ],
      ),
    );
  }
}
