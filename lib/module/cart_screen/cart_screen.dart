import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_2022/shared/components/components.dart';
import 'package:shop_app_2022/shared/style/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildCartAppBar(context: context),
          _buildBodyPage(context: context),
        ],
      ),
      bottomNavigationBar: _buildBottomAppBar(context: context),
    );
  }

  _buildCartAppBar({
    required BuildContext context,
  }) {
    return Container(
      color: myWight,
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          //back Button
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
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
          itemBuilder: (context, index) => _buildItemCart(context: context),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(CupertinoIcons.add_circled_solid),
            const SizedBox(width: 5.0),
            Text(
              'Add Coupon Code',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: defaultTextFormField(
                  controller: TextEditingController(),
                  validator: (value) {
                    return null;
                  },
                  label: 'Coupon code',
                  prefixIcon: Icons.lock_outline),
            ),
            const SizedBox(width: 5.0),

            Expanded(
                child: defaultButton(
                    onPressed: () {}, text: 'Apply code', isUpperText: false)),
          ],
        )
      ]),
    );
  }

  Widget _buildItemCart({
    required BuildContext context,
  }) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: myWight,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Radio(value: '', groupValue: '', onChanged: (index) {}),
          //build image
          SizedBox(
              height: 100.0,
              width: 100.0,
              child: Image.network(
                  'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1099&q=80')),
          //space
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Product Title',
                  style: Theme.of(context).textTheme.titleMedium),
              Text('50 \$', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.delete, color: myRed),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(CupertinoIcons.minus, size: 15),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Text('01'),
                  const SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(CupertinoIcons.plus, size: 15),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }


  Widget _buildBottomAppBar({
  required BuildContext context
}){
    return BottomAppBar(
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              children: [
                Text('total',style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                Text('50 \$',style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            const SizedBox(height: 5.0),
            defaultButton(
                color: myBrown,
                isUpperText: false,
                onPressed: (){}, text: 'Chek out')
          ],),
        ),
      ),
    );
  }
}
