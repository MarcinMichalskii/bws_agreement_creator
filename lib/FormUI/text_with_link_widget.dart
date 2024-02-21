import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextWithLinkWidget extends StatelessWidget {
  const TextWithLinkWidget(
      {Key? key,
      this.textAlign = TextAlign.start,
      this.fontSize = 18,
      required this.left,
      required this.link,
      required this.right,
      required this.url})
      : super(key: key);
  final TextAlign textAlign;
  final double fontSize;
  final String left;
  final String link;
  final String right;
  final String url;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
            text: left,
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: link,
            style: const TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse(url));
              },
          ),
          TextSpan(
            text: right,
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
