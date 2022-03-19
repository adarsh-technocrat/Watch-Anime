import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;
  final Function(bool value)? onHover;
  const OnHoverButton({Key? key, required this.child, this.onHover})
      : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  final hoverTransform = Matrix4.identity()..translate(0.0, -5.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        onEnter(true);
        widget.onHover!(true);
      },
      onExit: (event) {
        onEnter(false);
        widget.onHover!(false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: isHovered ? hoverTransform : Matrix4.identity(),
        child: widget.child,
      ),
    );
  }

  void onEnter(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
