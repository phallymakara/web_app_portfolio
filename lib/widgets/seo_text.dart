import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';

class SEOText extends StatelessWidget {
  const SEOText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textRendererStyle,
    this.maxlines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxlines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: overflow,
    );
  }
}
