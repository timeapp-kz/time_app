import 'package:time_app/data/models/customer/customer_response.dart';
import 'package:time_app/data/models/specialist/specialist_service_response.dart';

class OrderHistoryResponse {
  int _id;
  CustomerResponse _customer;
  SpecialistServiceResponse _specialistService;
  DateTime _createDate;

  OrderHistoryResponse.map(dynamic object) {
    this._id = object['id'];
    this._customer = CustomerResponse.map(object['customer']);
    this._specialistService = SpecialistServiceResponse.map(object['specialistService']);
    this._createDate = object['createDate'];
  }

  DateTime get createDate => _createDate;

  SpecialistServiceResponse get specialistService => _specialistService;

  CustomerResponse get customer => _customer;

  int get id => _id;


}