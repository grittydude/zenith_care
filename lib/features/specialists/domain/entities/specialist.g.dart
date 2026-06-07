// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Specialist _$SpecialistFromJson(Map<String, dynamic> json) => _Specialist(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      specialty: json['specialty'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      consultationFeeKobo: (json['consultationFeeKobo'] as num).toInt(),
      photoUrl: json['photoUrl'] as String?,
      bio: json['bio'] as String?,
      yearsExperience: (json['yearsExperience'] as num?)?.toInt() ?? 0,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );

Map<String, dynamic> _$SpecialistToJson(_Specialist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'specialty': instance.specialty,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'consultationFeeKobo': instance.consultationFeeKobo,
      'photoUrl': instance.photoUrl,
      'bio': instance.bio,
      'yearsExperience': instance.yearsExperience,
      'isAvailable': instance.isAvailable,
    };
