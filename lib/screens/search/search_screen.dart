import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

class SearchScreen extends StatelessWidget {

  static GlobalConfiguration _configuration = GlobalConfiguration();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_configuration.getString('envName')),
    );
  }

}