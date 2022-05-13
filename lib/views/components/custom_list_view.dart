import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomListView extends StatelessWidget {
  List list;
  CustomListView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CustomCard(
        note: list[index]),
      itemCount: list.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}