import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultCategoryScreen extends StatelessWidget {
  const ResultCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'No Signals Found',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
