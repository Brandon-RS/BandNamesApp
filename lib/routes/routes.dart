import 'package:flutter/material.dart';

// Imports
import 'package:band_names/screens/home_screen.dart';
import 'package:band_names/screens/status_screen.dart';

// Exports
export 'package:band_names/screens/home_screen.dart';
export 'package:band_names/screens/status_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder>{
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
      StatusScreen.routeName: (BuildContext context) => const StatusScreen(),
    };
