import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pf_timer/configs/themes.dart';
import 'package:pf_timer/ui/home/home.dart';
import 'package:pf_timer/widgets/fade_page_route.dart';

void main() => runApp(PfTimer());

class PfTimer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? AppThemes.kIOSTheme
          : AppThemes.kDefaultTheme,
      onGenerateRoute: _getRoute,
    );
  }

  Route _getRoute(RouteSettings settings){
    switch (settings.name) {
      case "/":
        return FadeRoute(page: Home());
      /*
      case '/pokedex':
        return FadeRoute(page: Pokedex());

      case '/pokemon-info':
        return FadeRoute(page: PokemonInfo());
      */

      default:
        return null;
    }
  }
}

