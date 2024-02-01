import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/pdf_widget_set.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

abstract class TranslatedAgreementDictionary {
  FormState get form;
}

class PolishAgreementDictionary implements TranslatedAgreementDictionary {
  final FormState form;

  PolishAgreementDictionary(this.form);

  final agreementTitle = 'Umowa Ramowa o świadczenie usług';

  String get dateOfConclusion =>
      'zawarta w dniu ${DateFormat('dd.MM.yyyy').format(form.dateOfSign)} w Krakowie pomiędzy';

  String get bwsData =>
      '''spółką BWS Event Support Sp. z o.o. z siedzibą w Krakowie 31-559, przy ul. Na Szaniec 7,
NIP 6751759898,
KRS 0000944605,
reprezentowaną przez Aleksandrę Wróblewską - Prokurenta,
zwaną w dalszej części Umowy: „BWS” a zleceniobiorcą posługującym się danymi:
''';

  String get contractorData => '''
Imię i nazwisko: ${form.name} ${form.lastName}
PESEL: ${form.pesel}
Nr dokumentu: ${form.passportOrIdNumber}
Adres: ${form.placeOfDomicile.fullAddress}',
''';

  String get confirmedByIdText => '''
co zostało stwierdzone w oparciu o okazany dowód osobisty/dokument tożsamości,działającym osobiście,zwanym w dalszej części Umowy: „Usługodawcą”,

przy czym BWS i Usługodawca łącznie w dalszej części Umowy zwani są „Stronami”, a każde z nich oddzielnie „Stroną”.

Zważywszy że: ''';

  String get titlePagePoint1 => '''
BWS jest spółką, której działalność w szczególności związana jest z organizacją, obsługą i
zaopatrzeniem technicznym oraz personalnym targów, wystaw, kongresów, festiwali, koncertów, spektakli, innych wydarzeń kulturalnych, eventów i imprez, w tym imprez masowych i plenerowych (zwanych w dalszej części Umowy Wydarzeniami) oraz obsługą magazynów, w tym obsługą polegającą na przeładunku ciężarówek i dokonywaniu inwentaryzacji sprzętu
''';

  String get titlePagePoint2 => '''
Usługodawca posiada umiejętności i doświadczenie w zakresie wykonywania czynności fizycznych, w tym w szczególności przeładunku ciężarówek, sprzątania magazynów, montażu i demontażu instalacji oświetlenia lub dźwięku oraz konstrukcji stalowych, jak również doświadczenie i umiejętności wymagane do obsługi wydarzeń,
''';

  String get titlePagePoint3 => '''
Strony zawarły Umowę Świadczenia Usług Drogą Elektroniczną Za Pośrednictwem Systemu Sinch,
''';

  String get titlePagePoint4 => '''
Strony planują prowadzić długoterminową współpracę
''';

  String get titlePageConclusion => '''
Strony postanawiają, co następuje:
''';

  String get paragraph1Title => '''
Cel Umowy
''';

  String get paragraph1Point1 => '''
Celem niniejszej Umowy jest określenie zasad współpracy, praw i obowiązków Stron związanych ze świadczeniem Usług przez Usługodawcę na rzecz BWS, oraz kwestii mających zasadnicze znaczenie dla zapewnienia prawidłowej i efektywnej współpracy Stron Umowy, w tym w szczególności tryb zawierania oraz rodzaj i treść Umów Szczegółowych.
''';

  String get paragraph1Point2 => '''
Na potrzeby wykonywania zarówno Umowy jak i poszczególnych umów o świadczenie usług,
które zostaną zawarte w związku z niniejszą Umową, Strony wskazują, że następujące pojęcia
będą definiowane jak poniżej:
2.1. <b>Usługi</b> - rozumie się wykonywanie przez Usługodawcę określonych czynności fizycznych, w
tym w szczególności:
    2.1.1. polegających na przeładunku ciężarówek, sprzątaniu i inwentaryzacji magazynów,
    montażu i demontażu instalacji oświetlenia, wideo, dźwięku lub konstrukcji stalowych i
    aluminiowych,
    2.1.2. innych czynności fizycznych związanych z organizacją i obsługą Wydarzeń,
    2.1.3. obsługi maszyn, stosowanie do posiadanych przez Usługodawcę uprawnień,
    2.1.4. pracy na wysokości, stosownie do posiadanych przez Usługodawcę uprawnień;
2.2. <b>Umowa</b> - oznacza Umowę Ramową o Świadczenie Usług zawartą pomiędzy BWS, a Usługodawcą;
2.3. <b>Sinch</b> - platforma internetowa BWS (https://bws.onsinch.com/), za pomocą której Usługodawcy zawierają z BWS umowę świadczenia usług drogą elektroniczną oraz Umowy Szczegółowe;
2.4. <b>Umowa Szczegółowa</b> - umowa świadczenia Usług w związku z organizacją, obsługą i zaopatrzeniem technicznym oraz personalnym przez BWS określonego Wydarzenia lub obsługi magazynu zawarta za pośrednictwem Sinch pomiędzy BWS, a Usługodawcą, na podstawie niniejszej Umowy;
2.5. <b>Wydarzenie</b> - wydarzenie m. in. kulturalne lub sportowe, które będzie częściowo lub w całości obsługiwane przez BWS w zakresie organizacji, obsługi i zaopatrzenia technicznego lub personalnego;
2.6. <b>Wynagrodzenie</b> - wynagrodzenie z tytułu odpłatnego świadczenia przez Usługodawcę na rzecz BWS Usług na podstawie Umowy Szczegółowej;
2.7. <b>Zawiadomienie</b> - zawiadomienie Usługodawcy o planowanym Wydarzeniu obsługiwanym przez BWS, które odbywa się za pośrednictwem Sinch.
2.8. <b>Rejestracja</b> - oznacza zarejestrowanie się przez Usługodawcę do świadczenia Usług na rzecz BWS związanych z konkretnym Zawiadomieniem za pośrednictwem Sinch lub też, na prośbę Usługodawcy, za pośrednictwem BWS.
''';

