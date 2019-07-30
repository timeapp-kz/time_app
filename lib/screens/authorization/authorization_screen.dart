import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'dart:async';

import 'package:time_app/utils/common_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_app/resources/components/primary_button.dart';
import 'package:time_app/resources/values/app_dimensions.dart';
import 'package:time_app/resources/values/app_colors.dart';
import 'package:time_app/bloc/authorization_bloc.dart';
import 'package:time_app/bloc/bloc_provider.dart';
import 'package:time_app/bloc/application_bloc.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthorizationScreenState();
  }
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _smsCountdown = 10;
  PageController _pageController = PageController(initialPage: 0);
  AuthorizationBloc bloc;
  ApplicationBloc appBloc;

  Timer _timer;

  Country _country = Country(isoCode: 'kz', phoneCode: '7');
  String _countryCode = '7'; // Default country code is for Spain
  bool _smsCodeSent = false;

  MaskedTextController _phoneValueController =
      MaskedTextController(mask: '(000) 000 00 00');
  TextEditingController _smsCodeValueController = TextEditingController();

  @override
  void initState() {
    bloc = BlocProvider.of<AuthorizationBloc>(context);
    _countryCode = '+${_country.phoneCode}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: WillPopScope(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: screenAwareHeight(400, context),
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    color: AppColors.primaryAppColor,
                    height: screenAwareHeight(200, context),
                    width: screenAwareWidth(300, context),
                  ),
                ),
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                    return false;
                  },
                  child: SizedBox(
                    height: screenAwareHeight(1050.0, context),
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      children: <Widget>[
                        _buildPhoneInputPage(),
                        _buildCodeInputPage()
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: screenAwareHeight(40, context),
                ),
                Text(
                  'Начните зарабатывать сейчас! Войдите как предприниматель',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenAwareHeight(28, context),
                  ),
                ),
              ],
            ),
            onWillPop: () => exitApp(context)));
  }

  ////////////////////////////////////////////////////////////////////
  // Building UI elements
  ////////////////////////////////////////////////////////////////////

  Widget _buildPhoneInputPage() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: screenAwareHeight(60, context),
        ),
        Text(
          'Войти с помощью номера',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: screenAwareHeight(42, context)),
        ),
        SizedBox(
          height: screenAwareHeight(40, context),
        ),
        _buildPhoneNumberInputField(),
        SizedBox(
          height: screenAwareHeight(80, context),
        ),
        PrimaryButton(
          gradientColors: AppColors.confirmButtonGradientColors,
          gradientStops: AppColors.primaryButtonGradientStops,
          buttonText: 'Отправить код',
          height: screenAwareHeight(100, context),
          width: screenAwareWidth(600, context),
          onPressed: () => _sendSms(),
        )
      ],
    );
  }

  Widget _buildCodeInputPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: screenAwareHeight(60, context),
        ),
        Text(
          'Введите код',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: screenAwareHeight(42, context)),
        ),
        SizedBox(
          height: screenAwareHeight(40, context),
        ),
        _buildCodeInputField(),
        SizedBox(
          height: screenAwareHeight(56, context),
        ),
        SizedBox(
          height: screenAwareHeight(90, context),
          width: screenAwareWidth(400, context),
          child: Text(
            _smsCodeSent
                ? 'Вы получите СМС код в течение $_smsCountdown сек'
                : '',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: screenAwareHeight(56, context),
        ),
        _buildCodeInputButtons(),
        SizedBox(
          height: screenAwareHeight(30, context),
        ),
      ],
    );
  }

//  Widget _buildBackgroundImage() {
//    return Stack(
//      children: <Widget>[
//        Container(
//          alignment: Alignment.topCenter,
//          height: screenAwareHeight(1280.0, context),
//          decoration: BoxDecoration(
//            image: DecorationImage(
//                image: ExactAssetImage(
//                    'assets/images/authorization_bg.jpg'),
//                fit: BoxFit.cover,
//                colorFilter: ColorFilter.mode(
//                    Color.fromRGBO(0, 0, 0, 110), BlendMode.darken)),
//            border: Border.all(style: BorderStyle.none),
//            borderRadius: BorderRadius.only(
//                bottomLeft: Radius.circular(screenAwareHeight(90, context)),
//                bottomRight: Radius.circular(screenAwareHeight(90, context))),
//          ),
//        ),
//        _buildLogoAndSlogan()
//      ],
//    );
//  }

