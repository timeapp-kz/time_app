import 'package:flutter/material.dart';

import 'package:time_app/bloc/home_bloc.dart';
import 'package:time_app/utils/common_utils.dart';
import 'package:time_app/resources/components/primary_button.dart';
import 'package:time_app/bloc/bloc_provider.dart';
import 'package:time_app/resources/values/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc _bloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      color: Colors.green,
      child: PrimaryButton(
        gradientStops: AppColors.primaryButtonGradientStops,
        gradientColors: AppColors.confirmButtonGradientColors,
        buttonText: 'Log out',
        onPressed: () => _bloc.dispose(),
        height: screenAwareHeight(120, context),
        width: screenAwareWidth(400, context),
      ),
    );
  }
}
