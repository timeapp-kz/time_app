import 'package:time_app/data/models/specialist/specialist_response.dart';

class CustomerNotificationResponse {
  int _id;
  SpecialistResponse _specialist;
  String _message;

  CustomerNotificationResponse.map(dynamic object) {
    this._id = object['id'];
    this._specialist = SpecialistResponse.map(object['specialist']);
    this._message = object['message'];
  }

  String get message => _message;

  SpecialistResponse get customer => _specialist;

  int get id => _id;


}