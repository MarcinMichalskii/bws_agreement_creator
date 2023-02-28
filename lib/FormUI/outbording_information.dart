import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/FormUI/outbording_information_sign.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OutbordingInformation extends StatelessWidget {
  const OutbordingInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: _OutbordingInformationContainer(),
            )),
      ),
    );
  }
}

class _OutbordingInformationContainer extends StatelessWidget {
  const _OutbordingInformationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Właśnie została pobrana Twoja umowa, na podstawie której możemy współpracować! Zapoznaj się z nią!',
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
              ),
            )),
        const Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Teraz trzeba ją podpisać, a następnie dodać do Twojego profiliu w sinchu',
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
              ),
            )),
        Container(
            padding: EdgeInsets.only(top: 8),
            child: DefaultBorderedButton(
              onTap: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => OutbordingInformationSign());
              },
              text: 'Podpisz umowę',
            )),
      ],
    );
  }
}

class TextWithLink extends StatelessWidget {
  const TextWithLink(
      {Key? key,
      required this.left,
      required this.link,
      required this.right,
      required this.url})
      : super(key: key);
  final String left;
  final String link;
  final String right;
  final String url;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: left,
            style: const TextStyle(
              color: CustomColors.gray,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: link,
            style: const TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            recognizer: new TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse(url));
              },
          ),
          TextSpan(
            text: right,
            style: const TextStyle(
              color: CustomColors.gray,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
