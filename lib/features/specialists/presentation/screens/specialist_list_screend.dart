// lib/features/specialists/presentation/screens/specialist_list_screen.dart
//
// UI-only. Placeholder data throughout.
// Two sections: "Recommended for you" (1 card) and "All Specialists" (list).

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/data/placeholder_data.dart';
import '../../../../core/widgets/zc_specialist_card.dart';

class SpecialistListScreen extends StatefulWidget {
  const SpecialistListScreen({super.key});

  @override
  State<SpecialistListScreen> createState() => _SpecialistListScreenState();
}

class _SpecialistListScreenState extends State<SpecialistListScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            // ── Title ────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSizes.screenHorizontalPadding,
                  AppSizes.spaceLG,
                  AppSizes.screenHorizontalPadding,
                  AppSizes.spaceXL,
                ),
                child: Text(
                  'Find Specialists',
                  style: AppTextStyles.headlineLarge.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            // ── Search bar + filter button ────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: Row(
                  children: [

                    // Search field takes all space except the filter button
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: TextField(
                          controller: _searchCtrl,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            // Magnifying glass prefix icon
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: AppColors.textSecondary,
                            ),
                            hintText: 'Search by specialty, doctor or symptom',
                            hintStyle: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textHint,
                            ),
                            // Override the theme border for this specific field
                            // to remove the right border where it meets the filter button
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                              borderSide: const BorderSide(
                                color: AppColors.border,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                              borderSide: const BorderSide(
                                color: AppColors.border,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.5,
                              ),
                            ),
                            filled: true,
                            fillColor: AppColors.surface,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: AppSizes.spaceSM),

                    // Filter button — square with red outline and red icon
                    // Separate from the search field to allow independent taps.
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
                      ),
                      child: IconButton(
                        onPressed: () {
                          // UI-only: no filter action yet.
                          // Real: show filter bottom sheet
                        },
                        icon: const Icon(
                          Icons.filter_alt_outlined,
                          color: AppColors.primary,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space2XL),
            ),

            // ── Recommended for you ───────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: Text(
                  'Recommended for you',
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            // Single recommended specialist card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: ZcSpecialistCard(
                  specialist: kPlaceholderSpecialists.first,
                  onBookTap: () {
                    // UI-only
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space2XL),
            ),

            // ── All Specialists header ─────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding,
                ),
                child: Text(
                  'All Specialists',
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),

            // ── All Specialists list ───────────────────────────────────
            // SliverList is used instead of ListView because we are already
            // inside a CustomScrollView. Mixing a ListView inside a
            // CustomScrollView causes "Vertical viewport was given unbounded
            // height" errors. SliverList is the correct sliver-world equivalent.
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.screenHorizontalPadding,
                  ),
                  child: ZcSpecialistCard(
                    specialist: kPlaceholderSpecialists[index],
                    onBookTap: () {
                      // UI-only
                    },
                  ),
                ),
                childCount: kPlaceholderSpecialists.length,
              ),
            ),

            // Bottom padding
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.space4XL),
            ),
          ],
        ),
      ),
    );
  }
}
