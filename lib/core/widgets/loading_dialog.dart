// lib/core/widgets/zc_loading_dialog.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';

class ZcLoadingDialog extends StatelessWidget {
  const ZcLoadingDialog({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(color: Colors.transparent),
            ),
          ),

          // White card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.space2XL,
              vertical: AppSizes.space3XL,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Red branded spinner
                const SizedBox(
                  width: 52,
                  height: 52,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                  ),
                ),

                const SizedBox(height: AppSizes.spaceXL),

                Text(
                  message,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSizes.spaceSM),

                Text(
                  'Please wait....',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
