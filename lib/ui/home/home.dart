import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';
import 'package:pf_timer/data/timers.dart';
import 'package:pf_timer/widgets/gradient_app_bar.dart';
import 'package:pf_timer/widgets/timer_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar(
            primary: Theme
                .of(context)
                .primaryColor,
            secondary: Theme
                .of(context)
                .accentColor,
            textColor: AppColors.gunmetal,
            title: "PF Timer",
            leading: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 40.0,
              color: AppColors.gunmetal,
              onPressed: () => _handleMenuButton(),
            ),
          ),
          new HomePageBody()
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

  void _handleMenuButton() {

  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
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
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
                    },
                  ),
                  TimerCard(
                    timers[i],
                    index: i++,
                    onPress: () {
                      //Navigator.of(context).pushNamed("/pokemon-info");
                    },
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
