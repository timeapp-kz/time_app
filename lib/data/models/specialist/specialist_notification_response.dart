import 'package:time_app/data/models/customer/customer_response.dart';

class SpecialistNotificationResponse {
  int _id;
  CustomerResponse _customer;
  String _message;

  SpecialistNotificationResponse.map(dynamic object) {
    this._id = object['id'];
    this._customer = CustomerResponse.map(object['customer']);
    this._message = object['message'];
  }

  String get message => _message;

  CustomerResponse get customer => _customer;

  int get id => _id;


}