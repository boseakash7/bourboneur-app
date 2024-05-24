import 'package:flutter/material.dart';

class QuadBox extends StatefulWidget {
  QuadBox({super.key, this.color, this.onTap});

 
  final Color? color;
  void Function()? onTap;

  static double width = 110;
  static double height = 110;

  @override
  State<QuadBox> createState() => _QuadBoxState();
}

class _QuadBoxState extends State<QuadBox> with TickerProviderStateMixin {


  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
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
    return GestureDetector(
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: QuadBox.width,
          height: QuadBox.height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: widget.color
          ),
        ),
      ),
    );
  }
}
