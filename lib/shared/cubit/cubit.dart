import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/module/auth_screens/login_screen/login_screen.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/network/end_point.dart';
import 'package:shop_app_2022/model/login_model/login_model.dart';
import 'package:shop_app_2022/module/categories_screen/categories_screen.dart';
import 'package:shop_app_2022/module/favorites_screen/favorits_screen.dart';
import 'package:shop_app_2022/module/home_screen/home_screen.dart';
import 'package:shop_app_2022/module/settings_screen/settings_screen.dart';
import 'package:shop_app_2022/shared/cubit/states.dart';
import 'package:shop_app_2022/shared/network/locale/cache_hleper.dart';
import 'package:shop_app_2022/shared/network/remote/dio_helper.dart';

import '../../model/on_boarding_model/on_boarding_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  //on boarding

  bool isLast = false;
  void changeOnBoarding(int index, List<OnBoardingModel> pageList){
    if(index == pageList.length - 1 ){
      isLast = true;
      emit(OnBoardingState());
    }else{
      isLast = false;
      emit(OnBoardingState());
    }
    debugPrint(isLast.toString());
  }

  void onSubmit({
  required BuildContext context
    ,required PageController controller,
}){
    if(isLast){
      CacheHelper.putData(key: 'isLast', value: isLast);
      navigatorRemoved(context: context, widget: const LoginScreen());
    }else{
      controller.nextPage(duration: const Duration(seconds: 5), curve: Curves.fastLinearToSlowEaseIn);
    }
  }

  void onSkip({
  required BuildContext context,
}){
    isLast = true;
    CacheHelper.putData(key: 'isLast', value: isLast);
    navigatorRemoved(context: context, widget: const LoginScreen());
  }


  int currentIndex = 0;

  List<Widget> pageNaveWidget = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen()
  ];
  List<String> pageNaveName = [
    'Home Screen',
    'Categories Screen',
    'Favorites Screen',
    'Settings Screen',
  ];

  List<Widget> icoNav = [
    const Icon(Icons.home_outlined),
    const Icon(Icons.list),
    const Icon(Icons.favorite),
    const Icon(Icons.settings_outlined),
  ];

  void changIndexBottomNav(int index) {
    currentIndex = index;
    emit(ChangeNaveState());
  }

  bool isPassword = true;
  IconData? iconDatPass;
  void changeShowPassword(){
    isPassword = !isPassword;
    emit(ChangeShowPasswordState());
  }

  // login cubit
  LoginModel? loginModel;

  void userLogin({required String userName, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(url: loginURL, data: {
      'email': userName,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccsesState(loginModel));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(LoginErorreState());
    });
  }

  //register cubit

  LoginModel? registerModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerURL, data: {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }).then((value) {
      registerModel = LoginModel.fromJson(value.data);
      emit(RegisterSuccsesState(registerModel));
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(RegisterErorreState());
    });
  }
}
