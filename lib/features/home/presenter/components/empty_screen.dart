import 'package:contacts/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(Assets.lotties.listPurple, width: double.infinity),
        Text(
          'There is No Contacts Added Here',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
