import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'package:time_app/main.dart';
import 'package:time_app/config/app_config.dart';

void main() async{
  var configuredApp = new AppConfig(
    child: TimeApp(),
  );

  await GlobalConfiguration().loadFromPath('lib/resources/configs/beta_config.json');

  runApp(configuredApp);
}