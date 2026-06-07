import 'package:flutter/material.dart';
import 'package:zenith_care/features/specialists/domain/entities/specialist.dart';
import '../../../../core/widgets/placeholder_screen.dart';

class BookingSlotScreen extends StatelessWidget {
  const BookingSlotScreen({
    super.key,
    required this.specialist,
  });

  final Specialist? specialist;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: specialist?.fullName ?? 'Specialist ${specialist?.shortName}',
    );
  }
}
