import 'package:time_app/data/network/utils/network_call.dart';
import 'package:time_app/data/models/services_response.dart';


import 'dart:convert';

class TimeAPI {

  static TimeAPI _instance = TimeAPI.internal();
  TimeAPI.internal();
  factory TimeAPI() => _instance;

  NetworkCall _networkCall = NetworkCall();

  static final SERVICES = '/getIcons';

  Future<ServicesResponse> getAllServices() async {

    dynamic response = await _networkCall.doRequest(path: SERVICES, method: 'GET', context: null);

    return ServicesResponse.map(response);
  }


}