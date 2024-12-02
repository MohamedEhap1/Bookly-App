import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.text,
    this.borderRadius,
    this.onPressed,
  });
  final Color backgroundColor;
  final Color color;
  final String text;
  final BorderRadius? borderRadius;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
            ),
            backgroundColor: backgroundColor,
          ),
          onPressed: onPressed,
          child: FittedBox(
            child: Text(
              text,
              style: Styles.textStyle16.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
