import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';
import 'package:pf_timer/models/timer.dart';
import 'package:pf_timer/widgets/gradient_app_bar.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({
    Key key,
    @required this.timer,
  }) : super(key: key);

  final Timer timer;

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(
            primary: Theme
                .of(context)
                .primaryColor,
            secondary: Theme
                .of(context)
                .accentColor,
            textColor: AppColors.gunmetal,
            title: "PF Timer",
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 40.0,
              color: AppColors.gunmetal,
              onPressed: () => _handleBackButton(context),
            ),
          ),
          //HomePageBody()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.restore),
        label: Text("Reset",
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              height: 1.2,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
      ),
    );
  }

  void _handleBackButton(BuildContext context) {
    Navigator.of(context).pushNamed("/");
  }
}