import 'package:flutter/material.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildCategoriesAppBar(context: context),
          _buildBodyPage(context: context),
        ],
      ),
    );
  }

  _buildCategoriesAppBar({
    required BuildContext context,
  }) {
    return Container(
      color: myWight,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          //space
          const SizedBox(width: 20),
          Text(
            'Categories',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  _buildBodyPage({
    required BuildContext context,
  }) {
    return Container(
      padding:
      const EdgeInsets.only(top: 15.0, right: 20, left: 20, bottom: 20),
      decoration: BoxDecoration(
        color: myGrey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Column(children: [
        ListView.separated(
          itemBuilder: (context, index) => _buildItemCategories(context: context),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        const SizedBox(height: 10.0),
      ]),
    );
  }

  Widget _buildItemCategories({
    required BuildContext context,
  }) {
    return Container(
      height: 180,
      width: widthPage(context: context),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
            color: myWight,
        
      ),
      child: Center(
        child: Stack(
          children: [
            //build image
            Image.network(
                'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80',
              fit: BoxFit.fitWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(child: Text(' Categories Title',style: Theme.of(context).textTheme.titleMedium)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
