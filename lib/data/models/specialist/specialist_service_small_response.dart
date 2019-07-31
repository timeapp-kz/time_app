class SpecialistServiceSmallResponse {
  int _id;
  String _serviceName;

  SpecialistServiceSmallResponse.map(dynamic object) {
    this._id = object['id'];
    this._serviceName = object['serviceName'];
  }

  String get serviceName => _serviceName;

  int get id => _id;


}