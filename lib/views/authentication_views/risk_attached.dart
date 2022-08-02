import 'package:bitborg/controllers/cubits/authentication_cubits/check_box_cubits/risk_attached_cubit.dart';
import 'package:bitborg/models/custom_models/app_icons_icons.dart';
import 'package:bitborg/models/custom_models/remove_scrollglow.dart';
import 'package:bitborg/views/authentication_views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/custom_models/color_constraints.dart';

class RisksAttached extends StatefulWidget {
  const RisksAttached({Key? key}) : super(key: key);

  @override
  _RisksAttachedState createState() => _RisksAttachedState();
}

class _RisksAttachedState extends State<RisksAttached> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RiskAttachedCubit(true),
      child: BlocBuilder<RiskAttachedCubit, bool>(
        builder: (context, state) {
          return Container(
            height: 35.sp,
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
                            focusColor: AppColors.checkboxInitialColor,
                            value: state,
                            onChanged: (value) {
                              if (value == true) {
                                LoginController.check2=true;
                                context
                                    .read<RiskAttachedCubit>()
                                    .checked(checked: true);
                              } else {
                                LoginController.check2=false;
                                context
                                    .read<RiskAttachedCubit>()
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
                    child: Text(
                      'Do you Acknowledge the ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          letterSpacing: -0.5.sp,
                          color: AppColors.greyColor,
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: InkWell(
                      onTap: () {
                        debugPrint('Risk Attached to trading..');
                        showModalBottomSheet(

                            isScrollControlled: true,
                            context: context,
                            backgroundColor: AppColors.blackishColor,
                            builder: (builder) {
                              return Container(
                                height: 1.sh / 1.15,
                                width: 1.sw,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.sp),
                                      topRight: Radius.circular(15.sp),
                                    )),
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(
                                    left: 16.sp,
                                    right: 16.sp,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    SizedBox(
                                      height: 20.sp,
                                    ),
                                    SizedBox(
                                      height: 30.sp,
                                      width: 1.sw,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: SizedBox(
                                              height: 30.sp,
                                              child: Text(

                                                'Risk Warning',
                                                style: TextStyle(
                                                  decoration: TextDecoration.underline,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.sp,
                                                  letterSpacing: -1.sp,
                                                  color: AppColors.pureWhiteColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.of(context).pop();
                                              },
                                              child: SizedBox(
                                                height: 30.sp,
                                                child: Icon(
                                                    AppIcons.cross_circle,
                                                  color: AppColors.themeYellowColor,
                                                  size: 26.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18.sp,
                                    ),
                                    SizedBox(
                                      height: 0.8.sh,
                                      width: 1.sw,
                                      child: ScrollConfiguration(
                                        behavior: MyBehavior(),
                                        child: ListView(
                                          shrinkWrap: true,

                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          children: [
                                            Text(
                                                'Trading and investing in cryptocurrencies involve a substantial risk of loss and is not suitable for every person. The valuation of cryptocurrencies and related products may fluctuate and, as a result, clients may lose more than their original investment. Unless a person knows and fully understands the risks involved in cryptocurrencies, they should not engage in any transactions on the platform provided by Bitborg.\n\nUsers should not risk more than they are prepared to lose. Prior to opening an account with Bitborg or placing any orders, Users should carefully consider which Signal/Call is suitable for them, taking into account its nature, volatility and legality.If the User does not understand the risks related to cryptocurrencies, they should consult an independent financial advisor. If after obtaining proper legal and/or financial advice from a qualified professional, they still do not understand these risks, then they should refrain from using the services.\n\nBitborg is not providing the User with any investment, legal, regulatory or other form of advice. The User is required to rely on their own judgment (with or without the assistance of an advisor) in using the services of Bitborg. In asking to provide its services, the User represents that they are solely responsible for making their own independent appraisal and investigation into the risks of the Company’s services.\n\nThere’s always a possibility of sudden and adverse shifts in trading and other market activities. Every time you finance a purchase or sale of virtual currencies on a peer-to-peer basis you may suffer from not being able to repay that financing. Every cryptocurrency has its own features – blockchain, protocols, etc. and inherent risks which you must understand before investing in it. Accordingly, cryptocurrencies should be seen as extremely high risk assets and you should never invest funds that you cannot afford to lose.\n\n',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.5.sp,
                                                color: AppColors. greyColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: SizedBox(
                        height: 13.5.sp,
                        child: Text(
                          'Risk attached to trading?',
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
