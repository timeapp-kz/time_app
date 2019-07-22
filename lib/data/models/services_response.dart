class ServicesResponse {

  int _id;
  String _type;
  String _imgUrl;
  int _status;

  ServicesResponse.map(dynamic object) {
    print('99999999999999999999999' + object.toString());
     this._id = object['id'];
     this._type = object['type'];
     this._imgUrl = object['image_url'];
     this._status = object['status'];
  }

  int get status => _status;

  String get imgUrl => _imgUrl;

  String get type => _type;

  int get id => _id;


}