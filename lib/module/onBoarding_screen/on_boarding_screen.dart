import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_2022/model/on_boarding_model/on_boarding_model.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/cubit/cubit.dart';
import 'package:shop_app_2022/shared/cubit/states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/style/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    List<OnBoardingModel> pageList = [
      OnBoardingModel(
        image:
            'https://img.freepik.com/free-vector/happy-people-shopping-online_74855-5865.jpg',
        bodyText: 'Shop Now Online',
        title: 'Shop Now',
      ),
      OnBoardingModel(
        image:
            'https://img.freepik.com/free-vector/ecommerce-web-page-concept-illustration_114360-8204.jpg',
        bodyText: 'esy Shop',
        title: 'Ease of shopping',
      ),
      OnBoardingModel(
        image:
            'https://img.freepik.com/free-photo/laptop-shopping-bags-online-shopping-concept_1423-189.jpg',
        bodyText: 'Speed delivery',
        title: 'Speed delivery',
      ),
    ];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              defaultTextButton(
                  onPressed: () {
                    cubit.onSkip(context: context);
                  },
                  label: 'Skip',
                  labelStyle: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.onSubmit(context: context, controller: controller);
            },
            child: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          body: PageView.builder(
              onPageChanged: (index) {
                cubit.changeOnBoarding(index, pageList);
              },
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                return _buildPageItem(model: pageList[index], context: context);
              }),
          bottomSheet: Container(
            width: widthPage(context: context),
            height: 115,
            color: myWight,
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: pageList.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: myBrown,
                  dotColor: myBrown,
                  dotHeight: 10.0,
                  expansionFactor: 4.0,
                  dotWidth: 10.0,
                  spacing: 5.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageItem({
    required OnBoardingModel model,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.title, style: Theme.of(context).textTheme.titleLarge),
          Stack(
            children: [
              Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Text(model.bodyText, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 40.0)
        ],
      ),
    );
  }
}
