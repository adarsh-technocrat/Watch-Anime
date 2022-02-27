import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({Key? key, required this.child}) : super(key: key);

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  final hoverTransform = Matrix4.identity()..translate(0.0, -7.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        onEnter(true);
      },
      onExit: (event) {
        onEnter(false);
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
