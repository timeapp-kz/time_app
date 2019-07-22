import 'dart:async';

import 'package:time_app/data/models/services_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_app/bloc/bloc_provider.dart';
import 'package:time_app/data/network/repository/time_api.dart';

class HomeBloc implements BlocBase {

  TimeAPI _api = TimeAPI();

  final _servicesListController = StreamController<ServicesResponse>();


  Stream<ServicesResponse> get servicesList => _servicesListController.stream.asBroadcastStream();


  void signOut() async {
    FirebaseAuth.instance.signOut();
  }

  getServices() async {
    ServicesResponse servicesResponse = await _api.getAllServices();
    _servicesListController.sink.add(servicesResponse);
  }



  @override
  void dispose() {
    _servicesListController.close();
  }
}