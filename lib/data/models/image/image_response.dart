class ImageResponse {
  int _id;
  String _imgUrl;
  String _previewUrl;
  int _order;

  ImageResponse.map(dynamic object) {
    this._id = object['id'];
    this._imgUrl = object['imgUrl'];
    this._previewUrl = object['previewUrl'];
    this._order = object['order'];
  }

  int get order => _order;

  String get previewUrl => _previewUrl;

  String get imgUrl => _imgUrl;

  int get id => _id;


}