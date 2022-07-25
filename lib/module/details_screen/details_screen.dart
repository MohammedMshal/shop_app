import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGrey,
      body: ListView(
        children: [
          _buildAppBarDetailsProduct(context: context),
          _buildBodyPage(context: context)
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(context: context),
    );
  }

  Widget _buildAppBarDetailsProduct({
    required BuildContext context,
  }) {
    return Container(
      color: myWight,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          const SizedBox(width: 20),
          Text('Product details',
              style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.favorite_border_outlined),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBodyPage({required BuildContext context}) {
    return Column(
      children: [
        Image.network(
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80',
            height: 300),
        Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30.0,
            child: Container(
              width: widthPage(context: context),
              color: myWight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 50.0,
                        bottom: 20.0,
                      ),
                      child: Text('Product Title',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    //rate
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            itemSize: 25,
                            itemBuilder: (context, index) {
                              switch (index) {
                                case 0:
                                  return const Icon(
                                    Icons.sentiment_very_dissatisfied,
                                    color: Colors.red,
                                  );
                                case 1:
                                  return const Icon(
                                    Icons.sentiment_dissatisfied,
                                    color: Colors.redAccent,
                                  );
                                case 2:
                                  return const Icon(
                                    Icons.sentiment_neutral,
                                    color: Colors.amber,
                                  );
                                case 3:
                                  return const Icon(
                                    Icons.sentiment_satisfied,
                                    color: Colors.lightGreen,
                                  );
                                case 4:
                                  return const Icon(
                                    Icons.sentiment_very_satisfied,
                                    color: Colors.green,
                                  );
                              }
                              return Container();
                            },
                            onRatingUpdate: (rating) {},
                            initialRating: 3,
                            itemCount: 5,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: const Icon(CupertinoIcons.minus)),
                          ),
                          Text('01',
                              style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {},
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: const Icon(CupertinoIcons.plus)),
                          ),
                        ],
                      ),
                    ),
                    //description
                    Text(
                      'This is more detailed description of the product you can write here more about the product',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildBottomAppBar({required BuildContext context}){
    return BottomAppBar(
      child: Container(
        height: 70,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: myGrey,
              blurRadius: 2,
              spreadRadius: 5,
              blurStyle: BlurStyle.solid),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const SizedBox(width: 30.0),
              Expanded(
                  child: Text(
                '50 \$',
                style: Theme.of(context).textTheme.titleLarge,
              )),
              Expanded(
                flex: 2,
                child: defaultButton(
                    onPressed: () {},
                    text: 'Add to card',
                    isUpperText: false,
                    isRadius: true,
                  color: myBrown
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
