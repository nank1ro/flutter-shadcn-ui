import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

enum ShadInputOTPVariant {
  primary,
  pattern,
}

class InputOTPPage extends StatelessWidget {
  const InputOTPPage({
    super.key,
    required this.style,
  });

  final ShadInputOTPVariant style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: switch (style) {
            ShadInputOTPVariant.primary => ShadInputOTP(
                onChanged: (v) => print('OTP: $v'),
                maxLength: 6,
                children: const [
                  ShadInputOTPGroup(
                    children: [
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                    ],
                  ),
                  ShadImage.square(size: 24, LucideIcons.dot),
                  ShadInputOTPGroup(
                    children: [
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                      ShadInputOTPSlot(),
                    ],
                  ),
                ],
              ),
            ShadInputOTPVariant.pattern => const ShadAlert.destructive(
                iconSrc: LucideIcons.circleAlert,
                title: Text('Error'),
                description:
                    Text('Your session has expired. Please log in again.'),
              ),
          },
        ),
      ),
    );
  }
}
