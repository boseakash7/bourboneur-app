import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuadText extends StatefulWidget {
  QuadText({super.key, required this.text, this.color});
  Color? color;
  String text;

  @override
  State<QuadText> createState() => _QuadTextState();
}

class _QuadTextState extends State<QuadText> with TickerProviderStateMixin {
   
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    _controller.animateTo(1);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Text(widget.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: widget.color)),
    );
  }
}