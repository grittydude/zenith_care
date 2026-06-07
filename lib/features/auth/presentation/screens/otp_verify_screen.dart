import 'package:flutter/material.dart';

import '../../../../core/widgets/placeholder_screen.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key, required this.phoneNumber});

  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(title: 'OTP Verify Screen',);
  }
}
