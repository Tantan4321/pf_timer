import 'package:flutter/material.dart';

const double kBarHeight = 66.0;

class GradientAppBar extends StatelessWidget {
  final String title;
  final Color primary;
  final Color secondary;
  final Color textColor;

  final Widget leading;
  final List<Widget> actions;

  GradientAppBar({
    @required this.primary, @required this.secondary, @required this.title,
      this.textColor = Colors.black, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final List<Widget> children = <Widget>[];
    if (leading != null)
      children.add(Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: kBarHeight),
              child: leading),
        ),
      ));

    if (title != null)
      children.add(Center(
        child: new Text(
          title,
          style: TextStyle(
              color: textColor,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 36.0),
        ),
      ));

    //TODO: implement actions

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + kBarHeight,
      child: Stack(children: children),
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
