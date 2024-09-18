import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit/cubit.dart';
import '../cubit/app_cubit/states.dart';
import '../custom_widgets/product_image.dart';
import '../model/order_model.dart';
import 'counter_buttons.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key, required this.item});
  final OrderModel item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context,state){
        return Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFFFFFFF),
          ),
          child: Row(
            children: [
              ProductImage(
                imgUrl: item.imageUrl,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.foodName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Spacer(),
                    Text(
                      '${item.calories}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$12',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const Spacer(),
                  CounterButtons(
                    numberOfPiece: item.numberOfPiece,
                    onPressedPlus: () {
                      AppCubit.get(context).plusOnPressed(item: item);
                    },
                    onPressedMinus: () {
                      AppCubit.get(context).minusOnPressed(item: item);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
