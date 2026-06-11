import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zenith_care/core/constants/app_text_styles.dart';
import 'package:zenith_care/features/auth/presentation/notifiers/auth_notifier.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/router/app_routes.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isChecking = authState is AuthInitial;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // ----- Layer 1 ----
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      AppColors.primaryDarker,
                    ],
                  ),
                ),
              ),
            ),

            // ----- <Main content> ----
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.screenHorizontalPadding),
              child: Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Image.asset(
                    'assets/images/logo-white.png',
                    height: 140,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceLG,
                  ),
                  Text(
                    'Expert care, Anytime, Anywhere',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 6,
                  ),

                  //----<Auth state indictor>
                  AnimatedOpacity(
                    opacity: isChecking ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white.withValues(alpha: 0.70),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceLG,
                  ),

                  _GetStartedButton(
                    isEnabled: !isChecking,
                    onTap: () => context.go(AppRoutes.onboarding),
                  ),

                  const SizedBox(
                    height: AppSizes.spaceMD,
                  ),

                  Text(
                    'Trusted care, just a step away',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: AppSizes.space5XL,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton({
    required this.onTap,
    required this.isEnabled,
  });
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeightMedium,
      child: ElevatedButton(
        onPressed: isEnabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primary,
          disabledBackgroundColor: Colors.white.withValues(alpha: 0.4),
          disabledForegroundColor: AppColors.primary.withValues(alpha: 0.4),
          elevation: 0,
          shape: const StadiumBorder(),
        ),
        child: Text(
          'Get Started',
          style: AppTextStyles.labelLarge.copyWith(
            color: isEnabled
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}
