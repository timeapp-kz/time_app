import 'package:time_app/data/models/customer/customer_response.dart';
import 'package:time_app/data/models/specialist/specialist_service_response.dart';
import 'order_status_response.dart';

class OrderResponse {
  int _id;
  CustomerResponse _customer;
  SpecialistServiceResponse _specialistService;
  DateTime _createDate;
  double _ratingFromCustomer;
  double _ratingFromSpecialist;
  DateTime _customerArrivalTime;
  OrderStatusResponse _orderStatus;

  OrderResponse.map(dynamic object) {
    this._id = object['id'];
    this._customer = CustomerResponse.map(object['customer']);
    this._specialistService = SpecialistServiceResponse.map(object['specialistService']);
    this._createDate = object['createDate'];
    this._ratingFromCustomer = object['ratingFromCustomer'];
    this._ratingFromSpecialist = object['ratingFromSpecialist'];
    this._customerArrivalTime = object['customerArrivalTime'];
    this._orderStatus = object['orderStatus'];
  }


  OrderStatusResponse get orderStatus => _orderStatus;

  DateTime get customerArrivalTime => _customerArrivalTime;

  double get ratingFromSpecialist => _ratingFromSpecialist;

  double get ratingFromCustomer => _ratingFromCustomer;

  DateTime get createDate => _createDate;

  SpecialistServiceResponse get specialistService => _specialistService;

  CustomerResponse get customer => _customer;

  int get id => _id;






}