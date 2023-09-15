// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:battery_plus/src/battery_plus_web.dart';
import 'package:file_saver/file_saver_web.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:printing/printing_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  BatteryPlusWebPlugin.registerWith(registrar);
  FileSaverWeb.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  PrintingPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}