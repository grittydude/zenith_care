// lib/core/widgets/zc_specialist_card.dart
//
// Reusable specialist card used on both the home screen
// (Specialists section) and the Specialist List screen (All Specialists).
//
// Layout: [Photo] [Name / Specialty / Rating / Meta] [Book now button]

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';
import '../data/placeholder_data.dart';

class ZcSpecialistCard extends StatelessWidget {
  const ZcSpecialistCard({
    super.key,
    required this.specialist,
    required this.onBookTap,
  });

  final SpecialistPlaceholder specialist;
  final VoidCallback onBookTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Full width card with a subtle bottom border acting as a divider.
      // No shadow — the design uses a flat divider line between cards,
      // not individual card shadows. This matches the clean medical aesthetic.
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.spaceLG,
        horizontal: AppSizes.spaceSM,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 0.8),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ── Doctor photo ─────────────────────────────────────────────
          _DoctorAvatar(imagePath: specialist.imagePath),

          const SizedBox(width: AppSizes.spaceMD),

          // ── Info column ──────────────────────────────────────────────
          // Expanded takes all remaining space between the photo and button.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  specialist.name,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 2),

                // Specialty
                Text(
                  specialist.specialty,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: AppSizes.spaceXS),

                // Rating row: ★ 4.5 (200)
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFC107), // amber/gold star
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${specialist.rating}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      ' (', // space before paren
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      '${specialist.reviewCount}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      ')',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Meta row: 8+ years • N10,000
                Row(
                  children: [
                    Text(
                      '${specialist.yearsExperience}+ years',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    // Bullet separator
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceSM,
                      ),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    Text(
                      // Format fee with thousands separator
                      'N${_formatFee(specialist.feeNaira)}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: AppSizes.spaceSM),

          // ── Book now button ──────────────────────────────────────────
          // The button is right-aligned and vertically centred.
          // StadiumBorder gives the pill shape matching the design.
          // It is NOT full width — it wraps its content with horizontal padding.
          SizedBox(
            height: 30,
            width: 80,
            child: ElevatedButton(
              onPressed: onBookTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.spaceLG,
                ),
              ),
              child: Text(
                'Book now',
                style: AppTextStyles.labelSmall10.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Format fee: 10000 → "10,000"
  String _formatFee(int fee) {
    return fee.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
        );
  }
}

// ── _DoctorAvatar ─────────────────────────────────────────────────────────
// Rounded square photo. Shows a placeholder icon when no image is available.
// In production, replace with CachedNetworkImage when URLs are available.

class _DoctorAvatar extends StatelessWidget {
  const _DoctorAvatar({this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // The design shows rounded square corners — not a circle.
      // radiusMD (12px) matches the design's corner radius.
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      child: SizedBox(
        width: 80,
        height: MediaQuery.of(context).size.height * 0.12,
        child: imagePath != null
            ? Image.asset(imagePath!, fit: BoxFit.cover)
            : Container(
                color: AppColors.primarySurface,
                child: const Icon(
                  Icons.person_rounded,
                  size: 44,
                  color: AppColors.primary,
                ),
              ),
      ),
    );
  }
}
