import 'package:bws_agreement_creator/Model/new_form_data.dart';

class LegalGuardianConsentDictionary {
  final NewFormData form;
  LegalGuardianConsentDictionary(this.form);

  String get dateOfConclusion => 'Kraków, dnia: ${form.dateOfSign}';

  String get guardianData => '''
Imię i nazwisko: ${form.legalGuardianName}
PESEL: ${form.legalGuardianPesel},
Adres: ${form.legalGuardianAddress}',
Nr dokumentu: ${form.legalGuardianIdNumber}
''';

  String get title => '''
Zgoda przedstawiciela ustawowego dziecka na wykonywanie przez
dziecko pracy lub innych zajęć zarobkowych
''';

  String get childData => '''
Będąc przedstawicielem ustawowym małoletniego
Imię i nazwisko: ${form.loginData?.name}
PESEL: ${form.loginData?.pesel},
Adres: ${form.loginData?.address}',
Nr dokumentu: ${form.loginData?.studentId}
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
