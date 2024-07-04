import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class UserStatisticsHeader extends StatelessWidget {
  const UserStatisticsHeader({
    super.key,
    required this.title,
    this.topMargin = 16,
  });

  final String title;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.fromLTRB(0, topMargin, 0, 4),
        child: Text(
          title,
          style: const TextStyle(color: CustomColors.gray),
        ));
  }
}