//  Widget _buildLogoAndSlogan() {
//    TextStyle sloganStyle = TextStyle(
//        color: Colors.white, fontSize: screenAwareHeight(52, context));
//
//    return Positioned(
//      top: screenAwareHeight(280, context),
//      left: screenAwareWidth(120, context),
//      child: SizedBox(
//        height: screenAwareHeight(760, context),
//        width: screenAwareWidth(640, context),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            SvgPicture.asset(
//              'assets/images/logo.svg',
//              color: Colors.white,
//              height: screenAwareHeight(200, context),
//              width: screenAwareWidth(300, context),
//            ),
//            SizedBox(
//              height: screenAwareHeight(100, context),
//            ),
//            Container(
//              height: screenAwareHeight(10, context),
//              width: screenAwareWidth(240, context),
//              color: Colors.white,
//            ),
//            SizedBox(
//              height: screenAwareHeight(100, context),
//            ),
//            Text(
//              'Записывайтесь',
//              style: sloganStyle,
//            ),
//            Text(
//              'без очередей',
//              style: sloganStyle,
//            ),
//            Text(
//              'без проблем',
//              style: sloganStyle,
//            ),
//            Text(
//              'без потери времени',
//              style: sloganStyle,
//            ),
//          ],
//        ),
//      ),
//    );
//  }

  Widget _buildPhoneNumberInputField() {
    return SizedBox(
      width: screenAwareWidth(640, context),
      child: TextField(
        controller: _phoneValueController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontSize: screenAwareHeight(42, context),
          ),
          hintText: '(777) 777 77 77',
          filled: true,
          fillColor: Colors.white,
          prefixIcon: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: screenAwareWidth(200.0, context),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CountryPickerUtils.getDefaultFlagImage(_country),
                  ),
                  SizedBox(
                    width: screenAwareWidth(10, context),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      _countryCode,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenAwareHeight(42, context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: _openCountryPickerDialog,
          ),
        ),
        style: TextStyle(fontSize: screenAwareHeight(42, context)),
      ),
    );
  }

  Widget _buildCodeInputField() {
    return Center(
      child: SizedBox(
        width: screenAwareWidth(384, context),
        child: TextField(
          controller: _smsCodeValueController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '123456',
            filled: true,
            fillColor: Colors.white,
          ),
          style: TextStyle(fontSize: screenAwareHeight(52, context)),
        ),
      ),
    );
  }

  Widget _buildCodeInputButtons() {
    return SizedBox(
      width: screenAwareWidth(480, context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: screenAwareHeight(180, context),
              width: screenAwareWidth(180, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops:
                      _smsCodeSent ? [1] : AppColors.primaryButtonGradientStops,
                  colors: _smsCodeSent
                      ? [Colors.grey]
                      : AppColors.confirmButtonGradientColors,
                ),
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Icon(
                  Icons.refresh,
                  size: screenAwareHeight(100, context),
                ),
                onPressed: _smsCodeSent
                    ? null
                    : () => _pageController.animateToPage(0,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.ease),
              )),
          Container(
              height: screenAwareHeight(180, context),
              width: screenAwareWidth(180, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: AppColors.primaryButtonGradientStops,
                  colors: AppColors.confirmButtonGradientColors,
                ),
              ),
              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: screenAwareHeight(100, context),
                ),
                onPressed: () => _doLogin(),
              )),
        ],
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////
  // UI Functions
  ////////////////////////////////////////////////////////////////////

  void _openCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => Container(
            child: CountryPickerDialog(
              searchCursorColor: AppColors.primaryAppColor,
              searchInputDecoration: InputDecoration(
                hintText: 'Search...',
              ),
              isSearchable: true,
              onValuePicked: (Country country) => setState(() {
                    _country = country;
                    _countryCode = '+${country.phoneCode}';
                  }),
              title: Text(
                'Выберите страну',
              ),
              itemBuilder: (Country country) => Container(
                    child: Row(
                      children: <Widget>[
                        CountryPickerUtils.getDefaultFlagImage(country),
                        Text(
                          ' +${country.phoneCode} ${country.isoCode}',
                          style: TextStyle(
                              fontSize: screenAwareHeight(
                                  Theme.of(context).textTheme.body2.fontSize,
                                  context),
                              color: Theme.of(context).textTheme.body2.color),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
    );
  }

  void _sendSms() {
    FocusScope.of(context).requestFocus(FocusNode());
    String formattedPhone =
        _phoneValueController.text.replaceAll(RegExp(r'\s\b|\b\s'), '');
    String phoneNumber = _countryCode + formattedPhone;

    print(phoneNumber + ' ' + phoneNumber.length.toString());

    if (phoneNumber.length < 14) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Введите действующий номер телефона'),
        ),
      );
    } else {
      setState(() {
        _smsCodeSent = true;
      });
      _pageController.animateToPage(1,
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _startSmsTimer();
      bloc.sendCode(phoneNumber);
    }
  }

  void _doLogin() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_smsCodeValueController.text.length < 6) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Пожалуйста введите код'),
        ),
      );
    } else {
      bloc.signIn(_smsCodeValueController.text);
    }
  }

  void _startSmsTimer() {
    if (mounted) {
      _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => setState(() {
              if (_smsCountdown < 1) {
                _smsCountdown = 10;
                _timer.cancel();
                setState(() {
                  _smsCodeSent = false;
                });
              } else {
                _smsCountdown = _smsCountdown - 1;
              }
            }),
      );
    }
  }
}
