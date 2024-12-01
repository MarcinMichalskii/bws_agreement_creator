import 'package:bws_agreement_creator/utils/Dictionaries2/normal_agreement_dictionary.dart';
import 'package:bws_agreement_creator/utils/pdf_widget_set.dart';
import 'package:pdf/widgets.dart' as pw;

class DataProcessingData {
  String title;
  String value;
  DataProcessingData({required this.title, required this.value});

  pw.Widget toHedearedRow() {
    return PdfWidgetSet().headeredRow(
      point: title,
      value: value,
    );
  }
}

class DataProcessingPolishDictionary {
  String get dataProcessingInformationTitle => '''
INFORMACJA 
o przetwarzaniu Twoich danych osobowych
''';

  String get dataProcessingInformationDescritpion => '''
Zgodnie z art. 13 ust. 1 i ust. 2 Rozporządzenia Parlamentu Europejskiego i Rady (UE) 2016/679 z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE (ogólne rozporządzenie o ochronie danych - RODO) spółka BWS Event Support Sp. z o.o. niniejszym informuję Cię, że przetwarza Twoje dane osobowe. Szczegóły tego dotyczące znajdziesz poniżej.
''';

  List<DataProcessingData> get points => [
        DataProcessingData(
            title: 'I. Administrator danych osobowych', value: '''
Administratorem Twoich danych osobowych jest spółka ${BWS.nameAndAddress} dla której Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie, XI Wydział Gospodarczy KRS prowadzi akta rejestrowe pod numerem KRS: 0000944605, posiadająca NIP: 6751759898, REGON: 52091012.
'''),
        DataProcessingData(
            title: 'II. Cele i podstawy przetwarzania', value: '''
Twoje dane będą przetwarzane:
    1) w celu zawarcia i wykonania Umowy Ramowej Świadczenia Usług oraz umów
    o świadczenie usług zawieranych w zakresie realizacji Umowy Ramowej Świadczenia
    Usług (tj. Umów Szczegółowych) (podstawa z art. 6 ust. 1 lit. b RODO);
    2) w celach archiwalnych (dowodowych) dla zabezpieczenia informacji na wypadek
    prawnej potrzeby wykazania faktów, co jest prawnie uzasadnionym interesem
    Administratora (podstawa z art. 6 ust. 1 lit. f RODO);
    3) w celu ewentualnego ustalenia, dochodzenia lub obrony przed roszczeniami, co jest
    prawnie uzasadnionym interesem Administratora (podstawa z
    art. 6 ust. 1 lit. f RODO).
'''),
        DataProcessingData(title: 'III. Odbiorcy danych', value: '''
Twoje dane osobowe Administrator udostępniać następującym kategoriom podmiotów:
    1) Osobom upoważnionym przez Administratora - pracownikom oraz
    współpracownikom;
    2) Podmiotom, którym Administrator powierzył przetwarzanie danych osobowych
    (podmioty przetwarzające) na podstawie zawartych umów;
    3) Klientom Administratora - Administrator może udostępnić Twoje imię i nazwisko,
    numer telefonu, a także ewentualnie adres e-mail, aby Klienci Administratora mogli
    zarejestrować Cię np. w celu otrzymania odpowiedniego identyfikatora, gdy
    wymagają tego względy bezpieczeństwa. Klienci Administratora są zobowiązani
    umową i innymi zobowiązaniami dotyczącymi poufności danych. Twoje udostępnione
    dane zostaną usunięte przez Klienta Administratora natychmiast po wykonaniu
    usługi; chyba że prawo lub umowa stanowi inaczej;
    4) Podmiotom, którym Administrator zobligowany będzie udostępnić dane na podstawie
    przepisów prawa;
    5) Odbiorcom danych tacy jak: kurierzy i banki.
'''),
        DataProcessingData(
            title:
                'IV. Przekazywanie danych do państw trzecich lub organizacji międzynarodowych',
            value: '''
Twoje dane nie zostaną przekazane poza teren Unii Europejskiej, jak również nie zostaną przekazane organizacjom międzynarodowym.
'''),
        DataProcessingData(title: 'V. Okres przechowywania danych', value: '''
Twoje dane pozyskane w związku z zawarciem i wykonywaniem Umowy Ramowej Świadczenia Usług oraz Umów Szczegółowych będą przetwarzane do czasu ich zakończenia, po tym czasie przez okres oraz w zakresie wymaganym przez przepisy prawa, w szczególności dotyczących przechowywanie dowodów księgowym i dla zabezpieczenia ewentualnych roszczeń do końca okresu przedawnienia potencjalnych roszczeń z tytułu tych Umów.
'''),
        DataProcessingData(title: 'VI. Twoje prawa:', value: '''
Przysługuje Ci:
    1) prawo dostępu do swoich danych oraz otrzymania ich kopii (art. 15 RODO);
    2) prawo do sprostowania (poprawiania) swoich danych (art. 16 RODO);
    3) prawo do usunięcia danych (art. 17 RODO);
    4) prawo do ograniczenia przetwarzania danych (art. 18 RODO);
    5) prawo do przenoszenia danych (art. 20 RODO);
    6) prawo do wniesienia sprzeciwu wobec przetwarzania danych (art. 21 RODO).
W celu wykonania swoich praw skieruj żądanie pod adres email: office@bws.net.pl,
Pamiętaj, przed realizacją Twoich uprawnień Administrator będzie musiał upewnić się, że Ty
to Ty, czyli odpowiednio Cię zidentyfikować.
'''),
        DataProcessingData(
            title: 'VII. Prawo do wniesienia skargi do organu nadzorczego',
            value: '''
Jeżeli uważasz, że Twoje dane są przetwarzane niezgodnie z prawem, możesz złożyć w tej sprawie skargę do Prezesa Urzędu Ochrony Danych Osobowych lub innego właściwego organu nadzorczego.
'''),
        DataProcessingData(
            title: 'VIII. Informacja o dobrowolności podania danych', value: '''
Podanie przez Ciebie danych jest warunkiem zawarcia i wykonywania Umowy Ramowej Świadczenia Usług oraz Umów Szczegółowych.
'''),
        DataProcessingData(title: 'IX. Brak profilowania', value: '''
Twoje dane osobowe nie są przedmiotem profilowania jako jednej z form zautomatyzowanego przetwarzania danych osobowych
'''),
      ];
}
