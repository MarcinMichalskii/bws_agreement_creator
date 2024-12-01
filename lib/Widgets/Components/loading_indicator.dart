import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.paddingTop = 8,
  });

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: paddingTop),
        child: const CircularProgressIndicator(
          color: CustomColors.applicationColorMain,
        ));
  }
}
