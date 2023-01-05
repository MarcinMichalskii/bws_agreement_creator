import 'package:flutter/foundation.dart';

extension ByteDataToUint8 on ByteData {
  Uint8List dataAsUint8() {
    print('offset: $offsetInBytes');
    print('offset: $lengthInBytes');
    return buffer.asUint8List(offsetInBytes, lengthInBytes);
  }
}
