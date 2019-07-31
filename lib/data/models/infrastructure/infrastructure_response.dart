class InfrastructureResponse {
  int _id;
  String _name;

  InfrastructureResponse.map(dynamic object) {
      this._id = object['id'];
      this._name = object['name'];
  }

  String get name => _name;

  int get id => _id;
}