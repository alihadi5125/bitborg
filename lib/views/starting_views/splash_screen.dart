import 'package:bitborg/views/onboarding_views/onboarding_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/custom_widgets/status_bar_configuration.dart';
import '../../models/custom_models/color_constraints.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool imageContainer = false;
  bool secondImageContainer = false;
  bool backgroundColorVisible = false;
  bool bitBorgTextContainerVisible = false;
  bool textContainerVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        imageContainer = true;
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        secondImageContainer = true;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      setState(() {
        backgroundColorVisible = true;
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  const OnBoardingPageView()),);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
      child: Scaffold(
        backgroundColor: AppColors.blackishColor,
        body: Container(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                left: imageContainer ? MediaQuery.of(context).size.width*.18 : -MediaQuery.of(context).size.width,
                child: SizedBox(
                  height: 1.sh,
                  width: 1.sw/3.8,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedOpacity(
                      opacity: backgroundColorVisible ? 0.0 : 1,
                      duration: const Duration(seconds: 1),
                      child: Image.asset(
                        'assets/images/Group 1176.png',
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                right: secondImageContainer ? MediaQuery.of(context).size.width*.12 :  -MediaQuery.of(context).size.width,
                child: SizedBox(
                    height: 1.sh,
                    width: 1.sw/2.4,
                    child: AnimatedOpacity(
                      opacity: backgroundColorVisible ? 0.0 : 1,
                      duration: const Duration(seconds: 1),
                      child: Image.asset(
                        'assets/images/bitborg.png',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
