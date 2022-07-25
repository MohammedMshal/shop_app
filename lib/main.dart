import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/layout/layout_screen.dart';
import 'package:shop_app_2022/module/auth_screens/login_screen/login_screen.dart';
import 'package:shop_app_2022/module/onBoarding_screen/on_boarding_screen.dart';
import 'package:shop_app_2022/shared/constans.dart';
import 'package:shop_app_2022/shared/cubit/cubit.dart';
import 'package:shop_app_2022/shared/network/locale/cache_hleper.dart';
import 'package:shop_app_2022/shared/network/remote/dio_helper.dart';
import 'package:shop_app_2022/shared/style/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  token = CacheHelper.getData(key: 'token') ?? '';
  Widget? startWidget;
  bool isLast = CacheHelper.getData(key: 'isLast') ?? false;

  if(isLast){
    if(token.isNotEmpty){
      startWidget = const LayoutScreen();
    }else{
      startWidget = const LoginScreen();
    }
  }else{
    startWidget = const OnBoardingScreen();
  }

  runApp( MyApp(startWidget: startWidget,));

}

class MyApp extends StatelessWidget {
   const MyApp({Key? key,this.startWidget}) : super(key: key);
  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startWidget!,

      ),
    );
  }
}

