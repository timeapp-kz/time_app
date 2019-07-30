import 'package:time_app/data/network/utils/network_call.dart';
import 'package:time_app/data/models/services_response.dart';
import 'package:time_app/data/models/masters_response.dart';

import 'dart:convert';

class TimeAPI {

  static TimeAPI _instance = TimeAPI.internal();
  TimeAPI.internal();
  factory TimeAPI() => _instance;

  NetworkCall _networkCall = NetworkCall();

  static final ALL_SERVICES = '/getMain';
  static final ACTUAL_SERVICES = '/getActual';
  static final SUBSERVICES = '/getItem';
  static final MASTERS = '/getListOfMasterOnline';

  Future<List<ServicesResponse>> getAllServices() async {

    dynamic response = await _networkCall.doRequest(path: ALL_SERVICES, method: 'GET', context: null);

    List<ServicesResponse> servicesList = List();

    if (response.isNotEmpty) {
      for (final service in response) {
        servicesList.add(ServicesResponse.map(service));
      }
    }

    return servicesList;
  }


  Future<List<ServicesResponse>> getActualServices() async {

    dynamic response = await _networkCall.doRequest(path: ACTUAL_SERVICES, method: 'GET', context: null);

    List<ServicesResponse> servicesList = List();

    if (response.isNotEmpty) {
      for (final service in response) {
        servicesList.add(ServicesResponse.map(service));
      }
    }

    return servicesList;
  }

  Future<List<ServicesResponse>> getSubServicesByType(String serviceType) async {
    String requestUrl = SUBSERVICES + '/$serviceType';

    dynamic response = await _networkCall.doRequest(path: requestUrl, method: 'GET', context: null);

    List<ServicesResponse> servicesList = List();

    if (response != null && response.isNotEmpty) {
      for (final service in response) {
        servicesList.add(ServicesResponse.map(service));
      }
    }

    return servicesList;
  }


  Future<List<MastersResponse>> getMasters(String serviceType) async {

    dynamic response = await _networkCall.doRequest(path: MASTERS, method: 'GET', context: null);

    List<MastersResponse> servicesList = List();

    if (response != null && response.isNotEmpty) {
      for (final service in response) {
        servicesList.add(MastersResponse.map(service));
      }
    }

    return servicesList;
  }

}