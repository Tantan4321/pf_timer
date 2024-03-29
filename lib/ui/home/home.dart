import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';
import 'package:pf_timer/data/timers.dart';
import 'package:pf_timer/database.dart';
import 'package:pf_timer/models/timer.dart';
import 'package:pf_timer/ui/timer/timer.dart';
import 'package:pf_timer/widgets/custom_container.dart';
import 'package:pf_timer/widgets/gradient_app_bar.dart';
import 'package:pf_timer/widgets/timer_card.dart';

import 'package:screen/screen.dart';

class Home extends StatelessWidget {
  Home({this.database, this.stream});

  final Database database;
  final Stream<List<TimeStore>> stream;

  void _createTimer(int index) async {
    await database.createTimer(index);
  }

  void _resetTimer(Timer timer, int index) async {
    TimeStore thisTimer = TimeStore(id: index, seconds: timer.time.inSeconds);
    await database.setTime(thisTimer);
  }


  void _delete(int index) async {
    await database.deleteTimer(TimeStore(id: index, seconds: 0));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.cream,
      body: new Column(
        children: <Widget>[
          new GradientAppBar(
            primary: Theme.of(context).primaryColor,
            secondary: Theme.of(context).accentColor,
            textColor: AppColors.gunmetal,
            title: "PF Timer",
            leading: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 40.0,
              color: AppColors.gunmetal,
              onPressed: () => _handleMenuButton(),
            ),
          ),
          ..._buildBody(context)
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
        onPressed: () {
          _resetTimers();
        },
      ),
    );
  }

  void _handleMenuButton() {}

  List<Widget> _buildBody(BuildContext context){
    return [
      _buildPrepTab(),
      _buildScroller(context)
    ];
  }

  Widget _buildScroller(BuildContext context){
    var i = 0;

    return Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                ])),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  )
                ])),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                ])),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  )
                ])),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                ])),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  )
                ])),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 68),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildListDelegate([
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: (index) {
                      _toTimer(context, timers[index], index);
                    },
                  ),
                ])),
          ),
        ],
      ),
    );
  }

  Widget _buildPrepTab() {
    return CustomContainer(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              offset: new Offset(0.0, 10.0),
              blurRadius: 20.0,
            )
          ]),
      children: <Widget>[
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            itemCount: 2,
            itemBuilder: (context, j) => TimerCard(
                  timers[j + 11],
                  index: j + 11,
                  onPress: (index) {
                    _toTimer(context, timers[index], index);
                  },
                ))
      ],
    );
  }

  void _toTimer(BuildContext context, Timer timer, int index) {
    Screen.keepOn(true);
    double temp;
    database.getValue(index).then((onValue){
      temp = onValue.toDouble();
    });
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => TimerPage(
            timer: timer,
            //percent: temp / timer.time.inSeconds.toDouble(),
          ),
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
        ));
  }

  void _resetTimers() {
    for(int i = 0; i < timers.length; i++){
      _resetTimer(timers[i], i);
    }
  }
}