  String get paragraph2Title => '''
Tryb zawierania Umów Szczegółowych
''';

  String get paragraph2Point1 => '''
Umowa Szczegółowa będzie każdorazowo obejmowała świadczenie Usług przez Usługodawcę na rzecz BWS w związku z organizacją, obsługą i zaopatrzeniem technicznym oraz personalnym przez BWS określonego Wydarzenia lub obsługi magazynu.
''';

  String get paragraph2Point2 => '''
Do zawarcia przez Strony Umowy Szczegółowej będzie każdorazowo wykorzystywany system informatyczny Sinch (zwanym w dalszej części Umowy Sinch). Posiadanie i korzystanie przez Usługodawcę konta w Sinch jest niezbędne do zawierania Umów Szczegółowych.
''';

  String get paragraph2Point3 => '''
BWS w Sinch będzie zamieszczał Zawiadomienia o organizowanych przez BWS Wydarzeniach. W Zawiadomieniu zostanie podany opis Wydarzenia, w tym planowane miejsce i czas rozpoczęcia świadczenia Usług, zakres wymaganych Usług oraz proponowane Wynagrodzenie za świadczenie wymaganych Usług.
''';

  String get paragraph2Point4 => '''
Usługodawca za pośrednictwem Sinch będzie miał możliwość zarejestrować się do świadczenia Usług określonych w Zawiadomieniu (zwana w dalszej części Umowy Rejestracją), jak również dostęp do historii świadczonych usług oraz otrzymanego z tego tytułu wynagrodzenia.
''';

  String get paragraph2Point5 => '''
Usługodawca zobowiązuje się do posiadania aktywnego konta w Sinch oraz umieszczania w Sinch wyłącznie danych, które są prawdziwe i aktualne.
''';

  String get paragraph2Point6 => '''
Zawarcie przez Strony Umowy Szczegółowej będzie każdorazowo następowało w momencie dokonania przez Usługodawcę Rejestracji.
''';

  String get paragraph2Point7 => '''
Usługodawca zobowiązuje się podejmować się świadczenia wyłącznie tych Usług, dla których posiada niezbędne doświadczenie, umiejętności i uprawnienia. Zawarcie przez Usługodawcę Umowy Szczegółowej obejmujące dane Usługi uznaje się za złożenie przez Usługodawcę oświadczenia, że posiada niezbędne doświadczenie, umiejętności, badania lekarskie, szkolenia BHP i uprawnienia do świadczenia tych Usług.
''';

  String get paragraph2Point8 => '''
Na treść każdej Umowy Szczegółowej będą składały się postanowienia niniejszej Umowy oraz danego Zawiadomienia.
''';

  String get paragraph2Point9 => '''
Usługodawca może zawrzeć Umowę Szczegółową samodzielnie, za pośrednictwem Sinch lub na swoją prośbę wyrażoną telefonicznie lub za pośrednictwem SMS lub komunikatorów internetowych lub portali społecznościowych może zostać wpisany przez osobę do tego uprawnioną (tj. osobę wyznaczoną do tego przez BWS). Wpisanie Usługodawcy do wykonania Umowy Szczegółowej na jego prośbę przez BWS w systemie Sinch jest równoznaczne z akceptacją przez Usługodawcę wszystkich warunków wykonywania tej Umowy Szczegółowej, które zawarte są zarówno w systemie Sinch (Umowa Szczegółowa) jak i w Umowie.
''';

  String get paragraph3Title => '''
Zasady świadczenia Usług przez Usługodawcę
''';

