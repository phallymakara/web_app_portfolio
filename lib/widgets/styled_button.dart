import 'package:flutter/material.dart';
import 'package:portfolio/extension.dart';

class PrimaryButtonOne extends StatelessWidget {
  const PrimaryButtonOne({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        title,
        style: context.textStyle.bodyMdMedium.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class OutlineButtonOne extends StatelessWidget {
  const OutlineButtonOne({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: context.colorScheme.primary,
        side: BorderSide(color: context.colorScheme.primary),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        title,
        style: context.textStyle.bodyMdMedium.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
