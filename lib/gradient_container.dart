import "package:flutter/material.dart";

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  final Widget widget;

  const GradientContainer(this.colors, {super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [...colors],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: widget,
    );
  }
}