  String get paragraph3Point1 => '''
Usługodawca zobowiązuje się do osobistego wykonywania Umów Szczegółowych. Usługodawca zobowiązuje się wykonywać Umowy Szczegółowe z najwyższą starannością i zgodnie z zasadami wiedzy technicznej. Usługodawca wykonując Umowy Szczegółowe nie może znajdować się pod wpływem alkoholu, substancji psychotropowych lub środków odurzających.
''';

  String get paragraph3Point2 => '''
Usługodawca zobowiązany jest każdorazowo punktualnie rozpocząć wykonywanie Umowy Szczegółowej. Przed rozpoczęciem wykonania Umowy Szczegółowej Usługodawca zobowiązuje się poinformować BWS o przewidywanym czasie niezbędnym do wykonania Umowy Szczegółowej.
''';

  String get paragraph3Point3 => '''
Usługodawca zobowiązuje się przez cały czas wykonywania Umów Szczegółowych do posiadania przy sobie wszelkiej niezbędnej dokumentacji wymaganej obowiązującymi przepisami prawa polskiego lub charakterem świadczonych Usług.
''';

  String get paragraph3Point4 => '''
Usługodawca zobowiązuje się przez cały czas wykonywania Umów Szczegółowych do korzystania z wymaganych obowiązującymi przepisami prawa (w tym w szczególności rozporządzeniem Ministra Pracy i Polityki Socjalnej z dnia 26 września 1997 r. w sprawie ogólnych przepisów bezpieczeństwa i higieny pracy w wersji obowiązującej na dzień wykonywania Umowy Szczegółowej) lub charakterem świadczonych Usług stosownych narzędzi, obuwia lub odzieży.
''';

  String get paragraph3Point5 => '''
Usługodawca zobowiązany jest do prowadzenia ewidencji czasu wykonywania Umowy Szczegółowej.
''';

  String get paragraph3Point6 => '''
W przypadku świadczenia na rzecz BWS Usług poza stałym miejscem świadczenia Usług przez Usługodawcę, BWS doliczy Usługodawcy do wynagrodzenia za wykonanie danej Umowy Szczegółowej koszty poniesione przez Usługodawcę celem dojazdu na miejsce wykonania Umowy Szczegółowej, pod warunkiem uzyskania przez Usługodawcę uprzedniej akceptacji wysokości poniesionych kosztów oraz przedłożenia BWS przez Usługodawcę rachunków potwierdzających faktyczne poniesienie tych kosztów przez Usługodawcę.
''';

  String get paragraph3Point7 => '''
W przypadku, w którym Usługodawca nie może wykonać Umowy Szczegółowej,
w tym w szczególności z powodów zdrowotnych, Usługodawca jest zobowiązany do niezwłocznego poinformowania o tym BWS oraz przedstawienia stosownej dokumentacji.
''';

  String get paragraph3Point8 => '''
Usługodawca oświadcza, iż w każdym dniu świadczenia usług posiada ważne badania lekarskie oraz szkolenie BHP odpowiednie do charakteru wykonywanych usług.
''';

  String get paragraph3Point9 => '''
Usługodawca oświadcza, że został poinformowany przez BWS o warunkach bezpiecznego wykonania przedmiotu Umów Szczegółowych. Ponadto Usługodawca oświadcza, że został przeszkolony w zakresie bezpieczeństwa i higieny pracy.
''';

  String get paragraph3Point10 => '''
Usługodawca oświadcza niniejszym, że wyraża zgodę na nieograniczone czasowo wykorzystanie wizerunku Usługodawcy, który zostanie pozyskany przez BWS w szczególności, choć niewyłącznie, podczas świadczenia Usług na rzecz BWS, w celu promowania działalności BWS.
''';

  String get paragraph4Title => '''
Okres obowiązywania Umowy
''';

  String get paragraph4Point1 => '''
Umowa zostaje zawarta na czas nieokreślony.
''';

  String get paragraph4Point2 => '''
Niniejsza Umowa w każdym czasie może ulec rozwiązaniu za porozumieniem Stron wyrażonym
w formie pisemnej pod rygorem nieważności.
''';

  String get paragraph4Point3 => '''
Każda ze Stron może, z zachowaniem formy pisemnej pod rygorem nieważności, wypowiedzieć
Umowę, z zachowaniem 14-dniowego (słownie: czternastodniowego) okresu wypowiedzenia.
''';

  String get paragraph4Point4 => '''
BWS może, z zachowaniem formy pisemnej pod rygorem nieważności, wypowiedzieć Umowę ze
skutkiem natychmiastowym w przypadku, gdy Usługodawca:
    1) nie wykonał Umowy Szczegółowej,
    2) niewłaściwie wykonał Umowę Szczegółową lub naruszył zasady wskazane w niniejszej
Umowie,
    3) przy wykonywaniu Umowy Szczegółowej spowodował umyślnie szkodę
    w mieniu BWS lub osoby trzeciej,
''';

