import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/byte_data_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PDF2 {
  Future<Uint8List> test(FormState form) async {
    final PdfDocument document = PdfDocument();

    final ByteData fontDataa =
        await rootBundle.load('assets/fonts/opensans.ttf');

    final data = fontDataa.dataAsUint8();

    document.pages.add();
    final page = document.pages[0];

    final PdfLayoutResult layoutResult = PdfTextElement(
      text: "Umowa o świadczenie usług",
      font: PdfTrueTypeFont(data, 12),
    ).draw(
        page: page,
        bounds: Rect.fromLTWH(page.getClientSize().width / 2, 0,
            page.getClientSize().width, page.getClientSize().height),
        format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate))!;

    final file = await document.save();
    document.dispose();
    return file.asUint8List();
  }
}

extension AsUint8List on List<int> {
  Uint8List asUint8List() {
    final self = this;
    return (self is Uint8List) ? self : Uint8List.fromList(this);
  }
}
