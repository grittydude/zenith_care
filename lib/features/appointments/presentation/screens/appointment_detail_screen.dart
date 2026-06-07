import 'package:flutter/material.dart';
import 'package:zenith_care/features/appointments/domain/entities/appointment.dart';
import '../../../../core/widgets/placeholder_screen.dart';

class AppointmentDetailScreen extends StatelessWidget {
  const AppointmentDetailScreen({
    super.key,
    required this.appointmentId,
    this.appointment,
  });

  final String appointmentId;
  final Appointment? appointment;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: appointment?.specialistId ?? 'Appointment $appointmentId',
    );
  }
}
