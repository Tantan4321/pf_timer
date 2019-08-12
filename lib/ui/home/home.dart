import 'package:flutter/material.dart';
import 'package:pf_timer/configs/AppColors.dart';
import 'package:pf_timer/data/timers.dart';
import 'package:pf_timer/widgets/gradient_app_bar.dart';

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
          new GradientAppBar(Theme.of(context).primaryColor, Theme.of(context).accentColor, Colors.black, "PF Timer"),
          new HomePageBody()
        ],
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
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
        itemCount: timers.length,
        itemBuilder: (context, index) => PokemonCard(
          timers[index],
          index: index,
          onPress: () {
            Navigator.of(context).pushNamed("/pokemon-info");
          },
        ),
      ),
    );
  }
}

