// lib/core/data/placeholder_data.dart
//
// UI-only placeholder data used across home and specialist screens.
// Replaced entirely when real Supabase integration is added.
// All data is const — compile-time constants, zero runtime cost.

/// A single specialist's display data.
class SpecialistPlaceholder {
  const SpecialistPlaceholder({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    required this.yearsExperience,
    required this.feeNaira,
    this.imagePath,
  });

  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final int yearsExperience;
  final int feeNaira;
  final String? imagePath; // null → show avatar placeholder
}

const List<SpecialistPlaceholder> kPlaceholderSpecialists = [
  SpecialistPlaceholder(
    name: 'Dr. Jane Doe',
    specialty: 'General Physician',
    rating: 4.5,
    reviewCount: 200,
    yearsExperience: 8,
    feeNaira: 10000,
  ),
  SpecialistPlaceholder(
    name: 'Dr. Jane Doe',
    specialty: 'General Physician',
    rating: 4.5,
    reviewCount: 200,
    yearsExperience: 8,
    feeNaira: 10000,
  ),
  SpecialistPlaceholder(
    name: 'Dr. Jane Doe',
    specialty: 'General Physician',
    rating: 4.5,
    reviewCount: 200,
    yearsExperience: 8,
    feeNaira: 10000,
  ),
  SpecialistPlaceholder(
    name: 'Dr. Jane Doe',
    specialty: 'General Physician',
    rating: 4.5,
    reviewCount: 200,
    yearsExperience: 8,
    feeNaira: 10000,
  ),
];

const List<String> kPopularSpecialties = [
  'General Physician',
  'Dermatology',
  'Pediatrics',
  'Gynaecology',
];
