import 'package:flutter/material.dart';

class GecisliRenkContainer extends StatelessWidget {
  const GecisliRenkContainer(
      {Key? key, required this.child, required this.renk})
      : super(key: key);

  final Widget child;
  final MaterialColor renk;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [renk.shade700, renk.shade500, renk.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1])),
    );
  }
}
