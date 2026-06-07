import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenith_care/features/specialists/domain/entities/specialist.dart';

part 'booking_draft.freezed.dart';
part 'booking_draft.g.dart';
@freezed 
abstract class BookingDraft with _$BookingDraft {
  const BookingDraft._();
  const factory BookingDraft({
    required Specialist specialist,
    required DateTime scheduledAt,
    @Default(30) int durationMinutes,
    String? notes,
    String? paymentRefrence,
  }) = _BookingDraft;

  factory BookingDraft.fromJson(Map<String, dynamic> json) =>
      _$BookingDraftFromJson(json);
  
  int get totalFeeKobo => specialist.consultationFeeKobo;

  String get formattedFee => specialist.formattedFee;

  DateTime get endsAt => scheduledAt.add(Duration(minutes: durationMinutes));
}
