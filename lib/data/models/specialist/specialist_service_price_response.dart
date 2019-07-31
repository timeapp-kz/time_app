class SpecialistServicePriceResponse {
  int _id;
  int _price;
  String _name;
  String _time;

  SpecialistServicePriceResponse.map(dynamic object) {
    this._id = object['id'];
    this._price = object['price'];
    this._name = object['name'];
    this._time = object['time'];
  }

  String get time => _time;

  String get name => _name;

  int get price => _price;

  int get id => _id;


}