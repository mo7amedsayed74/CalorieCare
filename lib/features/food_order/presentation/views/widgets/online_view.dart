import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/app_cubit/cubit.dart';
import '../../manger/app_cubit/states.dart';
import 'carbs_and_price.dart';
import 'category.dart';
import '../../../../../core/json/jsons.dart';

class OnlineView extends StatelessWidget {
  const OnlineView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context,state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 2,),
                child: ListView(
                  children: [
                    Text(
                      'Vegetables',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 12),
                    Category(list: vegetableJson),
                    const SizedBox(height: 16),
                    Text(
                      'Meats',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 12),
                    Category(list: meatJson),
                    const SizedBox(height: 16),
                    Text(
                      'Carbs',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 12),
                    Category(list: carbJson),
                  ],
                ),
              ),
            ),
            const CarbsAndPrice(buttonText: 'Place order'),
          ],
        );
      },
    );
  }
}

