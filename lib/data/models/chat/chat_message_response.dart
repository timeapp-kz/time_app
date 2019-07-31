class ChatMessageResponse {
  int _id;
  String _message;
  bool _isCustomer;
  DateTime _createDate;

  ChatMessageResponse.map(dynamic object) {
    this._id = object['id'];
    this._message = object['message'];
    this._isCustomer = object['isCustomer'];
    this._createDate = object['createDate'];
  }

  DateTime get createDate => _createDate;

  bool get isCustomer => _isCustomer;

  String get message => _message;

  int get id => _id;


}