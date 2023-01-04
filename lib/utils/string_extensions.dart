extension NipValidator on String {
  bool isValidNip() {
    try {
      final nip = replaceAll(RegExp(r'[\ \-]'), '');

      List<int> weight = [6, 5, 7, 2, 3, 4, 5, 6, 7];
      int sum = 0;
      int controlNumber = int.parse(nip.substring(9, 10));
      for (int i = 0; i < weight.length; i++) {
        sum += (int.parse(nip.substring(i, i + 1)) * weight[i]);
      }

      return sum % 11 == controlNumber;
    } catch (error) {
      return false;
    }
  }
}
