import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OutbordingInformationSign extends StatelessWidget {
  const OutbordingInformationSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: const _OutbordingInformationSignContainer(),
            )),
      ),
    );
  }
}

class _OutbordingInformationSignContainer extends StatelessWidget {
  const _OutbordingInformationSignContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            right: 8,
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
                color: CustomColors.gray,
                size: 14,
              ),
            )),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Pobraną umowę możesz podpisać elektronicznie przez profil zaufany klikając w guzik poniżej',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(top: 0),
              child: DefaultBorderedButton(
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://moj.gov.pl/nforms/signer/upload?xFormsAppName=SIGNER'));
                },
                text: 'Podpisz online',
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Możesz również podpisać umowę offline, wydrukować ją, podpisać i zeskanować.',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                )),
            const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Na koniec nie zapomnij dodać jej do Sincha.',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                )),
            DefaultBorderedButton(
              onTap: () {
                launchUrl(Uri.parse(
                    'https://bws.onsinch.com/react/profile/edit/attributes#9_UMOWA_Z_BWS'));
              },
              text: 'Sinch',
            )
          ],
        ),
      ],
    );
  }
}

class TextWithLink extends StatelessWidget {
  const TextWithLink(
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
