import 'package:time_app/data/models/customer/customer_response.dart';
import 'package:time_app/data/models/specialist/specialist_service_price_response.dart';

class OrderCurrentResponse {
  int _id;
  CustomerResponse _customer;
  SpecialistServicePriceResponse _specialistServicePrice;
  String _organizationName;
  String _time;

  OrderCurrentResponse.map(dynamic object) {
    this._id = object['id'];
    this._customer = CustomerResponse.map(object['customer']);
    this._specialistServicePrice = SpecialistServicePriceResponse.map(object['specialistServicePrice']);
    this._organizationName = object['organizationName'];
    this._time = object['_ime'];
  }

  String get time => _time;

  String get organizationName => _organizationName;

  SpecialistServicePriceResponse get specialistServicePrice => _specialistServicePrice;

  CustomerResponse get customer => _customer;

  int get id => _id;




}