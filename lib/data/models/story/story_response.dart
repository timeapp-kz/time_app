import 'package:time_app/data/models/image/image_response.dart';

class StoryResponse {
  int _id;
  ImageResponse _image;
  int _order;

  StoryResponse.map(dynamic object) {
    this._id = object['id'];
    this._image = ImageResponse.map(object['photo']);
    this._order = object['order'];
  }

  int get order => _order;

  ImageResponse get image => _image;

  int get id => _id;

}