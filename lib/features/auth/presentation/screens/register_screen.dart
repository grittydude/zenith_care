import 'package:flutter/material.dart';
import 'package:zenith_care/core/widgets/placeholder_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.prefillMail});

  final String prefillMail;

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(title: 'Register Screen');
  }
}
