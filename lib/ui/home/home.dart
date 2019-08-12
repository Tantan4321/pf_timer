import 'package:flutter/material.dart';
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
          new GradientAppBar(Theme.of(context).primaryColor,
              Theme.of(context).accentColor, Colors.black, "PF Timer"),
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
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 58),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => TimerCard(
                        timers[index],
                        index: index,
                        onPress: () {
                          //Navigator.of(context).pushNamed("/pokemon-info");
                        },
                      ),
              childCount: timers.length),
            ),
          ),
        ],
      ),
    );
  }
}
