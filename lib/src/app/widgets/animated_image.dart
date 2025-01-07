import 'package:flutter/widgets.dart';

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key, required this.imagepath});
  final String imagepath;

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: Offset(0, 0.1),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: Image.asset(widget.imagepath, scale: 3),
      position: _animation,
    );
  }
}
