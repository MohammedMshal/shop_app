import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/shared/cubit/cubit.dart';
import 'package:shop_app_2022/shared/cubit/states.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: cubit.pageNaveWidget[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              onTap: (index) {
                cubit.changIndexBottomNav(index);
              },
              height: 70.0,
              backgroundColor: Colors.transparent,
              color: myBrown,
              items: cubit.icoNav,
            ),
          );
        },
      ),
    );
  }
}
