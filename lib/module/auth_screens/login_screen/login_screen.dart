import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/layout/layout_screen.dart';
import 'package:shop_app_2022/module/auth_screens/register_screen/register_screen.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/constans.dart';
import 'package:shop_app_2022/shared/cubit/cubit.dart';
import 'package:shop_app_2022/shared/cubit/states.dart';
import 'package:shop_app_2022/shared/network/locale/cache_hleper.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController passWordController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey();
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is LoginSuccsesState) {
            if (state.loginModel!.status!) {
              CacheHelper.putData(
                      key: 'token', value: state.loginModel!.data!.token)
                  .then((value) {
                token = state.loginModel!.data!.token!;
                navigatorRemoved(context: context, widget: const LayoutScreen());
              });
              showToast(
                  text: state.loginModel!.message!,
                  status: ToastStatus.success);
            } else {
              showToast(
                  text: state.loginModel!.message!, status: ToastStatus.error);
            }
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Shop App',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: key,
                child: Container(
                  height: heightPage(context: context),
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    color: myGrey,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextLogin(context: context),
                      const SizedBox(height: 10.0),
                      _buildTextBoxUserName(
                          context: context, userController: userNameController),
                      const SizedBox(height: 10.0),
                      _buildTextBoxPassword(
                          context: context, passController: passWordController,
                      cubit: AppCubit.get(context),
                      ),
                      const SizedBox(height: 10.0),
                      _buildTextCreateAccount(context: context),
                      const SizedBox(height: 10.0),
                      _buildButtonLogin(
                          key: key,
                          cubit: cubit,
                          userNameController: userNameController,
                          passWordController: passWordController,
                          context: context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextLogin({required BuildContext context}) {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildTextBoxUserName(
      {required BuildContext context,
      required TextEditingController userController}) {
    return defaultTextFormField2(
      context: context,
      controller: userController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'User name is empty';
        }
        return null;
      },
      onChanged: (value) {},
      prefix: Icons.person_outline,
      labelText: 'user name',
      colorEnabled: myBrown,
      colorFocused: myBrown,
    );
  }

  Widget _buildTextBoxPassword(
      {required BuildContext context,
      required TextEditingController passController,
      required AppCubit cubit,
      }) {
    return defaultTextFormField2(
      context: context,
      isPassword: cubit.isPassword,
      controller: passController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'User name is empty';
        }
        return null;
      },
      onTapSaffixIcon: (){
        cubit.changeShowPassword();
      },
      suffixIco: cubit.isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
      prefix: Icons.lock_outline,
      labelText: 'Password',
      colorBorder: myBrown,
      colorEnabled: myBrown,
      colorFocused: myBrown,
    );
  }

  Widget _buildButtonLogin({
    required GlobalKey<FormState> key,
    required AppCubit cubit,
    required BuildContext context,
    required TextEditingController userNameController,
    required TextEditingController passWordController,
  }) {
    return defaultButton(
        onPressed: () {
          if (key.currentState!.validate()) {
            cubit.userLogin(
              userName: userNameController.text,
              password: passWordController.text,
            );
          }
        },
        text: 'Login',
        color: myBrown);
  }

  Widget _buildTextCreateAccount({
    required BuildContext context,
  }) {
    return Row(
      children: [
        const Text('do you have anAccount already'),
        const SizedBox(width: 10),
        defaultTextButton(
            onPressed: () {
              navigatorTo(context: context, widget: const RegisterScreen());
            },
            label: 'click here')
      ],
    );
  }
}
