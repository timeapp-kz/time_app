import 'package:time_app/data/models/customer/customer_response.dart';
import 'package:time_app/data/models/specialist/specialist_response.dart';

class ChatResponse {
  CustomerResponse _customer;
  SpecialistResponse _specialist;
  String _lastMessage;
  DateTime _lastMessageDate;

  ChatResponse.map(dynamic object) {
    this._customer = CustomerResponse.map(object['customer']);
    this._specialist = SpecialistResponse.map(object['specialist']);
    this._lastMessage = object['lastMessage'];
    this._lastMessageDate = object['lastMessageDate'];
  }

  DateTime get lastMessageDate => _lastMessageDate;

  String get lastMessage => _lastMessage;

  SpecialistResponse get specialist => _specialist;

  CustomerResponse get customer => _customer;


}