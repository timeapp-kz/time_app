import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:time_app/utils/common_utils.dart';
import 'package:time_app/resources/values/app_colors.dart';
import 'package:time_app/resources/components/primary_button.dart';
import 'package:time_app/bloc/home_bloc.dart';
import 'package:time_app/bloc/bloc_provider.dart';

class HomeServicesTabs extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    
    return DefaultTabController(
      length: 2,
      child: ListView(
        children: <Widget>[
          Container(
            child: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'АКТУАЛЬНЫЕ УСЛУГИ',
                ),
                Tab(
                  text: 'ВСЕ УСЛУГИ',
                ),
              ],
            ),
          ),
          Container(
            height: screenAwareHeight(1200, context),
            child: TabBarView(
              children: <Widget>[
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  padding: EdgeInsets.only(top: screenAwareHeight(40, context)),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'lib/resources/assets/images/services/beauty-icon.svg',
                          height: screenAwareHeight(200, context),
                          width: screenAwareWidth(200, context),
                        ),
                        Text('Красота')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'lib/resources/assets/images/services/medicine-icon.svg',
                          height: screenAwareHeight(200, context),
                          width: screenAwareWidth(200, context),
                        ),
                        Text('Медицина')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'lib/resources/assets/images/services/auto-icon.svg',
                          height: screenAwareHeight(200, context),
                          width: screenAwareWidth(200, context),
                        ),
                        Text('Автосервис')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'lib/resources/assets/images/services/entertainment-icon.svg',
                          height: screenAwareHeight(200, context),
                          width: screenAwareWidth(200, context),
                        ),
                        Text('Развлечения')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'lib/resources/assets/images/services/service-icon.svg',
                          height: screenAwareHeight(200, context),
                          width: screenAwareWidth(200, context),
                        ),
                        Text('Услуги')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          'lib/resources/assets/images/services/tourism-icon.svg',
                          height: screenAwareHeight(200, context),
                          width: screenAwareWidth(200, context),
                        ),
                        Text('Туризм')
                      ],
                    ),
                ],),
                PrimaryButton(
                  gradientStops: AppColors.primaryButtonGradientStops,
                  gradientColors: AppColors.confirmButtonGradientColors,
                  buttonText: 'Log out',
                  onPressed: () => bloc.signOut(),
                  height: screenAwareHeight(120, context),
                  width: screenAwareWidth(400, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentServices() {
    return ListView(
      children: <Widget>[
        Text(
          'АКТУАЛЬНЫЕ УСЛУГИ',
          style: TextStyle(color: Colors.black),
        ),

      ],
    );
  }

  Widget _buildAllServices() {}
}
