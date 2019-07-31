class FirebaseResponse {
  String _phoneNumber;
  String _uid;

  FirebaseResponse.map(dynamic object) {
    this._phoneNumber = object['phoneNumber'];
    this._uid = object['uid'];
  }

  String get uid => _uid;

  String get phoneNumber => _phoneNumber;


}