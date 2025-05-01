import 'package:flutter/material.dart';
import 'package:portfolio/extension.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    required this.child,
    this.borderEffect = false,
  });

  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final bool borderEffect;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.borderEffect) ...[
          const _BorderShadow(),
          const Positioned(bottom: 0, right: 0, child: _BorderShadow()),
        ],
        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.all(context.insets.cardpadding),
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.outline),
            color: context.colorScheme.surface,
            borderRadius:
                widget.borderRadius ??
                const BorderRadius.all(Radius.circular(24)),
          ),
          child: widget.child,
        ),
        if (widget.borderEffect) ...[
          CustomPaint(
            size: Size(widget.width ?? 0, widget.height ?? 0),
            painter: CurvedLinePainter(color: context.colorScheme.primary),
          ),
        ],
      ],
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;

  CurvedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;
    final topLeftPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..shader = LinearGradient(
            colors: [color.withOpacity(0), color, color, color.withOpacity(0)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize));

    final bottomPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..shader = LinearGradient(
            colors: [color.withOpacity(0), color, color, color.withOpacity(0)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          );

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);

    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );

    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomPaint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CurvedLinePainter oldDelegate) => true;
}

class _BorderShadow extends StatelessWidget {
  const _BorderShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
