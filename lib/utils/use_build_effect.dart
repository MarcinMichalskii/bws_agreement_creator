import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useBuildEffect(Dispose? Function() effect, [List<Object?>? keys]) {
  useEffect(() {
    Dispose? disposeCallback;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      disposeCallback = effect();
    });

    return () {
      if (disposeCallback != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          disposeCallback!();
        });
      }
    };
  }, keys);
}
