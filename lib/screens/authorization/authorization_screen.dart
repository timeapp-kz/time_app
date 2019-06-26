import 'package:flutter/material.dart';

import 'package:time_app/utils/common_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthorizationScreenState();
  }
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {

  int _smsCountdown = 60;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          ListView(
            children: <Widget>[
              SizedBox(
                height: screenAwareHeight(1680.0, context),
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    _buildPhoneInputPage(),
                    _buildCodeInputPage()
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: screenAwareHeight(40, context),),
              Text('Начните зарабатывать сейчас! Войдите как предприниматель', textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.black,
                  fontSize: screenAwareHeight(28, context)
              ),),
            ],
          )
    );
  }

  ////////////////////////////////////////////////////////////////////
  // Building UI elements
  ////////////////////////////////////////////////////////////////////
  Widget _buildPhoneInputPage() {
    return Column(
      children: <Widget>[
        _buildBackgroundImage(),
        _buildPhoneNumberInputField()
      ],
    );
  }

  Widget _buildCodeInputPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: screenAwareHeight(256, context),),
        _buildCodeInputField(),
        SizedBox(height: screenAwareHeight(56, context),),
        SizedBox(width: screenAwareWidth(400, context),
            child: Text('Вы получите СМС код в течение $_smsCountdown сек', textAlign: TextAlign.center,),
          ) ,
        SizedBox(height: screenAwareHeight(56, context),),
        _buildCodeInputButtons()
      ],
    );
  }

  Widget _buildBackgroundImage() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          height: screenAwareHeight(1280.0, context),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(
                    'lib/resources/assets/images/authorization_bg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Color.fromRGBO(0, 0, 0, 110), BlendMode.darken)),
            border: Border.all(style: BorderStyle.none),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(screenAwareHeight(90, context)),
                bottomRight: Radius.circular(screenAwareHeight(90, context))),

          ),
        ),
        _buildLogoAndSlogan()
      ],
    ) ;
  }

  Widget _buildLogoAndSlogan() {
    TextStyle sloganStyle = TextStyle(
        color: Colors.white,
        fontSize: screenAwareHeight(52, context)
    );

    return Positioned(
      top: screenAwareHeight(280, context),
      left: screenAwareWidth(120, context),
      child: SizedBox(
        height: screenAwareHeight(760, context),
        width: screenAwareWidth(640, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SvgPicture.asset(
              'lib/resources/assets/images/logo.svg',
              color: Colors.white,
              height: screenAwareHeight(200, context),
              width: screenAwareWidth(300, context),
            ),
            SizedBox(
              height: screenAwareHeight(100, context),
            ),
            Container(
              height: screenAwareHeight(10, context),
              width: screenAwareWidth(240, context),
              color: Colors.white,
            ),
            SizedBox(
              height: screenAwareHeight(100, context),
            ),
            Text('Записывайтесь', style: sloganStyle,),
            Text('без очередей', style: sloganStyle,),
            Text('без проблем', style: sloganStyle,),
            Text('без потери времени', style: sloganStyle,),
          ],
        ),
      ),);
  }

  Widget _buildPhoneNumberInputField() {
    return Column(
      children: <Widget>[
        SizedBox(height: screenAwareHeight(60, context),),
        Text('Войти с помощью номера', textAlign: TextAlign.center, style: TextStyle(
            color: Colors.black,
            fontSize: screenAwareHeight(42, context)
        ),),
        SizedBox(height: screenAwareHeight(40, context),),
        Center(
          child: SizedBox(
            width: screenAwareWidth(640, context),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '+7 (777) 777 77 77',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none)),
              ),
              style: TextStyle(
                  fontSize: screenAwareHeight(52, context)),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCodeInputField() {
    return Center(
      child: SizedBox(
        width: screenAwareWidth(384, context),
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '123456',
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none)),
          ),
          style: TextStyle(
              fontSize: screenAwareHeight(52, context)),
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
            ),
            height: screenAwareHeight(180, context),
            width: screenAwareWidth(180, context),
            child: Icon(Icons.refresh, size: screenAwareHeight(120, context), color: Colors.white,),
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green
            ),
            height: screenAwareHeight(180, context),
            width: screenAwareWidth(180, context),
            child: Icon(Icons.arrow_forward_ios, size: screenAwareHeight(120, context), color: Colors.white,),
          ),
        ],
      ),
    );
  }


}
