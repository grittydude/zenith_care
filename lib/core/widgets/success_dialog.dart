// lib/core/widgets/zc_success_dialog.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';

/// Reusable success dialog used across auth screens.
///
/// [description] is a Widget, not a String, because some screens
/// (e.g. Forgot Password) need bold inline text within the description.
/// Pass a plain Text() for simple cases, or RichText() for styled content.
///
/// Usage (simple):
///   ZcSuccessDialog(
///     title: 'Awesome!',
///     description: Text('You have successfully signed up.'),
///     buttonLabel: 'Next',
///     onButtonTap: () { ... },
///   )
///
/// Usage (with rich text):
///   ZcSuccessDialog(
///     title: 'Awesome!',
///     description: RichText(text: TextSpan(...)),
///     buttonLabel: 'Go to Login',
///     onButtonTap: () { ... },
///   )
class ZcSuccessDialog extends StatelessWidget {
  const ZcSuccessDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onButtonTap,
  });

  final String title;
  final Widget description;  // Widget not String — supports RichText
  final String buttonLabel;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
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

            // Checkmark with decorative dots
            SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ..._buildDecorativeDots(),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceXL),

            Text(
              title,
              style: AppTextStyles.headlineMedium.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: AppSizes.spaceSM),

            // description is a Widget — supports both Text and RichText
            description,

            const SizedBox(height: AppSizes.space2XL),

            SizedBox(
              width: double.infinity,
              height: AppSizes.buttonHeightLarge,
              child: ElevatedButton(
                onPressed: onButtonTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  buttonLabel,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDecorativeDots() {
    const dots = [
      (0.0,   -44.0, 6.0),
      (28.0,  -36.0, 5.0),
      (44.0,  -10.0, 4.0),
      (36.0,   26.0, 5.0),
      (-28.0, -36.0, 5.0),
      (-44.0, -10.0, 4.0),
      (-36.0,  26.0, 5.0),
      (10.0,   44.0, 4.0),
      (-10.0,  44.0, 4.0),
    ];
    return dots.map((dot) {
      final (dx, dy, size) = dot;
      return Positioned(
        left: 50 + dx - size / 2,
        top:  50 + dy - size / 2,
        child: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
      );
    }).toList();
  }
}
