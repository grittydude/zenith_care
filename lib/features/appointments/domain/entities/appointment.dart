
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenith_care/features/specialists/domain/entities/specialist.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

enum AppointmentStatus {
  pendingPayment('pending_payment'),
  confirmed('confirmed'),
  cancelled('cancelled'),
  completed('completed'),
  noShow('no_show');

  const AppointmentStatus (this.value);

  final String value;

  static AppointmentStatus fromJson(String status) =>
    AppointmentStatus.values.firstWhere(
      (s) => s.value == status,
      orElse: () => AppointmentStatus.pendingPayment,
    );

  String toJson() => value;

    // Business rule helper

    // Ture when the appointment will still happen
  bool get isUpcoming =>
      this == AppointmentStatus.confirmed || 
      this == AppointmentStatus.pendingPayment;

  bool get canCancel =>
      this == AppointmentStatus.confirmed || 
      this == AppointmentStatus.pendingPayment;
}


@freezed
abstract class Appointment with _$Appointment {
  const Appointment._();
  const factory Appointment({
    required String id,
    required String specialistId,
    required String patiendId,
    required DateTime sheduledAt,
    required AppointmentStatus status,
    @Default(30) int durationMinutes,
    String? notes,
    String? paymentRefrence,
    int? amountPaidKobo,
    String? cancellationReason,
    DateTime? cancelledAt,
    Specialist? specialist,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
  
  DateTime get endsAt => sheduledAt.add(Duration(minutes: durationMinutes));

  String get statusLabel => switch (status) {
    AppointmentStatus.pendingPayment => 'Pending Payment',
    AppointmentStatus.confirmed => 'Confirmed',
    AppointmentStatus.cancelled => 'Cancelled',
    AppointmentStatus.completed => 'Completed',
    AppointmentStatus.noShow => 'No Show',
  };
}