  String get paragraph4Point5 => '''
Usługodawca może, z zachowaniem formy pisemnej pod rygorem nieważności, wypowiedzieć
Umowę ze skutkiem natychmiastowym w przypadku, gdy BWS pozostaje w zwłoce przez okres 14 (słownie: czternastu) dni w zapłacie Wynagrodzenia określonego w § 5 Umowy, z tym jednak, że Usługodawca przed złożeniem oświadczenia o wypowiedzeniu Umowy ze skutkiem natychmiastowym zobowiązany jest wezwać BWS do zapłaty i wyznaczyć mu dodatkowy termin na wykonanie zobowiązania, który nie może być krótszy niż 5 (słownie: pięć) dni.
''';

  String get paragraph4Point6 => '''
Po zakończeniu Umowy, Strony zobowiązane są do niezwłocznego rozliczenia się, w tym w szczególności rozliczenia udostępnionych Usługodawcy przez BWS narzędzi, obuwia lub odzieży.
''';

  String get paragraph5Title => '''
Wynagrodzenie należne Usługodawcy za wykonanie Umowy Szczegółowej
''';

  String get paragraph5Point1 => '''
BWS zobowiązany jest do zapłaty Usługodawcy wynagrodzenia należnego za wykonanie Umowy Szczegółowej.
''';

  String get paragraph5Point2 => '''
Wynagrodzenia należne Usługodawcy za wykonanie danej Umowy Szczegółowej zostaje każdorazowo wskazane w Zawiadomieniu. Wynagrodzenie w Zawiadomieniu może zostać podane w formie ryczałtowej lub stawki godzinowej.
''';

  String get paragraph5Point3 => '''
W przypadku wynagrodzenia godzinowego, należne Usługodawcy wynagrodzenie zostanie ustalone na podstawie prowadzonej przez BWS ewidencji czasu wykonania Umowy Szczegółowej przez Usługodawcy.
''';

  String get paragraph5Point4 => '''
W przypadku ustalonego i zaakceptowanego uprzednio przez BWS wykorzystywania własnego samochodu do celów związanych bezpośrednio z wykonywaniem zleceń przez Usługodawcę, Usługodawcy przysługuje kilometrówka w wysokości analogicznej, co ustalona w Rozporządzeniu Ministra Infrastruktury w sprawie warunków ustalania oraz sposobu dokonywania zwrotu kosztów używania do celów służbowych samochodów osobowych, motocykli i motorowerów niebędących własnością pracodawcy.
''';

  String get paragraph5Point5 => '''
Warunkiem wypłaty kilometrówki jest prawidłowe złożenie wniosku dostępnego w aplikacji Sinch (zakładka BAZA WIEDZY) najpóźniej do 5 dnia miesiąca, przed którym wykorzystywany był samochód.
''';

  String get paragraph5Point6 => '''
W przypadku świadczenia na rzecz BWS Usług poza stałym miejscem świadczenia Usług przez Usługodawcę, BWS doliczy Usługodawcy do wynagrodzenia za wykonanie danej Umowy Szczegółowej koszty poniesione przez Usługodawcę celem dojazdu na miejsce wykonania Umowy Szczegółowej, pod warunkiem uzyskania przez Usługodawcę uprzedniej akceptacji wysokości poniesionych kosztów oraz przedłożenia BWS przez Usługodawcę rachunków potwierdzających faktyczne poniesienie tych kosztów przez Usługodawcę.
''';

  String get paragraph5Point7 => '''
W przypadku, gdy w trakcie wykonywania Umowy Szczegółowej Usługodawca poweźmie informację, że do jej prawidłowego i terminowego wykonania niezbędne jest niezwłoczne poniesienie dodatkowych kosztów, które uprzednio były niemożliwe do przewidzenia przez BWS lub Usługodawcę i nie są objęte wynagrodzeniem za wykonanie danej Umowy Szczegółowej, Usługodawca zobowiązuje się pokryć te koszty celem terminowego i prawidłowego wykonania Umowy Szczegółowej. W sytuacji opisanej w zdaniu poprzedzającym Usługodawca zobowiązany jest przedłożyć BWS zestawienie takich kosztów wraz z dowodami ich poniesienia (np. faktury, paragony) najpóźniej w terminie 7 (słownie: siedmiu) dni od dnia zakończenia wykonywania przez Usługodawcę danej Umowy Szczegółowej, a BWS zobowiązuje się zwrócić tak poniesione koszty Usługodawcy w terminie 7 dni od dnia doręczenia BWS kompletnej informacji o poniesionych przez Usługodawcę dodatkowych i nieprzewidzianych uprzednio kosztach niezbędnych do prawidłowego i terminowego wykonania Umowy Szczegółowej wraz z dowodami ich poniesienia przez Usługodawcę.
''';

