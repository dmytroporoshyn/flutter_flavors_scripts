import 'flavors.dart';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flavors_auto/app.dart';
import 'package:flutter_flavors_auto/utils/configuration.dart';
import 'package:flutter_flavors_auto/firebase_options_[[FLAVOR_NAME]].dart';

Future<void> main() async {
  F.appFlavor = Flavor.[[FLAVOR_NAME]];
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _readConfiguration();
  runApp(const App());
}

Future<void> _readConfiguration() async {
  String source = await rootBundle.loadString('assets/configuration.json');
  var json = jsonDecode(source);
  var appTitle = json['app_title'];
  Configuration.appTitle = appTitle;
}