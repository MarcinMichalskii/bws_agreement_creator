import 'package:bws_agreement_creator/form.dart';
import 'package:intl/intl.dart';

class LegalGuardianConsentDictionary {
  final FormState form;
  LegalGuardianConsentDictionary(this.form);

  String get dateOfConclusion =>
      'Kraków, dnia: ${DateFormat('dd.MM.yyyy').format(form.dateOfSign)}';

  String get guardianData => '''
Imię i nazwisko: ${form.parentName}
PESEL: ${form.parentPesel},
Adres: ${form.parentAdres}',
Nr dokumentu: ${form.parentId}
''';

  String get title => '''
Zgoda przedstawiciela ustawowego dziecka na wykonywanie przez
dziecko pracy lub innych zajęć zarobkowych
''';

  String get childData => '''
Będąc przedstawicielem ustawowym małoletniego
Imię i nazwisko: ${form.name} ${form.lastName}
PESEL: ${form.pesel},
Adres: ${form.placeOfDomicile.fullAddress}',
Nr dokumentu: ${form.passportOrIdNumber}
''';

  String get guardianConsent => '''
wyrażam zgodę na wykonywanie przez niego na podstawie umowy cywilnoprawnej usług polegających na: montażach, obsłudze i demontażach scenotechniki, przeładunku ciężarówek, pracach pomocniczych w magazynach i na eventach; świadczonych na rzecz
''';

  String get bwsData => '''
BWS Event Support Sp. z o.o.
NIP 6751759898
KRS 0000944605
ul. Na Szaniec 7, 31-559 Kraków
''';

  String get period => '''
Okres możliwości wykonywania usług określony został w umowie podpisanej z usługobiorcą.
''';
}
