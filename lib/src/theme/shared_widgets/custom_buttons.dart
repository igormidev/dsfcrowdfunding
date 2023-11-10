import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.minimumSize,
    this.padding,
  });

  final String title;
  final VoidCallback? onPressed;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonTheme(
      data: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).unselectedWidgetColor,
          minimumSize: minimumSize,
          backgroundColor: Theme.of(context).primaryColor,
          padding: padding,
        ),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
  });

  final String title;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}

class TextButtonWithUnderLine extends StatelessWidget {
  const TextButtonWithUnderLine({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = const Color(0xffff4a01),
  });

  final String title;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.only(bottom: 9),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: color,
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: color,
            wordSpacing: 1,
          ),
        ),
      ),
    );
  }
}
