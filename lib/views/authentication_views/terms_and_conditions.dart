import 'package:bitborg/controllers/cubits/authentication_cubits/check_box_cubits/terms_and_conditions_cubit.dart';
import 'package:bitborg/views/authentication_views/sign_up_screen.dart';
import 'package:bitborg/views/authentication_views/terms_and_conditions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';
import '../../models/custom_models/custom_page_routes.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsAndConditionsCubit(true),
      child: BlocBuilder<TermsAndConditionsCubit, bool>(
        builder: (context, state) {
          return Container(
            height: 25.sp,
            width: 328.sp,
            alignment: Alignment.centerLeft,
            // color: Colors.red,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: Container(
                      height: 23.8.sp,
                      width: 23.8.sp,
                      decoration: BoxDecoration(
                        color: AppColors.checkboxInitialColor,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Transform.scale(
                        scale: 1.2.sp,
                        child: Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                AppColors.checkboxUnselectedColor,
                          ),
                          child: Checkbox(
                            splashRadius: 0,
                            side: BorderSide(
                              color: AppColors.checkboxUnselectedColor,
                            ),
                            activeColor: AppColors.themeYellowColor,
                            checkColor: AppColors.pureWhiteColor,
                            value: state,
                            onChanged: (value) {
                              if (value == true) {
                                LoginController.check1=true;
                                context
                                    .read<TermsAndConditionsCubit>()
                                    .checked(checked: true);
                              } else {
                                LoginController.check1=false;
                                context
                                    .read<TermsAndConditionsCubit>()
                                    .checked(checked: false);
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 5.sp,
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      height: 15.sp,
                      child: Text(
                        'Do you agree to Bitborg\'s ',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: AppColors.greyColor,
                            letterSpacing: -0.5.sp,
                            fontSize: 13.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            child: const TermsAndConditionsScreen(),
                            direction: AxisDirection.down,
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 13.5.sp,
                        child: Text(
                          'Terms and Conditions?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Montserrat',
                              color: AppColors.greyColor,
                              letterSpacing: -0.5.sp,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
