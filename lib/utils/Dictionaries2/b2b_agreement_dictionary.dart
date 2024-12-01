import 'package:bws_agreement_creator/Model/new_form_data.dart';
import 'package:bws_agreement_creator/utils/Dictionaries2/normal_agreement_dictionary.dart';

class PolishB2BAgreementDictionary {
  final NewFormData form;
  PolishB2BAgreementDictionary(this.form);

  String get bwsData => '''
spółką ${BWS.nameAndAddress}, dla której Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie XI Wydział Gospodarczy Krajowego Rejestru Sądowego prowadzi akta rejestrowe pod numerem KRS: 0000944605, posiadającą NIP: 6751759898, REGON: 520910120, reprezentowaną przez Aleksandrę Wróblewską - Prokurenta, zwaną w dalszej części Umowy: „BWS”, a: ”
''';

  String get contractorData => '''
Imię i nazwisko: ${form.loginData?.name}
Nazwa firmy: ${form.b2bCompanyName}
PESEL: ${form.loginData?.pesel}
Nr dokumentu: $documentId
Adres: ${form.loginData?.address}
NIP: ${form.b2bCompanyNip}
''';

  String get documentId {
    if (form.loginData?.idNumber != null) {
      return 'Dowód osobisty: ${form.loginData?.idNumber}';
    } else if (form.loginData?.passportId != null) {
      return 'Paszport: ${form.loginData?.passportId}';
    } else {
      return '';
    }
  }

  String get confirmedByIdText => '''
co zostało stwierdzone w oparciu o okazany dowód osobisty/dokument tożsamości, działającym w formie jednoosobowej działalności gospodarczej / spółki, zwanym w dalszej części Umowy „Usługodawcą”.

przy czym BWS i Usługodawca łącznie w dalszej części Umowy zwanymi „Stronami”, a każdy z nich oddzielnie „Stroną”.
''';

  ParagraphData get rulesOfServiceProviding => ParagraphData(
          title: 'Zasady świadczenia Usług przez Usługodawcę',
          points: [
            ...PolishAgreementDictionary(form).rulesOfServiceProviding.points,
            '''
Usługodawca może powierzać wykonywanie Usług swoim pracownikom lub innym podmiotom, które w zakresie swej działalności zawodowej trudnią się wykonywaniem takich czynności, jednakże tylko tym podmiotom, które zostały przez Usługodawcę wskazane w załączniku nr 2 do niniejszej Umowy. Niedopuszczalnym jest powierzenie przez Usługodawcę wykonywania Usług podmiotom niewskazanym w załączniku nr 2 do niniejszej Umowy.  
''',
            '''
W przypadku, o którym mowa w ust. 11 powyżej, Usługodawca ponosi względem BWS pełną odpowiedzialność za prawidłowe i terminowe wykonanie Usług, w tym za wykonanie przez osoby lub podmioty, którym Usługodawca powierzył świadczenie Usług wszystkich zobowiązań wynikających z Umowy oraz Umów Szczegółowych, w tym w szczególności zobowiązań wynikających z niniejszego paragrafu.
''',
            '''
Usługodawca zobowiązuje się do naprawy wszelkich szkód wyrządzonych przez podmioty, którym powierzone zostało świadczenie Usług przez Usługodawcę, a w szczególności do naprawy tych szkód, które poniesie BWS lub jego kontrahenci w związku z powierzeniem przez Usługodawcę świadczenia Usług innym podmiotom. 
''',
          ]);

