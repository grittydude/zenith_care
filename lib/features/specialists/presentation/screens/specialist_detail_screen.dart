import 'package:flutter/material.dart';
import 'package:zenith_care/features/specialists/domain/entities/specialist.dart';

import '../../../../core/widgets/placeholder_screen.dart';

class SpecialistDetailScreen extends StatelessWidget {
  const SpecialistDetailScreen({
    super.key,
    required this.specialistId,
    this.specialist,
  });

  final String specialistId;
  final Specialist? specialist;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: specialist?.fullName ?? 'Specialist $specialistId',
    );
  }
}
