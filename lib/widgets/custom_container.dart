import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key key,
    @required this.children,
    this.height,
    this.decoration,
  }) : super(key: key);


  final List<Widget> children;
  final Decoration decoration;
  final double height;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      child: Container(
        width: screenSize.width,
        decoration: decoration,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (children != null) ...children,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
