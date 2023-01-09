import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
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
            width: 320,
            height: 280,
            constraints: const BoxConstraints(maxWidth: 320),
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
      children: [
        const Text(
          'Gratulacje!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: CustomColors.gray,
            fontSize: 16,
          ),
        ),
        const Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Udało Ci się wygenerować umowę, dzięki której możemy współpracować!',
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 14,
              ),
            )),
        const Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextWithLink(
              left:
                  'Teraz trzeba ją podpisać. Możesz to zrobić przez podpis zaufany klikając',
              link: ' TUTAJ ',
              right:
                  'lub wydrukować ją, podpisać NA KAŻDEJ STRONIE i zeskanować.',
              url:
                  'https://moj.gov.pl/nforms/signer/upload?xFormsAppName=SIGNER',
            )),
        const Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextWithLink(
              left: 'Podpisaną umowę dodaj do swojego profilu',
              link: '- kliknij TUTAJ, ',
              right: ' aby się do niego przenieść.',
              url:
                  'https://bws.onsinch.com/react/profile/edit/attributes#9_UMOWA_Z_BWS',
            )),
        Container(
          padding: EdgeInsets.only(top: 8),
          child: DefaultBorderedButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'OK!',
          ),
        )
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
              fontSize: 13,
            ),
          ),
          TextSpan(
            text: link,
            style: const TextStyle(
                color: CustomColors.gray,
                fontSize: 13,
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
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