  String get paragraph5Point8 => '''
Zapłata przez BWS należnego Usługodawcy wynagrodzenia za wykonanie Umowy Szczegółowej zostanie dokonana najpóźniej w terminie 14 (słownie: czternastu) dni od dnia zakończenia wykonywania przez Usługodawcę danej Umowy Szczegółowej.
''';

  String get paragraph6Title => '''
Status studenta
''';

  String get paragraph6Point1 => '''
Usługodawca oświadcza, że ${form.isStudent ? 'posiada status' : 'nie posiada statusu'} studenta lub ucznia, w rozumieniu ustawy z dnia z dnia 13 października 1998 r. o systemie ubezpieczeń
społecznych.
''';

  String get paragraph6Point2 => '''
Usługodawca oświadcza, że ${form.worksInOtherCompany ? 'nie jest zatrudniony w innym przedsiębiorstwie' : 'jest zatrudniony w innym przedsiębiorstwie, ${form.earnsMoreThanMinimalWage ? earnsMoreThanMinimumWage : earnsLessThanMinimumWage}'}''';

  String get earnsMoreThanMinimumWage => '''
gdzie zarabia conajmniej minimalną krajową w skali miesiąca (3010zł brutto).
''';

  String get earnsLessThanMinimumWage => '''
gdzie zarabia poniżej minimalnej krajowej w skali miesiąca (3010zł brutto).
''';

  String get paragraph6Point3 => '''
Usługodawca oświadcza, iż nie przewiduje, aby jego dochody przekroczyły kwotę wolną od podatku w skali roku i wnioskuje do BWS na mocy art. 41 ust. 1c ustawy z dnia 26 lipca 1991r. o podatku dochodowym od osób fizycznych, o nieodprowadzanie za niego zaliczki na podatek dochodowy.
''';

  String get paragraph6Point4 => '''
Usługodawca oświadcza, iż nie chce, aby BWS odprowadzał za niego składkę chorobową.
''';

  String get paragraph6Point5 => '''
Usługodawca zobowiązuje się do niezwłocznego powiadomienia płatnika o każdej zmianie stanu faktycznego wynikającego z powyższych punktów § 7 pod rygorem przeniesienia na Usługodawcę odpowiedzialności finansowej za nieopłacone składki i podatki, wynikające ze zmianu stanu faktycznego.
''';

  String get paragraph7Title => '''
Poufność
''';

  String get paragraph7Point1 => '''
Przez Informacje Poufne rozumie się treść niniejszej Umowy oraz wszystkie dokumenty i informacje, w tym w szczególności informacje handlowe, techniczne, know-how o technicznym, handlowym, finansowym i każdym innym charakterze, materiały, graficzne komunikaty, specyfikacje, rysunki, elektroniczne i inne informacje, związane z działalnością BWS, partnerów BWS lub klientów BWS, ujawnione, udostępnione lub przekazane przez BWS, partnerów BWS lub klientów BWS Usługodawcy ustnie, na piśmie lub w jakikolwiek inny sposób, jak również uzyskane przy wykonywaniu lub w związku z wykonywaniem niniejszej Umowy przez Usługodawcę w jakikolwiek formie i w jakikolwiek sposób.
''';

  String get paragraph7Point2 => '''
Usługodawca zobowiązuje się Informacje Poufne zabezpieczyć przed dostępem osób trzecich, nie ujawniać, nie przekazywać ani nie udostępniać, w całości lub części, osobom trzecim bez uprzedniej pisemnej zgody BWS.
''';

  String get paragraph7Point3 => '''
Ujawnienie, udostępnione lub przekazane przez BWS, partnerów BWS lub klientów BWS Usługodawcy Informacji Poufnych nie stanowi oraz nie będzie interpretowane jako udzielenie lub przekazanie Usługodawcy jakichkolwiek praw do Informacji Poufnych, w tym żadnych patentów, licencji lub innych praw własności intelektualnej związanych z Informacjami Poufnymi.
''';

  String get paragraph7Point4 => '''
Usługodawca zobowiązuje się wykorzystać Informacje Poufne wyłącznie w celu, w jakim zostały Usługodawcy ujawnione, udostępnione lub przekazane przez BWS partnerów BWS lub klientów BWS.
''';

  String get paragraph7Point5 => '''
Usługodawca uprawniony jest do przekazywania Informacji Poufnych na zgodne z prawem żądanie organów administracji publicznej lub sądów, w zakresie objętym tym żądaniem. W takim przypadku Usługodawca niezwłocznie poinformuje o tej okoliczności BWS, chyba że nie będzie to prawnie dopuszczalne.
''';

