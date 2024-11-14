import 'package:flutter/material.dart';
import 'package:nikkle_app/const/color_const.dart';
import 'package:nikkle_app/model/cart_model.dart';

import 'package:nikkle_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final int index;
  final CartModel cartModel;
  const CartCard({super.key, required this.index, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border(
            bottom: BorderSide(width: 1.5, color: AppColors.secondaryColor)),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondaryColor,
            ),
            child: Image.asset('assets/image.png'),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cartModel.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartProvider>().addByIndex(index);
                      },
                      child: Material(
                        shape: const CircleBorder(),
                        color: AppColors.primaryColor,
                        child: Icon(
                          Icons.add,
                          size: 22,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      '${cartModel.qty}',
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartProvider>().removeByIndex(index);
                      },
                      child: Material(
                        shape: const CircleBorder(),
                        color: AppColors.primaryColor,
                        child: Icon(
                          Icons.remove,
                          size: 22,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<CartProvider>().remove(index);
                },
                child: Material(
                  shape: const CircleBorder(),
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.delete,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  'Rs.${cartModel.rate}',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
