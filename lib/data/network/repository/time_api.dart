import 'package:time_app/data/network/utils/network_call.dart';

import 'dart:convert';

class TimeAPI {

  static TimeAPI _instance = TimeAPI.internal();
  TimeAPI.internal();
  factory TimeAPI() => _instance;

  NetworkCall _networkCall = NetworkCall();

  // Authorization
  static const AUTHORIZE = '/oauth/token';
  static const CHECK_TOKEN = '/oauth/check_token';

  // Common
  static const INFRASTRUCTURE = '/infrastructure/all';
  static const CATEGORIES = '/category/all';
  static const ALL_SERVICES = '/category/service/all';
  static const ACTUAL_SERVICES = '/actualService/all';

  // Specialist
  static const SPECIALIST_REGISTER_OR_REFRESH_PASSWORD = '/specialist/profile/registerOrRefreshPassword';
  static const SPECIALIST_PROFILE_GET = '/specialist/profile/get';
  static const SPECIALIST_PROFILE_EDIT = '/specialist/profile/edit';
  static const SPECIALIST_SERVICES_GET_ALL = '/specialist/specialistService/all';
  static const SPECIALIST_SERVICE_GET = '/specialist/specialistService/get';
  static const SPECIALIST_SERVICE_ADD = '/specialist/specialistService/add';
  static const SPECIALIST_SERVICE_EDIT = '/specialist/specialistService/edit';
  static const SPECIALIST_SERVICE_DELETE = '/specialist/specialistService/delete';
  static const SPECIALIST_SET_ONLINE = '/specialist/specialistService/setOnline';
  static const SPECIALIST_SET_OFFLINE = '/specialist/specialistService/setOffline';
  static const SPECIALIST_NOTIFICATIONS_GET = '/specialist/specialistService/notification/all';
  static const SPECIALIST_NOTIFICATION_DELETE = '/specialist/specialistService/notification/delete';
  static const SPECIALIST_ORDER_HISTORY_GET_ALL = '/specialist/specialistService/order/history/all';
  static const SPECIALIST_ORDER_HISTORY_DELETE = '/specialist/specialistService/order/history/delete';
  static const SPECIALIST_ORDER_CURRENT_GET_ALL = '/specialist/specialistService/order/current/all';
  static const SPECIALIST_ORDER_CURRENT_DELETE = '/specialist/specialistService/order/current/delete';
  static const SPECIALIST_ORDER_GET = '/specialist/specialistService/order/get';
  static const SPECIALIST_ORDER_APPROVE = '/specialist/specialistService/order/approve';
  static const SPECIALIST_ORDER_REJECT = '/specialist/specialistService/order/reject';
  static const SPECIALIST_ORDER_RATE = '/specialist/specialistService/order/rate';
  static const SPECIALIST_ORDER_REPORT = '/specialist/specialistService/order/report';
  static const SPECIALIST_REVIEW_GET_ALL = '/specialist/specialistService/review/all';
  static const SPECIALIST_STORY_GET_ALL = '/specialist/story/all';
  static const SPECIALIST_STORY_ADD = '/specialist/story/add';
  static const SPECIALIST_STORY_DELETE = '/specialist/story/delete';
  static const SPECIALIST_CHAT_GET_ALL = '/specialist/chat/all';
  static const SPECIALIST_CHAT_GET = '/specialist/chat/get';
  static const SPECIALIST_CHAT_DELETE = '/specialist/chat/delete';
  static const SPECIALIST_CHAT_MESSAGE_SEND = '/specialist/chat/sendMessage';
  static const SPECIALIST_CHAT_MESSAGE_DELETE = '/specialist/chat/deleteMessage';

  // Customer
  static const CUSTOMER_REGISTER_OR_REFRESH_PASSWORD = '/customer/profile/registerOrRefreshPassword';
  static const CUSTOMER_PROFILE_GET = '/customer/profile/get';
  static const CUSTOMER_PROFILE_EDIT = '/customer/profile/edit';
  static const CUSTOMER_SPECIALIST_SERVICE_GET_ALL = '/customer/specialistService/all';
  static const CUSTOMER_SPECIALIST_SERVICE_GET = '/customer/specialistService/get';
  static const CUSTOMER_SPECIALIST_SERVICE_SEARCH = '/customer/specialistService/search';
  static const CUSTOMER_SPECIALIST_SERVICE_REPORT = '/customer/specialistService/report';
  static const CUSTOMER_SPECIALIST_SERVICE_REVIEW_GET_ALL = '/customer/specialistService/review/all';
  static const CUSTOMER_SPECIALIST_SERVICE_REVIEW_ADD = '/customer/specialistService/review/add';
  static const CUSTOMER_NOTIFICATION_GET_ALL = '/customer/notification/all';
  static const CUSTOMER_NOTIFCATION_DELETE = '/customer/notification/delete';
  static const CUSTOMER_ORDER_CREATE = '/customer/order/create';
  static const CUSTOMER_ORDER_GET = '/customer/order/get';
  static const CUSTOMER_ORDER_CANCEL = ' /customer/order/cancel';
  static const CUSTOMER_ORDER_HISTORY_GET_ALL = '/customer/order/history/all ';
  static const CUSTOMER_ORDER_HISTORY_DELETE = '/customer/order/history/delete';
  static const CUSTOMER_ORDER_RATE = '/customer/order/rate';
  static const CUSTOMER_FAVOURITE_SPECIALIST_GET_ALL = '/customer/favoriteSpecialist/all';
  static const CUSTOMER_FAVOURITE_SPECIALIST_ADD = ' /customer/favoriteSpecialist/add';
  static const CUSTOMER_FAVOURITE_SPECIALIST_DELETE = '/customer/favoriteSpecialist/remove';
  static const CUSTOMER_SPECIALIST_STORY_GET_ALL = '/customer/specialist/story/all';
  static const CUSTOMER_CHAT_GET_ALL = '/customer/chat/all';
  static const CUSTOMER_CHAT_GET = '/customer/chat/get';
  static const CUSTOMER_CHAT_DELETE = '/customer/chat/delete';
  static const CUSTOMER_CHAT_MESSAGE_SEND = '/customer/chat/sendMessage';
  static const CUSTOMER_CHAT_MESSAGE_DELETE = '/customer/chat/deleteMessage';










  Future<dynamic> getAllServices() async {

    dynamic response = await _networkCall.doRequest(path: ALL_SERVICES, method: 'GET', context: null);

    List<dynamic> servicesList = List();

    if (response.isNotEmpty) {
      for (final service in response) {
      }
    }

    return servicesList;
  }


  Future<dynamic> getActualServices() async {

    dynamic response = await _networkCall.doRequest(path: ACTUAL_SERVICES, method: 'GET', context: null);

    List<dynamic> servicesList = List();

    if (response.isNotEmpty) {
      for (final service in response) {
      }
    }

    return servicesList;
  }

  Future<dynamic> getSubServicesByType(String serviceType) async {
    String requestUrl = '/$serviceType';

    dynamic response = await _networkCall.doRequest(path: requestUrl, method: 'GET', context: null);

    List<dynamic> servicesList = List();

    if (response != null && response.isNotEmpty) {
      for (final service in response) {
      }
    }

    return servicesList;
  }


  Future<dynamic> getMasters(String serviceType) async {

    dynamic response = await _networkCall.doRequest(path: '', method: 'GET', context: null);

    List<dynamic> servicesList = List();

    if (response != null && response.isNotEmpty) {
      for (final service in response) {
      }
    }

    return servicesList;
  }

}