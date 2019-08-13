import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final Color primary;
  final Color secondary;
  final Color textColor;
  final double barHeight = 66.0;

  GradientAppBar(this.primary, this.secondary, this.textColor, this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: Stack(children: <Widget>[
        new Center(
          child: new Text(
            title,
            style: TextStyle(
                color: textColor,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 36.0),
          ),
        ),
      ]),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [primary, secondary],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