  String get paragraph7Point6 => '''
W przypadku stwierdzenia jakiegokolwiek ujawnienia Informacji Poufnych, Usługodawca niezwłocznie poinformuje o tej okoliczności BWS.
''';

  String get paragraph7Point7 => '''
Zobowiązanie określone w niniejszym paragrafie wiążą Usługodawcę zarówno w czasie obowiązywania Umowy jak i przez okres 10 (słownie: dziesięciu) lat po jej zakończeniu.
''';

  String get paragraph8Title => '''
Kary umowne
''';

  String get paragraph8Point1 => '''
W każdym przypadku, w którym Usługodawca po zawarciu danej Umowy Szczegółowej odmówi jej wykonania, zobowiązany jest, bez wezwania, do zapłaty na rzecz BWS kary umownej w kwocie 300 zł (słownie: trzysta złotych) za każdy dzień, w którym Usługodawca odmawia wykonania Umowy Szczegółowej. Kara umowna, o której mowa w zdaniu powyżej, nie może jednak przekraczać wielokrotności kwoty 300 zł oraz liczby dni, w których Usługodawca zobowiązał się do świadczenia na rzecz BWS Usług na podstawie Umowy Szczegółowej. Za odmowę wykonania Umowy Szczegółowej uważa się także takie dorozumiane działanie lub zaniechanie Usługodawcy, w następstwie którego dana Umowa Szczegółowa nie może zostać wykonana w sposób prawidłowy i terminowy, w tym nieprzystąpienie do wykonywania Usług.
''';

  String get paragraph8Point2 => '''
W każdym przypadku, w którym Usługodawca poda w Sinch nieprawdziwe informacje, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 500,00 zł (słownie: pięćset złotych).
''';

  String get paragraph8Point3 => '''
W przypadku, w którym Usługodawca naruszy zasady świadczenia Usług określone w niniejszej Umowie, w tym powierzy świadczenie Usług lub wykonanie Umowy Szczegółowej jakiemukolwiek innemu podmiotowi, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.
''';

  String get paragraph8Point4 => '''
W przypadku, w którym Usługodawca naruszy obowiązek zachowania poufności określony w § 7 powyżej, Usługodawca zobowiązany jest bez wezwania do zapłaty na rzecz BWS kary umownej w kwocie 1.000,00 zł (słownie: jeden tysiąc złotych) za każdy przypadek naruszenia.
''';

  String get paragraph8Point5 => '''
Zapłata przez Usługodawcę określonych powyżej kar umownych nie pozbawia BWS prawa dochodzenia od Usługodawcy na zasadach ogólnych odszkodowania przekraczającego wysokość zastrzeżonych kar umownych, do wysokości poniesionej przez BWS szkody.
''';

  String get paragraph9Title => '''
Rozwiązywanie sporów
''';

  String get paragraph9Point1 => '''
W razie powstania sporu związanego z zawarciem, obowiązywaniem, wykładnią lub wykonywaniem Umowy, Strony w pierwszej kolejności podejmą negocjacje pojednawcze w celu rozwiązania tego sporu.
''';

  String get paragraph9Point2 => '''
Do czasu zakończenia negocjacji określonych w ust. 1 niniejszego paragrafu, żadna ze Stron nie skieruje sprawy na drogę postępowania sądowego, chyba, że będzie to niezbędne dla zachowania terminu do dochodzenia roszczeń, wynikających z obowiązujących przepisów prawa.
''';

  String get paragraph9Point3 => '''
W braku możliwości osiągnięcia porozumienia na drodze polubownej, wszystkie spory powstałe w związku z Umową Strony poddają rozstrzygnięciu sądu właściwego dla BWS.
''';

  String get paragraph9Point4 => '''
Każda ze stron zobowiązana jest do zachowania lojalności wobec drugiej strony, w szczególności poprzez poszanowanie jej interesów i powstrzymania się od wszelkich działań, które mogłyby narazić dobre imię drugiej Strony, chyba że jest to konieczne dla dochodzenia przysługujących im roszczeń wynikających z wykonywania niniejszej Umowy na drodze postępowania sądowego.
''';

  String get paragraph10Title => '''
Klauzula salwatoryjna
''';

  String get paragraph10Point1 => '''
Strony zgodnie postanawiają, iż w przypadku, gdyby którekolwiek z postanowień niniejszej Umowy, z mocy prawa lub ostatecznego albo prawomocnego orzeczenia jakiegokolwiek organu administracyjnego lub sądu, zostało uznane za nieważne lub nieskuteczne, pozostałe postanowienia niniejszej Umowy zachowują pełną moc i skuteczność.
''';

