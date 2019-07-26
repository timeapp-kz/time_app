class ServicesResponse {

  int _id;
  String _type;
  String _imgUrl;
  String _state;
  int _status;

  ServicesResponse.map(dynamic object) {
     this._id = object['id'];
     this._type = object['type'];
     this._imgUrl = object['image_url'];
     this._status = object['status'];
     this._state = object['state'];
  }


  String get state => _state;

  int get status => _status;

  String get imgUrl => _imgUrl;

  String get type => _type;

  int get id => _id;


}