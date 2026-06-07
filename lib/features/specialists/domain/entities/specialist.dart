import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialist.freezed.dart';
part 'specialist.g.dart';

@freezed
abstract class Specialist with _$Specialist {
  const Specialist._();
  const factory Specialist({
    required String id,
    required String fullName,
    required String specialty,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    required int consultationFeeKobo,
    String? photoUrl,
    String? bio,
    @Default(0) int yearsExperience,
    @Default(true) bool isAvailable,

  }) = _Specialist;

  factory Specialist.fromJson(Map<String, dynamic> json) =>
      _$SpecialistFromJson(json);


  String get formattedFee {
    final naira = consultationFeeKobo / 100;
    if(naira == naira.truncateToDouble()) {
      return '₦${naira.truncate()}';
    }
    return '₦${naira.toStringAsFixed(2)}';
  }

  String get shortName {
    final parts = fullName.split(' ');
    return parts.length >= 2 ? '${parts[0]} ${parts[1][0]}' : fullName;
  }
}