  String get paragraph10Point2 => '''
W przypadku wystąpienia okoliczności opisanych w ust. 1 niniejszego paragrafu, Strony zobowiązują się, że w dobrej wierze podejmą wszelkie czynności niezbędne do niezwłocznego i skutecznego zastąpienia postanowień uznanych za nieważne lub nieskuteczne postanowieniami ważnymi w świetle prawa i w pełni skutecznymi, które wywołują skutki prawne zapewniające realizację celów Stron niniejszej Umowy.
''';

  String get paragraph11Title => '''
Dane kontaktowe
''';

  String get paragraph11Point1 => '''
Usługodawca wskazuje następujące dane kontaktowe:
1) Adres do doręczeń ${form.placeOfDomicile.fullAddress}:
2) Numer telefonu: ${form.phoneNumber}
3) Adres e-mail: ${form.emailAddress}.
''';

  String get paragraph11Point2 => '''
BWS wskazuje następujące dane kontaktowe:
1) Adres do doręczeń Adres do doręczeń: ul. Na Szaniec 7, Kraków
2) Numer telefonu: 794-222-311
3) Adres e-mail: office@bws.net.pl
4) Komunikator internetowy: whatsapp 794-222-311
''';

  String get paragraph11Point3 => '''
Każda ze Stron w przypadku zmiany adresu do doręczeń wskazanego w niniejszym paragrafie jest zobowiązana niezwłocznie, w terminie nie dłuższym niż 14 (słownie: czternaście) dni poinformować drugą Stronę o tej zmianie. Pismo doręczone na adres wskazany w Umowie, prawidłowo awizowane przez Urząd Pocztowy, a nie podjęte w terminie i zwrócone Stronie, traktowane będzie jako doręczone w dacie pierwszego wezwania
''';

  String get paragraph11Point4 => '''
Zmiany danych kontaktowych wskazanych w ust. 1 i 2 niniejszego paragrafu nie wymagają zmiany niniejszej Umowy.
''';

  String get paragraph12Title => '''
Postanowienia końcowe
''';

  String get paragraph12Point1 => '''
W zakresie nieuregulowanym w niniejszej Umowie znajdują zastosowanie właściwe przepisy obowiązującego prawa polskiego, w tym w szczególności przepisy ustawy z dnia 23 kwietnia 1964 roku - Kodeks cywilny.
''';

  String get paragraph12Point2 => '''
Wszelkie zmiany niniejszej Umowy wymagają zachowania formy pisemnej lub dokumentowej pod rygorem nieważności.
''';

  String get paragraph12Point3 => '''
Tytuły poszczególnych paragrafów Umowy mają znaczenie jedynie informacyjne. Tytuły poszczególnych paragrafów Umowy nie stanowią wiążących postanowień umownych, jak również nie stanowią wskazówek interpretacyjnych i nie mogą zostać wykorzystane do wykładni Umowy.
''';

  String get paragraph12Point4 => '''
Niniejszą Umowę sporządzono w dwóch jednobrzmiących egzemplarzach, po jednym dla każdej ze Stron.
''';

  String get serviceProvider => '''
Usługodawca
''';

  String get dataProcessingInformationTitle => '''
INFORMACJA 
o przetwarzaniu Twoich danych osobowych
''';

  String get dataProcessingInformationDescritpion => '''
Zgodnie z art. 13 ust. 1 i ust. 2 Rozporządzenia Parlamentu Europejskiego i Rady (UE) 2016/679 z dnia 27 kwietnia 2016 r. w sprawie ochrony osób fizycznych w związku z przetwarzaniem danych osobowych i w sprawie swobodnego przepływu takich danych oraz uchylenia dyrektywy 95/46/WE (ogólne rozporządzenie o ochronie danych - RODO) spółka BWS Event Support Sp. z o.o. niniejszym informuję Cię, że przetwarza Twoje dane osobowe. Szczegóły tego dotyczące znajdziesz poniżej.
''';

  String get dataProcessingInformationPoint1Header => '''
I. Administrator danych osobowych
''';

  String get dataProcessingInformationPoint1 => '''
Administratorem Twoich danych osobowych jest spółka BWS Event Support spółka z ograniczoną odpowiedzialnością z siedzibą w Krakowie przy ul. Na Szaniec 7, 31-559 Kraków, dla której Sąd Rejonowy dla Krakowa-Śródmieścia w Krakowie, XI Wydział Gospodarczy KRS prowadzi akta rejestrowe pod numerem KRS: 0000944605, posiadająca NIP: 6751759898, REGON: 52091012.
''';

  String get dataProcessingInformationPoint2Header => '''
II. Cele i podstawy przetwarzania
''';

  String get dataProcessingInformationPoint2 => '''
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
''';

  String get dataProcessingInformationPoint3Header => '''
III. Odbiorcy danych
''';

