import 'package:flutter/material.dart';

class BoxHeader extends StatelessWidget {
  const BoxHeader({
    super.key,
    required this.title,
    this.color,
    this.viewMore,
    this.viewMoreTitle,
  });

  final String title;
  final Color? color;
  final VoidCallback? viewMore;
  final String? viewMoreTitle;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? Theme.of(context).scaffoldBackgroundColor,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              if (viewMore != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextButton(
                    onPressed: viewMore,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    // child: Text(viewMoreTitle ?? S.of(context).buttonViewMore),
                    child: Text(viewMoreTitle ?? 'VER MAIS'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
