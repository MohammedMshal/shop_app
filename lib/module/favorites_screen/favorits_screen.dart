import 'package:flutter/material.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildFavoritesAppBar(context: context),
          _buildBodyPage(context: context),
        ],
      ),
    );
  }

  _buildFavoritesAppBar({
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
            'cart',
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
          itemBuilder: (context, index) => _buildItemFavorites(context: context),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        const SizedBox(height: 10.0),
      ]),
    );
  }

  Widget _buildItemFavorites({
    required BuildContext context,
  }) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: myWight,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          //build image
          Expanded(
            flex: 5,
            child: Image.network(
                'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80'),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Product Title',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('50 \$', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: InkWell(
            onTap: () {},
            child: Icon(Icons.favorite, color: myRed),
          ))

        ],
      ),
    );
  }
}
