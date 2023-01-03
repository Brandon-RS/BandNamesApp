import 'package:flutter/material.dart';

// Imports
import 'package:band_names/screens/home_screen.dart';

// Exports
export 'package:band_names/screens/home_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    };
