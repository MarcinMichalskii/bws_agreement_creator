import 'dart:io';
import 'package:flutter/foundation.dart';

class Consts {
  static const double defaultMaxWidth = kIsWeb ? 1024 : 768;
  static final isDesktop =
      kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows;
}
