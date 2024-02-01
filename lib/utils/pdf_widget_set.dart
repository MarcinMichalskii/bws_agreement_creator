import 'package:bws_agreement_creator/Fonts.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfWidgetSet {
  pw.Widget styledParagraph(
      {required String point, required String value, pw.TextStyle? style}) {
    return pw.Container(
        margin: const pw.EdgeInsets.symmetric(vertical: 12),
        child: pw.Column(children: [
          pw.Center(
              child:
                  pw.Text('§ $point', style: style ?? defaultFonts.boldStyle)),
          pw.Center(
              child: pw.Text(value, style: style ?? defaultFonts.boldStyle)),
        ]));
  }

  pw.Row enumRow(
      {required String point,
      required String value,
      pw.TextStyle? pointTextStyle,
      pw.TextStyle? valueTextStyle,
      bool emptyPoint = false}) {
    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Container(
        margin: pw.EdgeInsets.only(right: emptyPoint ? 16 : 8),
        child:
            pw.Text(point, style: pointTextStyle ?? defaultFonts.regularStyle),
      ),
      pw.Expanded(
        child:
            pw.Text(value, style: valueTextStyle ?? defaultFonts.regularStyle),
      )
    ]);
  }

  pw.Padding headeredRow(
      {required String point,
      required String value,
      pw.TextStyle? headerTextStyle,
      pw.TextStyle? valueTextStyle,
      bool emptyPoint = false}) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8),
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(point, style: headerTextStyle ?? defaultFonts.boldStyle),
            pw.Text(value, style: valueTextStyle ?? defaultFonts.regularStyle),
          ]),
    );
  }

  pw.Row enumRowWithRichText({
    required String point,
    required String value,
    pw.TextStyle? pointTextStyle,
    pw.TextStyle? regularTextStyle,
    pw.TextStyle? boldTextStyle,
    bool emptyPoint = false,
  }) {
    List<pw.TextSpan> textSpans = [];
    RegExp boldRegExp = RegExp(r'<b>(.*?)<\/b>');

    Iterable<RegExpMatch> matches = boldRegExp.allMatches(value);

    int currentIndex = 0;

    for (RegExpMatch match in matches) {
      textSpans.add(pw.TextSpan(
        text: value.substring(currentIndex, match.start),
        style: regularTextStyle ?? defaultFonts.regularStyle,
      ));

      textSpans.add(pw.TextSpan(
        text: match.group(1),
        style: boldTextStyle ?? defaultFonts.boldStyle,
      ));

      currentIndex = match.end;
    }

    if (currentIndex < value.length) {
      textSpans.add(pw.TextSpan(
        text: value.substring(currentIndex),
        style: regularTextStyle ?? defaultFonts.regularStyle,
      ));
    }

    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          margin: pw.EdgeInsets.only(right: emptyPoint ? 16 : 8),
          child: pw.Text(point,
              style: pointTextStyle ?? defaultFonts.regularStyle),
        ),
        pw.Expanded(
          child: pw.RichText(
            text: pw.TextSpan(children: textSpans),
          ),
        ),
      ],
    );
  }
}
