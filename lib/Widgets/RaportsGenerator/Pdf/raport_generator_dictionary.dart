class RaportGeneratorDictionary {
  String get order => 'Auftrag / Order';
  String get orderDescription =>
      'Hiermit schließen wir in gegenseitigem Einvernehmen den vorliegenden Auftrag\n(We hereby conclude the present order by mutual agreement)';
  String get client => 'Auftraggeber (Client):';
  String get address => 'Adresse (Address):';
  String get contractor => 'Auftragnehmer (Contractor):';
  String get contractorData => 'BWS Event Support Sp. z o. o.';
  String get contractorAddress =>
      'Stoczniowców 3, 30-709 Kraków, Kapitał zakładowy 54,000 PLN';
  String get projectManager => 'Projektleiter (Project Manager):';
  String get bwsManager => 'BWS-Bauleiter:\n(BWS-Construction Manager):';
  String get tradeFair => 'Messe (Trade Fair):';
  String get startOfConstruction => 'Aufbau am (Start of Construction on):';
  String get endOfConstruction => 'Abbau am (Start of Deassembly on):';
  String get riggingServices =>
      'Auftragsinhalt: Rigging-Werkleistungen / Order for: Rigging Services:';
  String get ropeSupsensionsInstalltion => '''
Installation und Montage von Seilabhängungen
(Installation an Assemby of rope suspensions)
  ''';
  String get ropeSupsensionsDeinstallation => '''
Deinstallation und Abbau von Seilabhängungen
(de-installation and dismantling of rope suspensions)
''';

  String get otherServices => '''
Sonstige Werkleistungen während des Auf- und Abbaus der Messeveranstaltung (siehe Beschreibung)
(Other work services during the construction and dismantling of the trade fair event (see description))
''';

  String get otherServicesDescription => '''
Beschreibung des Auftragsinhalts
(Description of the order)
''';

  String get hall => 'Halle (Hall):';
  String get stand => 'Messe-Stand (Exhibition stand):';
  String get exhibitor => 'Aussteller (Exhibitor):';
  String get completionTime => 'Fertigstellungstermin (Completion date):';
  String get startOfDisassembly => 'Beginn des Abbaus (Start of disassembly):';
  String get price => '''
Vergütung/Preis
(Remuneration/price)
''';

  String get date => 'Datum/Date:';

  String get signature => 'Unterschrift (Signature):';

  String get acceptance => 'Abnahme (Acceptance):';

  String get acceptanceDescription => '''
Ich bestätige hiermit alle o.g. Leistungen am heutigen Tage in optisch und technisch einwandfreiem und funktionstüchtigem Zustand erhalten zu haben.

(I hereby confirm that I have received all the above-mentioned services today in a visually and technically perfect and functional condition).
''';

  String get deffectsDescription => '''
Bei der Abnahme wurden die folgenden Mängel festgestellt:

(The following defects were identified during acceptance):
''';

  String get deffectsSolution => '''
Die Mängel sind zu beseitigen bis
(The defects must be rectified by)
''';

  String get deffectsResolved => '''
Die Mängel wurden erfolgreich und fristgemäß beseitigt:

The defects were successfully rectified on time.
''';
}
