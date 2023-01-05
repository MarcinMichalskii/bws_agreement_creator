import 'package:flutter/foundation.dart';

extension AsUint8List on List<int> {
  Uint8List asUint8List() {
    final self = this;
    return (self is Uint8List) ? self : Uint8List.fromList(this);
  }
}
