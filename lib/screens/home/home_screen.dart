import 'package:flutter/material.dart';

import 'package:time_app/resources/components/primary_button.dart';
import 'package:time_app/utils/common_utils.dart';
import 'package:time_app/resources/values/app_colors.dart';
import 'package:time_app/bloc/home_bloc.dart';
import 'package:time_app/bloc/bloc_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('ASD'),
      ),
      body: PrimaryButton(
        gradientStops: AppColors.primaryButtonGradientStops,
        gradientColors: AppColors.confirmButtonGradientColors,
        buttonText: 'Log out',
        onPressed: () => bloc.signOut(),
        height: screenAwareHeight(120, context),
        width: screenAwareWidth(400, context),
      ),
    );
  }

}