class LatLngResponse {
  double _lat;
  double _lng;

  LatLngResponse.map(dynamic object) {
    this._lat = object['lat'];
    this._lng = object['lng'];
  }

  double get lng => _lng;

  double get lat => _lat;


}