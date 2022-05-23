import 'package:flutter/material.dart';
import 'package:flutter_altynchy_sabak/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key key,
    @required this.text,
    @required this.icon,
    this.allPaddingSize,
  }) : super(key: key);

  final String text;

  final IconData icon;
  final double allPaddingSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(allPaddingSize ?? 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            size: 85.0,
          ),
          Text(text, style: titleTextStyle),
        ],
      ),
    );
  }
}
