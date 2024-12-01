import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/utils/Dictionaries2/agreement_consts.dart';
import 'package:intl/intl.dart';

class ContractorStatementDictionary {
  final NewFormData form;
  ContractorStatementDictionary(this.form);

  String get dateOfConclusion => 'Kraków, dnia: ${form.dateOfSign}';

  String get contractorData => '''
Imię i nazwisko: ${form.loginData?.name}
PESEL: ${form.loginData?.pesel}
Adres: ${form.loginData?.address}
$documentId
''';

  String get documentId {
    if (form.loginData?.studentId != null) {
      return 'Nr legitymacji studenckiej: ${form.loginData?.studentId}';
    } else if (form.loginData?.idNumber != null) {
      return 'Dowód osobisty: ${form.loginData?.idNumber}';
    } else if (form.loginData?.passportId != null) {
      return 'Paszport: ${form.loginData?.passportId}';
    } else {
      return '';
    }
  }

  String get statement => '''
Oświadczam że:
''';

  String get workInOtherCompany => '''
A) ${form.worksInOtherCompany ? 'Pracuję' : 'Nie pracuję'} w innym zakładzie pracy
''';

  String get otherCompanyDescription => '''
Nazwa zakładu: ${form.otherCompanyName}
Adres zakładu: ${form.otherCompanyAddress ?? ''},
NIP: ${form.otherCompanyNip}
Z tytułu zatrudnienia osiągam dochód wyższy niż minimalne wynagrodzenie za pracę ${AgreementConsts.minimalWage}zł brutto
''';

  String get otherCompanyContractPeriod => '''
Umowa obowiązuje od ${DateFormat('dd.MM.yyyy').format(form.otherCompanyStartDate!)} do ${DateFormat('dd.MM.yyyy').format(form.otherCompanyStartDate!)}
''';

  String get otherCompanyContractWithoutPeriod => '''
Umowa obowiązuje od ${DateFormat('dd.MM.yyyy').format(form.otherCompanyStartDate!)} na czas nie określony
''';

  String get hasOwnCompany => '''
B) Nie prowadzę działalności gospodarczej
''';

  String get hasStudentStatus => '''
C) Posiadam status studenta / ucznia , stosowny dokument potwierdzający mój status został umieszczony w profilu Sinch. Numer legitymacji: ${form.loginData?.studentId}
''';

  String get studentStatusDescription => '''}
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
