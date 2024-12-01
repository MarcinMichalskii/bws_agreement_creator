enum StudentStatusErrorReason {
  photoWithouNumber,
  noPhoto,
  invalidStudentId,
}
// get string with swtich from self

extension StudentStatusErrorReasonExtension on StudentStatusErrorReason {
  String get errorText {
    switch (this) {
      case StudentStatusErrorReason.photoWithouNumber:
        return 'W Twoim profilu dodałeś zdjęcie legitymacji studenckiej, ale nie podałeś jej numeru, uzupełnij go poniżej.\nNumer może zawierać tylko cyfry spacje i znak "/"';
      case StudentStatusErrorReason.noPhoto:
        return 'W swoim profilu Sinch nie podałeś wystarczających danych legitymacji studenckiej. Osoby poniżej 26 roku życia najczęściej podpisują umowę ze statusem studenta. \nCzy na pewno nie jesteś studentem? Jeśli tak, uzupełnij numer legitymacji i jej zdjęciaponiżej.\n Numer może zawierać tylko cyfry spacje i znak "/"';
      case StudentStatusErrorReason.invalidStudentId:
        return 'Numer legitymacji studenckiej zawiera niedozwolone znaki. Popraw go poniżej. Numer może zawierać tylko cyfry spacje i znak "/"';
    }
  }
}
