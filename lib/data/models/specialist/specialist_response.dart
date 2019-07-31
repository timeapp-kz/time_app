import 'package:time_app/data/models/image/image_response.dart';

class SpecialistResponse {
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  double _rating;
  ImageResponse _photo;

  SpecialistResponse.map(dynamic object) {
    this._id = object['id'];
    this._firstName = object['firstName'];
    this._lastName = object['lastName'];
    this._email = object['email'];
    this._rating = object['rating'];
    this._photo = ImageResponse.map(object['photo']);
  }

  ImageResponse get photo => _photo;

  double get rating => _rating;

  String get email => _email;

  String get lastName => _lastName;

  String get firstName => _firstName;

  int get id => _id;


}