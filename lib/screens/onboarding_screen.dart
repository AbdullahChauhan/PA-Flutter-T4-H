import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pa_flutter_t4H/screens/auth/phone_auth.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 12.0 : 10.0,
      width: isActive ? 12.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
        border: isActive ? null : Border.all(width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white),
        child: SafeArea(
          minimum: EdgeInsets.only(bottom: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 500,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 300,
                            child: SvgPicture.asset(
                              'assets/images/undraw1.svg',
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 300,
                            child: SvgPicture.asset(
                              'assets/images/undraw2.svg',
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. Lorem ipsum, or lipsum as it is sometimes known.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 300,
                            child: SvgPicture.asset(
                              'assets/images/undraw3.svg',
                            ),
                          ),
                          Text(
                            "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 60.0,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: GestureDetector(
                onTap: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return AuthGetPhone();
                  }))
                },
                child: Center(
                  child: Text(
                    'Get started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
