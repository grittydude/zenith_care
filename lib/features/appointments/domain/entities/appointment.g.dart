// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
      id: json['id'] as String,
      specialistId: json['specialistId'] as String,
      patiendId: json['patiendId'] as String,
      sheduledAt: DateTime.parse(json['sheduledAt'] as String),
      status: $enumDecode(_$AppointmentStatusEnumMap, json['status']),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 30,
      notes: json['notes'] as String?,
      paymentRefrence: json['paymentRefrence'] as String?,
      amountPaidKobo: (json['amountPaidKobo'] as num?)?.toInt(),
      cancellationReason: json['cancellationReason'] as String?,
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      specialist: json['specialist'] == null
          ? null
          : Specialist.fromJson(json['specialist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specialistId': instance.specialistId,
      'patiendId': instance.patiendId,
      'sheduledAt': instance.sheduledAt.toIso8601String(),
      'status': instance.status,
      'durationMinutes': instance.durationMinutes,
      'notes': instance.notes,
      'paymentRefrence': instance.paymentRefrence,
      'amountPaidKobo': instance.amountPaidKobo,
      'cancellationReason': instance.cancellationReason,
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'specialist': instance.specialist,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.pendingPayment: 'pendingPayment',
  AppointmentStatus.confirmed: 'confirmed',
  AppointmentStatus.cancelled: 'cancelled',
  AppointmentStatus.completed: 'completed',
  AppointmentStatus.noShow: 'noShow',
};