  String get dataProcessingInformationPoint3 => '''
Twoje dane osobowe Administrator udostępniać następującym kategoriom podmiotów:
    1) Osobom upoważnionym przez Administratora – pracownikom oraz
    współpracownikom;
    2) Podmiotom, którym Administrator powierzył przetwarzanie danych osobowych
    (podmioty przetwarzające) na podstawie zawartych umów;
    3) Klientom Administratora – Administrator może udostępnić Twoje imię i nazwisko,
    numer telefonu, a także ewentualnie adres e-mail, aby Klienci Administratora mogli
    zarejestrować Cię np. w celu otrzymania odpowiedniego identyfikatora, gdy
    wymagają tego względy bezpieczeństwa. Klienci Administratora są zobowiązani
    umową i innymi zobowiązaniami dotyczącymi poufności danych. Twoje udostępnione
    dane zostaną usunięte przez Klienta Administratora natychmiast po wykonaniu
    usługi; chyba że prawo lub umowa stanowi inaczej;
    4) Podmiotom, którym Administrator zobligowany będzie udostępnić dane na podstawie
    przepisów prawa;
    5) Odbiorcom danych tacy jak: kurierzy i banki.
''';

  String get dataProcessingInformationPoint4Header => '''
IV. Przekazywanie danych do państw trzecich lub organizacji międzynarodowych
''';

  String get dataProcessingInformationPoint4 => '''
Twoje dane nie zostaną przekazane poza teren Unii Europejskiej, jak również nie zostaną przekazane organizacjom międzynarodowym.
''';

  String get dataProcessingInformationPoint5Header => '''
V. Okres przechowywania danych
''';

  String get dataProcessingInformationPoint5 => '''
Twoje dane pozyskane w związku z zawarciem i wykonywaniem Umowy Ramowej Świadczenia Usług oraz Umów Szczegółowych będą przetwarzane do czasu ich zakończenia, po tym czasie przez okres oraz w zakresie wymaganym przez przepisy prawa, w szczególności dotyczących przechowywanie dowodów księgowym i dla zabezpieczenia ewentualnych roszczeń do końca okresu przedawnienia potencjalnych roszczeń z tytułu tych Umów.
''';

  String get dataProcessingInformationPoint6Header => '''
VI. Twoje prawa:
''';

  String get dataProcessingInformationPoint6 => '''
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
''';

  String get dataProcessingInformationPoint7Header => '''
VII. Prawo do wniesienia skargi do organu nadzorczego
''';

  String get dataProcessingInformationPoint7 => '''
Jeżeli uważasz, że Twoje dane są przetwarzane niezgodnie z prawem, możesz złożyć w tej sprawie skargę do Prezesa Urzędu Ochrony Danych Osobowych lub innego właściwego organu nadzorczego.
''';

  String get dataProcessingInformationPoint8Header => '''
VIII. Informacja o dobrowolności podania danych 
''';

  String get dataProcessingInformationPoint8 => '''
Podanie przez Ciebie danych jest warunkiem zawarcia i wykonywania Umowy Ramowej Świadczenia Usług oraz Umów Szczegółowych.
''';

  String get dataProcessingInformationPoint9Header => '''
IX. Brak profilowania
''';

  String get dataProcessingInformationPoint9 => '''
Twoje dane osobowe nie są przedmiotem profilowania jako jednej z form zautomatyzowanego przetwarzania danych osobowych
''';
}

class ParagraphData {
  String title;
  List<String> points;
  ParagraphData({required this.title, required this.points});

  List<pw.Widget> toParagraphWidget(String pointNumber) {
    return [
      PdfWidgetSet().styledParagraph(point: pointNumber, value: title),
      ...points.map((e) => PdfWidgetSet().enumRow(
            point: "${points.indexOf(e) + 1}.",
            value: e,
          ))
    ];
  }
}

class PolishAgreementDictionary2 {
  ParagraphData get finalConclusion =>
      ParagraphData(title: 'Postanowienie Końcowe', points: [
        '''
W zakresie nieuregulowanym w niniejszej Umowie znajdują zastosowanie właściwe przepisy obowiązującego prawa polskiego, w tym w szczególności przepisy ustawy z dnia 23 kwietnia 1964 roku - Kodeks cywilny.
''',
        '''
Wszelkie zmiany niniejszej Umowy wymagają zachowania formy pisemnej lub dokumentowej pod rygorem nieważności.
''',
        '''
Tytuły poszczególnych paragrafów Umowy mają znaczenie jedynie informacyjne. Tytuły poszczególnych paragrafów Umowy nie stanowią wiążących postanowień umownych, jak również nie stanowią wskazówek interpretacyjnych i nie mogą zostać wykorzystane do wykładni Umowy.
''',
        '''
Niniejszą Umowę sporządzono w dwóch jednobrzmiących egzemplarzach, po jednym dla każdej ze Stron.
'''
      ]);
}
