import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/module/auth_screens/login_screen/login_screen.dart';
import 'package:shop_app_2022/module/home_screen/home_screen.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/constans.dart';
import 'package:shop_app_2022/shared/cubit/states.dart';
import 'package:shop_app_2022/shared/network/locale/cache_hleper.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

import '../../../shared/cubit/cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey();
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is RegisterSuccsesState){
            if(state.registerModel!.status!){
              CacheHelper.putData(key: 'token', value: state.registerModel!.data!.token!).then((value){
                token = state.registerModel!.data!.token!;
              });
              showToast(text: state.registerModel!.message!, status: ToastStatus.success);
              navigatorRemoved(context: context, widget: const HomeScreen());
            }else{
              showToast(text: state.registerModel!.message!, status: ToastStatus.error);
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
                      _buildTextRegister(context: context),
                      const SizedBox(height: 10.0),
                      _buildTextBoxUserName(
                          context: context, userController: nameController),
                      const SizedBox(height: 10.0),
                      _buildTextBoxEmail(
                          context: context, emailController: emailController),
                      const SizedBox(height: 10.0),
                      _buildTextBoxPhone(
                          context: context, phoneController: phoneController),
                      const SizedBox(height: 10.0),
                      _buildTextBoxPassword(
                          context: context, passController: passwordController),
                      const SizedBox(height: 10.0),
                      _buildButtonHaveAccount(context: context),
                      const SizedBox(height: 10.0),
                      _buildButtonRegister(
                          key: key,
                          cubit: cubit,
                          context: context,
                          nameController: nameController,
                          passController: passwordController,
                          phoneController: phoneController,
                          emailController: emailController)
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

  Widget _buildTextRegister({required BuildContext context}) {
    return Text(
      'Register',
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
      prefix: Icons.lock_outline,
      labelText: 'user name',
      colorEnabled: myBrown,
      colorFocused: myBrown,
    );
  }

  Widget _buildTextBoxEmail(
      {required BuildContext context,
      required TextEditingController emailController}) {
    return defaultTextFormField2(
      context: context,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'email is empty';
        }
        return null;
      },
      onChanged: (value) {},
      prefix: Icons.email_outlined,
      labelText: 'email',
      colorEnabled: myBrown,
      colorFocused: myBrown,
    );
  }

  Widget _buildTextBoxPhone(
      {required BuildContext context,
      required TextEditingController phoneController}) {
    return defaultTextFormField2(
      context: context,
      controller: phoneController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'email is empty';
        }
        return null;
      },
      onChanged: (value) {},
      prefix: Icons.phone_outlined,
      labelText: 'phone',
      colorEnabled: myBrown,
      colorFocused: myBrown,
    );
  }

  Widget _buildTextBoxPassword(
      {required BuildContext context,
      required TextEditingController passController}) {
    return defaultTextFormField2(
      context: context,
      isPassword: true,
      controller: passController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'User name is empty';
        }
        return null;
      },
      suffixIco: Icons.visibility_off_outlined,
      prefix: Icons.lock_outline,
      labelText: 'Password',
      colorBorder: myBrown,
      colorEnabled: myBrown,
      colorFocused: myBrown,
    );
  }

  Widget _buildButtonHaveAccount({
    required BuildContext context,
  }) {
    return Row(
      children: [
        const Text('do you have anAccount already'),
        const SizedBox(width: 10),
        defaultTextButton(
          onPressed: () {
            navigatorTo(
              context: context,
              widget: const LoginScreen(),
            );
          },
          label: 'click here',
          isUpperText: false,
        )
      ],
    );
  }

  Widget _buildButtonRegister({
    required GlobalKey<FormState> key,
    required AppCubit cubit,
    required BuildContext context,
    required TextEditingController nameController,
    required TextEditingController passController,
    required TextEditingController phoneController,
    required TextEditingController emailController,
  }) {
    return defaultButton(
        onPressed: () {
          if (key.currentState!.validate()) {
            cubit.userRegister(
              name: nameController.text,
              email: emailController.text,
              password: passController.text,
              phone: phoneController.text,
            );
          }
        },
        text: 'Register',
        color: myBrown);
  }
}
