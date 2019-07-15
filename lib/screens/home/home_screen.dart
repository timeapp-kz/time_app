import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'package:time_app/utils/common_utils.dart';
import 'package:time_app/resources/values/app_colors.dart';
import 'package:time_app/bloc/home_bloc.dart';
import 'package:time_app/bloc/bloc_provider.dart';
import 'package:time_app/resources/assets/icons/time_icons_icons.dart';
import 'home_services_tabs.dart';
import 'package:time_app/screens/history/history_screen.dart';
import 'package:time_app/screens/notifications/notifications_screen.dart';
import 'package:time_app/screens/search/search_screen.dart';
import 'package:time_app/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;

  AppBar _appBar;

  Widget _appBarTitle;

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeServicesTabs(),
    HistoryScreen(),
    SearchScreen(),
    NotificationsScreen(),
    ProfileScreen()
  ];


  @override
  void initState() {
    bloc = BlocProvider.of<HomeBloc>(context);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: SvgPicture.asset(
          'lib/resources/assets/images/logo.svg',
          color: AppColors.primaryAppColor,
          height: screenAwareHeight(100, context),
          width: screenAwareWidth(240, context),
        ),

      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(TimeIcons.home_icon), title: Text('')),
          BottomNavigationBarItem(icon: Icon(TimeIcons.history_icon), title: Text('')),
          BottomNavigationBarItem(icon: Icon(TimeIcons.search_icon), title: Text('')),
          BottomNavigationBarItem(icon: Icon(TimeIcons.notifications_icon), title: Text('')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('')),
        ],
        unselectedItemColor: Color.fromRGBO(196, 196, 196, 1),
        selectedItemColor: AppColors.primaryAppColor,
        onTap: onTabTapped,

      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


//  _appBarTitle = SvgPicture.asset(
//  'lib/resources/assets/images/logo.svg',
//  color: AppColors.primaryAppColor,
//  height: screenAwareHeight(80, context),
//  width: screenAwareWidth(200, context),
//  );


}