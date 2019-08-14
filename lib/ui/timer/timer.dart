import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';
import 'package:pf_timer/models/timer.dart';
import 'package:pf_timer/widgets/custom_timer_painter.dart';
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

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  AnimationController _controller;

  Timer get timer => widget.timer;

  String get timerString {
    Duration d = _controller.duration * _controller.value;
    return '${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    print(timer.time.toString());
    _controller = AnimationController(vsync: this, duration: Duration(minutes: timer.time.inMinutes));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(
            primary: Theme.of(context).primaryColor,
            secondary: Theme.of(context).accentColor,
            textColor: AppColors.gunmetal,
            title: "PF Timer",
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 40.0,
              color: AppColors.gunmetal,
              onPressed: () => _handleBackButton(context),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: <Widget>[
                    //TODO: implement background animation
                    /*Align(
                      alignment: Alignment.bottomCenter,
                      child:
                      Container(
                        color: Colors.amber,
                        height:
                        _controller.value * MediaQuery.of(context).size.height,
                      ),
                    ),*/
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: Padding(
                              padding: const EdgeInsets.all(48.0),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: CustomPaint(
                                          painter: CustomTimerPainter(
                                            animation: _controller,
                                            backgroundColor: Colors.white,
                                            color: themeData.indicatorColor,
                                          )),
                                    ),
                                    Align(
                                      alignment: FractionalOffset.center,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Count Down Timer",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            timerString,
                                            style: TextStyle(
                                                fontSize: 112.0,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return FloatingActionButton.extended(
                    onPressed: () {
                      if (_controller.isAnimating)
                        _controller.stop();
                      else {
                        _controller.reverse(
                            from: _controller.value == 0.0
                                ? 1.0
                                : _controller.value);
                      }
                    },
                    icon: Icon(_controller.isAnimating
                        ? Icons.pause
                        : Icons.play_arrow),
                    label: Text(
                        _controller.isAnimating ? "Pause" : "Play"));
              }),
        ],
      ),

      /*floatingActionButton: FloatingActionButton.extended(
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
      ),*/
    );
  }

  void _handleBackButton(BuildContext context) {
    Navigator.of(context).pushNamed("/");
  }
}
