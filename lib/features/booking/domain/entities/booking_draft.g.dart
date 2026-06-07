// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingDraft _$BookingDraftFromJson(Map<String, dynamic> json) =>
    _BookingDraft(
      specialist:
          Specialist.fromJson(json['specialist'] as Map<String, dynamic>),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 30,
      notes: json['notes'] as String?,
      paymentRefrence: json['paymentRefrence'] as String?,
    );

Map<String, dynamic> _$BookingDraftToJson(_BookingDraft instance) =>
    <String, dynamic>{
      'specialist': instance.specialist,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'notes': instance.notes,
      'paymentRefrence': instance.paymentRefrence,
    };
