import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_app/bloc/bloc_provider.dart';

class HomeBloc implements BlocBase {
  @override
  void dispose() {
  }

  void signOut() async {
    FirebaseAuth.instance.signOut();
  }

}