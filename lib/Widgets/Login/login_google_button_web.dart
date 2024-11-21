import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart' as web;

class LoginGoogleButtonWeb extends HookConsumerWidget {
  const LoginGoogleButtonWeb({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final googleAuthButton = useMemoized(
        () => (GoogleSignInPlatform.instance as web.GoogleSignInPlugin)
            .renderButton(),
        []);
    return Padding(padding: const EdgeInsets.all(16), child: googleAuthButton);
  }
}
