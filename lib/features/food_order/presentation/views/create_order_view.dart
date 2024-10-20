import 'package:calorie_care/features/food_order/presentation/views/widgets/online_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../../../core/utiles/offline_view.dart';
import 'widgets/back_button.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(con: context),
        centerTitle: true,
        title: Text(
          'Create your order',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected = !connectivity.contains(ConnectivityResult.none);
          return connected ? const OnlineView() : const OfflineView();
        },
        child: const CircularProgressIndicator(color: Color(0xFFF25700)),
      ),
    );
  }
}
