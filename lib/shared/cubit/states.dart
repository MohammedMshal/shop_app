import 'package:shop_app_2022/model/login_model/login_model.dart';

abstract class AppStates {}
class InitState extends AppStates{}
//on boarding
class OnBoardingState extends AppStates{}

//bottom nav states
class ChangeNaveState extends AppStates{}

// change show password
class ChangeShowPasswordState extends AppStates{}

//login states
class LoginLoadingState extends AppStates{}
class LoginSuccsesState extends AppStates{
  final LoginModel? loginModel;
  LoginSuccsesState(this.loginModel);
}
class LoginErorreState extends AppStates{}

//register states
class RegisterLoadingState extends AppStates{}
class RegisterSuccsesState extends AppStates{
  final LoginModel? registerModel;
  RegisterSuccsesState(this.registerModel);
}
class RegisterErorreState extends AppStates{}
