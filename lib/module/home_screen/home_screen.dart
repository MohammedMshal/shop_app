import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../cart_screen/cart_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/style/colors.dart';
import '../../shared/widgets/default_gridview_responsive.dart';
import '../details_screen/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildAppBarPage(
            context: context,
          ),
          _buildPageBody(context: context),
        ],
      ),
    );
  }
  Widget _buildAppBarPage({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: Row(
        children: [
          Icon(Icons.sort, size: 30, color: myBrown),
          const SizedBox(width: 20),
          const Text('Shop App'),
          const Spacer(),
          Badge(
            padding: const EdgeInsets.all(7),
            badgeColor: myRed,
            badgeContent: const Text('5'),
            position: BadgePosition.topEnd(),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                navigatorTo(context: context, widget: const CartScreen());
              },
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageBody({required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
          color: myGrey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //searchPage
          defaultTextFormField2(
              context: context,
              controller: TextEditingController(),
              validator: (value) => null,
              prefix: Icons.search_outlined,
              labelText: 'Search here.......'
          ),
          //space
          const SizedBox(height: 20.0),
          //textCategories
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Text('Categories',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          //space
          const SizedBox(height: 10),
          //listCategories
          SizedBox(
            height: 40,
            child: ListView.separated(
              itemBuilder: (context, index) => _buildCategoriesItem(),
              separatorBuilder: (context, index) => const SizedBox(width: 20.0),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            ),
          ),
          //space
          const SizedBox(height: 10),
          //bastSelling text
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Text('Bast Selling',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          DefaultGridViewResponsive(
            itemCount: 50,
            widgetContent: _buildItemGridView(context: context),
          ),
        ],
      ),
    );
  }

  Widget _buildItemGridView({
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        navigatorTo(context: context, widget: const DetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Stack(
                children: [
                  //build image
                  InkWell(
                    onTap: () {},
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80'),
                  ),
                  //build fav and offer
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  'https://banner2.cleanpng.com/20171202/805/special-offer-png-5a2304040f5eb9.025860941512244228063.jpg'),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundColor: myWight,
                                  radius: 15.0,
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: myRed,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Product Title',
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          ),
          Text('Write description product ',
              style: Theme.of(context).textTheme.bodySmall),
          Row(
            children: [
              Text('50\$', style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: myBrown,
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCategoriesItem() {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10.0), top: Radius.circular(10.0)),
          color: myWight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
                'https://www.thoughtco.com/thmb/cL31vap_f0-OE5KFfZwt8JWcYXs=/768x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/lightbulblit-57a5bf6b5f9b58974aee831e.jpg'),
            const Text('Test Text'),
          ],
        ));
  }
}
