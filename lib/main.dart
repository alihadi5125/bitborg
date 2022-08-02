import 'package:bitborg/controllers/SharedPref.dart';
import 'package:bitborg/controllers/add_to_fav_cubit/add_to_fav_cubit.dart';
import 'package:bitborg/controllers/all_news_cubit/all_new_cubit.dart';
import 'package:bitborg/controllers/all_signals_cubit/all_signal_cubit.dart';
import 'package:bitborg/controllers/cubits/authentication_cubits/password_visibility_cubit.dart';
import 'package:bitborg/controllers/cubits/get_fav_coints/get_fav_coins_cubit.dart';
import 'package:bitborg/controllers/cubits/home_cubits/main_page_view_cubit.dart';
import 'package:bitborg/controllers/cubits/home_cubits/news_cubits/all_news_cubit.dart';
import 'package:bitborg/controllers/cubits/home_cubits/news_page_view_cubit.dart';
import 'package:bitborg/controllers/cubits/home_cubits/premium_container_animation_cubit.dart';
import 'package:bitborg/controllers/cubits/login_cubit/login_cubit.dart';
import 'package:bitborg/controllers/cubits/resend_code_cubit.dart';
import 'package:bitborg/controllers/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:bitborg/controllers/cubits/verify_mail/verfy_email_cubit.dart';
import 'package:bitborg/controllers/cubits/verify_otp/verify_otp_cubit.dart';
import 'package:bitborg/controllers/fav_coins_new/fav_coins_news_cubit.dart';
import 'package:bitborg/controllers/future_signal_cubit/future_signal_cubit.dart';
import 'package:bitborg/controllers/negative_news_cubit/negative_news_cubit.dart';
import 'package:bitborg/controllers/neutral_new/neutral_news_cubit.dart';
import 'package:bitborg/controllers/positive_news_cubit/positive_news_cubit.dart';
import 'package:bitborg/controllers/spot_signal_cubit/spot_signal_cubit.dart';
import 'package:bitborg/views/starting_views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controllers/cubits/home_cubits/signals_page_view_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PasswordVisibilityCubit>(
          create: (BuildContext context) => PasswordVisibilityCubit(false),
        ),
        BlocProvider<MainPageViewCubit>(
          create: (BuildContext context) => MainPageViewCubit(0),
        ),
        BlocProvider<NewsPageViewCubit>(
          create: (BuildContext context) => NewsPageViewCubit(0),
        ),
        BlocProvider<SignalsPageViewCubit>(
          create: (BuildContext context) => SignalsPageViewCubit(0),
        ),
        BlocProvider<PremiumContainerAnimationCubit>(
          create: (BuildContext context) =>
              PremiumContainerAnimationCubit(false),
        ),
        BlocProvider<AllNewsCubit>(
          create: (BuildContext context) => AllNewsCubit(),
        ),
        BlocProvider<LoginApiCubit>(
          create: (BuildContext context) => LoginApiCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(),

        ),
        BlocProvider<VerfyEmailCubit>(
          create: (BuildContext context) => VerfyEmailCubit(),

        ),
        BlocProvider<ResendCodeCubit>(
          create: (BuildContext context) => ResendCodeCubit(false),

        ),
        BlocProvider<VerifyOtpCubit>(
          create: (BuildContext context) => VerifyOtpCubit(),

        ),
        BlocProvider<AllNewCubit>(
          create: (BuildContext context) => AllNewCubit(),

        ),
        BlocProvider<GetFavCoinsCubit>(
          create: (BuildContext context) => GetFavCoinsCubit(),

        ),
        BlocProvider<AddToFavCubit>(
          create: (BuildContext context) => AddToFavCubit(),

        ),
        BlocProvider<FavCoinsNewsCubit>(
          create: (BuildContext context) => FavCoinsNewsCubit(),
        ),
        BlocProvider<NeutralNewsCubit>(
          create: (BuildContext context) => NeutralNewsCubit(),
        ),
        BlocProvider<PositiveNewsCubit>(
          create: (BuildContext context) => PositiveNewsCubit(),
        ),
        BlocProvider<NegativeNewsCubit>(
          create: (BuildContext context) => NegativeNewsCubit(),
        ),
        BlocProvider<AllSignalCubit>(
          create: (BuildContext context) => AllSignalCubit(),
        ),
        BlocProvider<SpotSignalCubit>(
          create: (BuildContext context) => SpotSignalCubit(),
        ),
        BlocProvider<FutureSignalCubit>(
          create: (BuildContext context) => FutureSignalCubit(),
        ),


      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          home: MyApp(),
          routes: {
            //TtfFileTask.routeName: (ctx) => const TtfFileTask(),
          },
        ),

    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize:  Size(375, 812),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait,
    );
    return const SplashScreen();
  }
}
