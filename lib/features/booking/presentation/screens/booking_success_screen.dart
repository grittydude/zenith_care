import 'package:flutter/material.dart';
import 'package:zenith_care/features/appointments/domain/entities/appointment.dart';
import '../../../../core/widgets/placeholder_screen.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({
    super.key,
    required this.appointment,
  });

  final Appointment? appointment;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: appointment?.id ?? 'Appointment is here',
    );
  }
}
