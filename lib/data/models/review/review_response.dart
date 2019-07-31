import 'package:time_app/data/models/customer/customer_response.dart';

class ReviewResponse {
  int _id;
  CustomerResponse _customer;
  int _customerReviewCount;
  DateTime _createDate;
  String _message;
  double _rating;

  ReviewResponse.map(dynamic object) {
    this._id = object['id'];
    this._customer = CustomerResponse.map(object['customer']);
    this._customerReviewCount = object['customerReviewCount'];
    this._createDate = object['createDate'];
    this._message = object['message'];
    this._rating = object['rating'];

  }

  double get rating => _rating;

  String get message => _message;

  DateTime get createDate => _createDate;

  int get customerReviewCount => _customerReviewCount;

  CustomerResponse get customer => _customer;

  int get id => _id;


}