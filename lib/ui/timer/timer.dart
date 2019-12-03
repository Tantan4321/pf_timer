import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';
import 'package:pf_timer/database.dart';
import 'package:pf_timer/models/timer.dart';
import 'package:pf_timer/widgets/custom_timer_painter.dart';
import 'package:pf_timer/widgets/gradient_app_bar.dart';
import 'package:pf_timer/widgets/wave_animation.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({
    Key key,
    @required this.timer,
    this.percent = 1.0,
  }) : super(key: key);

  final Timer timer;
  final double percent;

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

    _controller = AnimationController(
      value: widget.percent,
      vsync: this,
      duration: Duration(minutes: timer.time.inMinutes),
    );
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
      backgroundColor: AppColors.cream,
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
            //TODO: implement smooth reset animations
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          Size size = Size(
                              MediaQuery.of(context).size.width,
                              (MediaQuery.of(context).size.height - 66) *
                                  _controller.value);
                          return DemoBody(size: size, color: timer.color);
                        },
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: GestureDetector(
                              onTap: () => _timerTapped(),
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
                                          backgroundColor: AppColors.grey,
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
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
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
        onPressed: () => _restartCountDown(),
      ),
    );
  }

  void _timerTapped() {
    if (_controller.isAnimating)
      _controller.stop();
    else {
      _controller.reverse(
          from: _controller.value == 0.0 ? 1.0 : _controller.value);
    }
  }

  void _restartCountDown() {
    _controller.stop();
    _controller.reset();
    _controller.value = 1.0;
  }

  void _handleBackButton(BuildContext context) {
    Duration d = _controller.duration * _controller.value;
    /*widget.database
        .setTime(TimeStore(id: widget.percent, seconds: d.inSeconds));*/
    Navigator.of(context).pushNamed("/");
  }
}
