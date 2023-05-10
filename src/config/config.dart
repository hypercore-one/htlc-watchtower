import 'dart:io';
import 'dart:math';

import 'package:settings_yaml/settings_yaml.dart';

import '../utils/constants.dart';

class Config {
  static final String _configurationFilePath = '${Directory.current.path}';
  static final String _configurationFile = '$configurationFileName.yaml';

  static String _nodeUrlWs = 'ws://127.0.0.1:35998';
  static int _unlockThresholdInMinutes = 60;

  static String get nodeUrlWs {
    return _nodeUrlWs;
  }

  static int get unlockThresholdInMinutes {
    return _unlockThresholdInMinutes;
  }

  static void load() {
    Directory(_configurationFilePath).createSync();
    final settings = SettingsYaml.load(
        pathToSettings: '$_configurationFilePath/$_configurationFile');
    _nodeUrlWs = settings['node_url_ws'] ?? _nodeUrlWs;
    _unlockThresholdInMinutes =
        max(settings['unlock_threshold_in_minutes'] ?? 60, 30);
  }
}