  ParagraphData get periodOfAgreement =>
      ParagraphData(title: 'Okres obowiązywania Umowy', points: [
        '''
Umowa zostaje zawarta na czas nieokreślony.
''',
        '''
Niniejsza Umowa w każdym czasie może ulec rozwiązaniu za porozumieniem Stron wyrażonym w formie pisemnej pod rygorem nieważności.
''',
        '''
Każda ze Stron może, z zachowaniem formy pisemnej pod rygorem nieważności, wypowiedzieć Umowę, z zachowaniem 14-dniowego (słownie: czternastodniowego) okresu wypowiedzenia.
''',
        '''
BWS może, z zachowaniem formy pisemnej pod rygorem nieważności, wypowiedzieć Umowę ze skutkiem natychmiastowym w przypadku, gdy Usługodawca:
    1) nie wykonał Umowy Szczegółowej,
    2) niewłaściwie wykonał Umowę Szczegółową lub naruszył zasady wskazane w niniejszej
Umowie,
    3) przy wykonywaniu Umowy Szczegółowej spowodował umyślnie szkodę w mieniu BWS lub osoby trzeciej,
''',
        '''
Usługodawca może, z zachowaniem formy pisemnej pod rygorem nieważności, wypowiedzieć
Umowę ze skutkiem natychmiastowym w przypadku, gdy BWS pozostaje w zwłoce przez okres 14 (słownie: czternastu) dni w zapłacie Wynagrodzenia określonego w § 5 Umowy, z tym jednak, że Usługodawca przed złożeniem oświadczenia o wypowiedzeniu Umowy ze skutkiem natychmiastowym zobowiązany jest wezwać BWS do zapłaty i wyznaczyć mu dodatkowy termin na wykonanie zobowiązania, który nie może być krótszy niż 5 (słownie: pięć) dni.
''',
        '''
Po zakończeniu Umowy, Strony zobowiązane są do niezwłocznego rozliczenia się, w tym w szczególności rozliczenia udostępnionych Usługodawcy przez BWS narzędzi, obuwia lub odzieży.
''',
      ]);

  ParagraphData get salary {
    List<String> points = PolishAgreementDictionary(form).salary.points;
    points.insert(2, '''
Wynagrodzenia należne Usługodawcy za wykonanie danej Umowy Szczegółowej zostaje każdorazowo wskazane w Zawiadomieniu. Wynagrodzenie w Zawiadomieniu może zostać podane w formie ryczałtowej lub stawki godzinowej.
''');
    return ParagraphData(
        title: 'Zasady świadczenia Usług przez Usługodawcę', points: points);
  }

  ParagraphData get penalties => ParagraphData(title: 'Kary umowne', points: [
        '''
W każdym przypadku, w którym Usługodawca po zawarciu danej Umowy Szczegółowej odmówi jej wykonania, zobowiązany jest, bez wezwania, do zapłaty na rzecz BWS kary umownej w kwocie 300 zł (słownie: trzysta złotych) za każdy dzień, w którym Usługodawca odmawia wykonania Umowy Szczegółowej. Kara umowna, o której mowa w zdaniu powyżej, nie może jednak przekraczać wielokrotności kwoty 300 zł oraz liczby dni, w których Usługodawca zobowiązał się do świadczenia na rzecz BWS Usług na podstawie Umowy Szczegółowej. Za odmowę wykonania Umowy Szczegółowej uważa się także takie dorozumiane działanie lub zaniechanie Usługodawcy, w następstwie którego dana Umowa Szczegółowa nie może zostać wykonana w sposób prawidłowy i terminowy, w tym nieprzystąpienie do wykonywania Usług. 
''',
        '''
W każdym przypadku, w którym Usługodawca poda w Sinch nieprawdziwe informacje, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 500,00 zł (słownie: pięćset złotych).
''',
        '''
W przypadku, w którym Usługodawca naruszy zasady świadczenia Usług określone w niniejszej Umowie, w tym powierzy świadczenie Usług lub wykonanie Umowy Szczegółowej podmiotom nietrudniącym się w ramach swojej działalności zawodowej tego typu usługami lub powierzy świadczenie Usług podmiotom nieznajdującym się w oświadczeniu stanowiącym załącznik nr 2 do Umowy, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.
''',
        '''
W przypadku, w którym Usługodawca naruszy obowiązek zachowania poufności określony w § 7 powyżej, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.
''',
        '''
W przypadku, w którym Usługodawca naruszy zobowiązanie do niekorzystania z oprogramowania celem zawarcia Umowy Szczegółowej, o którym mowa w § 2 ust. 10 Umowy, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.
''',
        '''
Zapłata przez Usługodawcę określonych powyżej kar umownych nie pozbawia BWS prawa dochodzenia od Usługodawcy na zasadach ogólnych odszkodowania przekraczającego wysokość zastrzeżonych kar umownych, do wysokości poniesionej przez BWS szkody.
''',
      ]);
}
