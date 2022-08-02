import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticProperties {

  static String selectedCountry = '';

  static TextEditingController countryController = TextEditingController();

  static final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  static final GlobalKey<ScaffoldState> profileDrawerKey = GlobalKey<ScaffoldState>();

}
