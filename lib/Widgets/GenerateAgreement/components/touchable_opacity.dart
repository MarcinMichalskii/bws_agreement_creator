import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TouchableOpacity extends HookWidget {
  TouchableOpacity(
      {super.key,
      required this.child,
      this.onTap,
      this.onLongPress,
      this.opacity = 0.5,
      this.disabled = false,
      this.animationDuration = const Duration(milliseconds: 50),
      this.delayDuration = const Duration(milliseconds: 80)});

  final Widget child;
  final double opacity;
  final Duration animationDuration;
  final Duration delayDuration;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool disabled;
  late final _debouncer = Debouncer(duration: delayDuration);

  @override
  Widget build(BuildContext context) {
    final isDown = useState(false);

    useEffect(() => _debouncer.cancel, []);

    if (disabled) {
      return Container(child: child);
    }

    return MouseRegion(
      onEnter: (_) => isDown.value = true,
      onExit: (_) => isDown.value = false,
      child: GestureDetector(
        onTapDown: (_) => isDown.value = true,
        onTapUp: (_) => _debouncer.run(() {
          isDown.value = false;
        }),
        onTapCancel: () => isDown.value = false,
        onTap: onTap,
        onLongPress: onLongPress,
        child: AnimatedOpacity(
          duration: animationDuration,
          opacity: isDown.value ? opacity : 1,
          child: child,
        ),
      ),
    );
  }
}

class Debouncer {
  Debouncer({required this.duration});

  final Duration duration;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(duration, () {
      action();
      _timer?.cancel();
    });
  }

  void cancel() {
    _timer?.cancel();
  }
}
