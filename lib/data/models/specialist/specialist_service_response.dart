import 'specialist_response.dart';
import 'specialist_service_price_response.dart';
import 'package:time_app/data/models/location/lat_lng_response.dart';
import 'package:time_app/data/models/infrastructure/infrastructure_response.dart';
import 'package:time_app/data/models/image/image_response.dart';

class SpecialistServiceResponse {
  int _id;
  SpecialistResponse _specialist;
  String _serviceName;
  String _organizationName;
  String _address;
  String _phoneNumber;
  LatLngResponse _latLng;
  String _instagramCode;
  List<InfrastructureResponse> _infrastructures;
  List<SpecialistServicePriceResponse> _specialistServicePrices;
  List<ImageResponse> _images;
  int _orderCount;
  String _distance;
  DateTime _lastOnlineDate;

  SpecialistServiceResponse.map(dynamic object) {
    this._id = object['id'];
    this._specialist = object['specialist'];
    this._serviceName = object['serviceName'];
    this._organizationName = object['organizationName'];
    this._address = object['address'];
    this._phoneNumber = object['phoneNumber'];
    this._latLng = LatLngResponse.map(object['latLng']);
    this._instagramCode = object['instagramCode'];
    this._orderCount = object['orderCount'];
    this._distance = object['distance'];
    this._lastOnlineDate = object['lastOnlineDate'];


    List infrastructuresList = object['infrastructures'];
    List specialistServicePricesList = object['specialistServicePrices'];
    List imagesList = object['images'];

    for (final infrastructure in infrastructuresList) {
      this._infrastructures.add(InfrastructureResponse.map(infrastructure));
    }

    for (final specialistServicePrice in specialistServicePricesList) {
      this._specialistServicePrices.add(SpecialistServicePriceResponse.map(specialistServicePrice));
    }

    for (final image in imagesList) {
      this._images.add(ImageResponse.map(image));
    }
  }

  DateTime get lastOnlineDate => _lastOnlineDate;

  String get distance => _distance;

  int get orderCount => _orderCount;

  List<ImageResponse> get images => _images;

  List<SpecialistServicePriceResponse> get specialistServicePrices =>
      _specialistServicePrices;

  List<InfrastructureResponse> get infrastructures => _infrastructures;

  String get instagramCode => _instagramCode;

  LatLngResponse get latLng => _latLng;

  String get phoneNumber => _phoneNumber;

  String get address => _address;

  String get organizationName => _organizationName;

  String get serviceName => _serviceName;

  SpecialistResponse get specialist => _specialist;

  int get id => _id;


}