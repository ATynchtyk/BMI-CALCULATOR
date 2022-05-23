import 'package:flutter/material.dart';

class ReUsablWidget extends StatelessWidget {
  const ReUsablWidget({
    Key key,
    this.child,
    this.bgColor,
    this.onTap,
    this.flex,
  }) : super(key: key);

  final Widget child;
  final Color bgColor;
  final VoidCallback onTap; //VoidCallback oorduna Function koldonso da bolot//
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
