import 'dart:io';

import 'package:settings_yaml/settings_yaml.dart';

import '../utils/constants.dart';

class Config {
  static final String _configurationFilePath = '${Directory.current.path}';
  static final String _configurationFile = '$configurationFileName.yaml';

  static String _nodeUrlWs = 'ws://127.0.0.1:35998';

  static String get nodeUrlWs {
    return _nodeUrlWs;
  }

  static void load() {
    Directory(_configurationFilePath).createSync();
    final settings = SettingsYaml.load(
        pathToSettings: '$_configurationFilePath/$_configurationFile');
    _nodeUrlWs = settings['node_url_ws'] ?? _nodeUrlWs;
  }
}
