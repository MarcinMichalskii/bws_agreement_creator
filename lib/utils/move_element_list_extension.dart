extension ListExtension<T> on List<T> {
  void move(int oldIndex, int newIndex) {
    if (oldIndex == newIndex) {
      return;
    }

    var item = removeAt(oldIndex);
    if (newIndex > oldIndex) {
      newIndex--;
    }

    if (newIndex >= length) {
      add(item);
      return;
    }

    insert(newIndex, item);
  }
}
