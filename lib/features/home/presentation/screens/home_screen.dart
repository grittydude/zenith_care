// lib/features/home/presentation/screens/home_screen.dart
//
// UI-only. All data is placeholder.
// Uses CustomScrollView with SliverToBoxAdapter for each section.
// This approach is better than a Column in SingleChildScrollView
// because it handles large lists efficiently through sliver rendering.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/data/placeholder_data.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/zc_specialist_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      // No AppBar — the greeting is part of the scrollable content.
      // CustomScrollView lets us mix different sliver types:
      //  - SliverToBoxAdapter wraps normal widgets as slivers
      //  - SliverList for efficient list rendering
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ── Greeting ─────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenHorizontalPadding,
                  AppSizes.spaceLG,
                  AppSizes.screenHorizontalPadding,
                  AppSizes.spaceMD,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Hello Ikeys 👋" — the wave emoji is a Unicode
                    // character embedded directly in the string.
                    // In production, "Ikeys" is replaced with the
                    // authenticated user's first name from AuthNotifier.
                    Text(
                      'Hello Ikeys 👋',
                      style: AppTextStyles.headlineLarge.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Welcome to Zenith Care',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Consultation banner ──────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: _ConsultationBanner(
                  onBookTap: () => context.go(AppRoutes.specialists),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space2XL),
            ),

            // ── Popular Specialties ──────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionHeader(
                      title: 'Popular Specialties',
                      onViewAll: () => context.go(AppRoutes.specialists),
                    ),
                    const SizedBox(height: AppSizes.spaceMD),
                    // Wrap lays chips out in rows, wrapping to the next
                    // line when the current row is full. This is why
                    // "Gynaecology" appears on a second row in the design —
                    // it did not fit on the first row with the other three.
                    Wrap(
                      spacing: AppSizes.spaceSM, // horizontal gap between chips
                      runSpacing: AppSizes.spaceSM, // vertical gap between rows
                      children: kPopularSpecialties
                          .map((s) => _SpecialtyChip(label: s))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space2XL),
            ),

            // ── Specialists section header ────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: _SectionHeader(
                  title: 'Specialists',
                  onViewAll: () => context.go(AppRoutes.specialists),
                ),
              ),
            ),

            // ── Specialist cards ─────────────────────────────────────
            // Show only the first 2 specialists on the home screen.
            // "View All" takes the user to the full specialists screen.
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.screenHorizontalPadding,
                  ),
                  child: ZcSpecialistCard(
                    specialist: kPlaceholderSpecialists[index],
                    onBookTap: () {
                      // UI-only: navigate to placeholder
                      // Real: context.push('/specialists/${specialist.id}')
                    },
                  ),
                ),
                childCount: 2, // Show only 2 on home screen
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space2XL),
            ),

            // ── Upcoming Appointment ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: _SectionHeader(
                  title: 'Upcoming Appointment',
                  onViewAll: () => context.go(AppRoutes.appointments),
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space2XL),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: _AppointmentCard(
                  specialist: kPlaceholderSpecialists.first,
                  date: '24 May, 2024',
                  time: '11:00AM',
                ),
              ),
            ),

            // Bottom padding so last card is not hidden behind nav bar
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space4XL),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Private widgets ────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.onViewAll,
  });

  final String title;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'View All',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConsultationBanner extends StatelessWidget {
  const _ConsultationBanner({required this.onBookTap});

  final VoidCallback onBookTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppSizes.radiusLG),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // ── Doctor image — right side, overflows bottom ─────────────
          // Positioned outside the normal flow so it can sit at the
          // right edge and partially overflow the card bounds.
          // clipBehavior: Clip.hardEdge on the container clips it.
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: SizedBox(
              width: 160,
              child: Image.asset(
                'assets/images/doctor_banner.png',
                fit: BoxFit.cover,
                // Graceful fallback if asset is not yet available
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),

          // ── Text and button — left side ─────────────────────────────
          Positioned(
            left: AppSizes.spaceLG,
            top: AppSizes.spaceLG,
            bottom: AppSizes.spaceLG,
            right: 140, // leave space for the doctor photo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book a Consultation',
                      style: AppTextStyles.titleLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Connect with top specialists\nin minutes',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.90),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),

                // White pill button with red text
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onBookTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      elevation: 0,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceLG,
                      ),
                    ),
                    child: Text(
                      'Book now',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecialtyChip extends StatelessWidget {
  const _SpecialtyChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // UI-only: no action yet.
        // Real: filter specialists by this specialty
      },
      borderRadius: BorderRadius.circular(AppSizes.radiusFull),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spaceLG,
          vertical: AppSizes.spaceSM,
        ),
        decoration: BoxDecoration(
          // Light pink/red background matching the design
          color: AppColors.primarySurface,
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard({
    required this.specialist,
    required this.date,
    required this.time,
  });

  final SpecialistPlaceholder specialist;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.spaceMD),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Doctor photo
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            child: Container(
              width: 72,
              height: 72,
              color: AppColors.primarySurface,
              child: const Icon(
                Icons.person_rounded,
                size: 36,
                color: AppColors.primary,
              ),
            ),
          ),

          const SizedBox(width: AppSizes.spaceMD),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  specialist.name,
                  style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  specialist.specialty,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSizes.spaceSM),
                // Date and time row
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$date  •  $time',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Upcoming badge — top-right of the card
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.spaceSM,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                // Very light pink background matching the design badge
                color: AppColors.primarySurface,
                borderRadius: BorderRadius.circular(AppSizes.radiusFull),
              ),
              child: Text(
                'Upcoming',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
