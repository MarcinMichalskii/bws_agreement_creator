import 'package:bws_agreement_creator/form.dart';
import 'package:intl/intl.dart';

class ContractorStatementDictionary {
  final FormState form;
  ContractorStatementDictionary(this.form);

  String get dateOfConclusion =>
      'Kraków, dnia: ${DateFormat('dd.MM.yyyy').format(form.dateOfSign)}';

  String get contractorData => '''
Imię i nazwisko: ${form.parentName}
PESEL: ${form.parentPesel},
Adres zameldowania: ${form.parentAdres}', ${form.hasTwoAdresses ? '\n Adres zamieszkania: ${form.placeOfLiving}' : ''}
Nr dokumentu: ${form.parentId}
''';

  String get statement => '''
Oświadczam że:
''';

  String get workInOtherCompany => '''
A) ${form.worksInOtherCompany ? 'Pracuję' : 'Nie pracuję'} w innym zakładzie pracy
''';

  String get otherCompanyDescription => '''
Nazwa zakładu: ${form.otherCompanyName}
Z tytułu zatrudnienia osiągam dochód ${form.earnsMoreThanMinimalWage ? 'wyższy' : 'niższy'} niż minimalne wynagrodzenie za pracę 3010zł brutto
''';

  String get otherCompanyContractPeriod => '''
Umowa obowiązuje od ${DateFormat('dd.MM.yyyy').format(form.agreementWithTimeStart)} do ${DateFormat('dd.MM.yyyy').format(form.agreementWithTimeEnd)}
''';

  String get hasOwnCompany => '''
B) Nie prowadzę działalności gospodarczej
''';

  String get hasStudentStatus => '''
C) Posiadam status studenta / ucznia , stosowny dokument potwierdzający mój status został umieszczony w profilu Sinc. Numer legitymacji: 'NR LEGITYMACJI'}
''';

  String get doesntHaveStudentStatus => '''
C) Nie posiadam statusu studenta / ucznia
''';

  String get finalStatement => '''
Oświadczam, że powyższe zgłoszenie wypełniłem zgodnie z prawdą i że świadomy jestem odpowiedzialności karnej z art. 233 § 1 kodeksu karnego za zeznawanie nieprawdy lub zatajenie prawdy.
O wszelkich zmianach w stosunku do danych zawartych w niniejszym oświadczeniu zobowiązuję się
powiadomić zleceniodawcę
''';
}
