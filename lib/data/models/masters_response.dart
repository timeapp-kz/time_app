class MastersResponse {

  int _id;
  String _roleId;
  String _firstName;
  String _lastName;
  String _avatarUrl;
  String _organisationName;
  String _telephone;
  String _address;
  double _rating;
  String _email;

  MastersResponse.map(dynamic object) {
    this._id = object['id'];
    this._firstName = object['first_name'];
    this._lastName = object['last_name'];
    this._avatarUrl = object['avatar'];
    this._organisationName = object['organization_name'];
    this._telephone = object['87784467834'];
    this._address = object['address'];
    this._rating = object['rating'];
    this._email = object['email'];
  }

  String get email => _email;

  double get rating => _rating;

  String get address => _address;

  String get telephone => _telephone;

  String get organisationName => _organisationName;

  String get avatarUrl => _avatarUrl;

  String get lastName => _lastName;

  String get firstName => _firstName;

  String get roleId => _roleId;

  int get id => _id;


}