import 'package:flutter/material.dart';
import 'package:zenith_care/features/booking/domain/entities/booking_draft.dart';
import '../../../../core/widgets/placeholder_screen.dart';

class BookingConfirmScreen extends StatelessWidget {
  const BookingConfirmScreen({
    super.key,
    required this.booking,
  });

  final BookingDraft? booking;

  @override
  Widget build(BuildContext context) {
    return PlaceholderScreen(
      title: booking?.formattedFee ?? 'Booking Draft',
    );
  }
}
