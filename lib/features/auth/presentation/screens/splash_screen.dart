import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenith_care/core/constants/app_colors.dart';
import 'package:zenith_care/core/constants/app_sizes.dart';
import 'package:zenith_care/core/router/navigation_stream.dart';
import 'package:zenith_care/core/router/proceed_to_onboarding.dart';
import 'package:zenith_care/core/widgets/app_logo.dart';
import 'package:zenith_care/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:zenith_care/features/auth/presentation/screens/onboarding_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ZenithCareLogo(),
            const SizedBox(height: AppSizes.space5XL),
            if (authState is AuthInitial)
              const SizedBox(
                width: AppSizes.space4XL,
                height: AppSizes.space4XL,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.textOnPrimary),
                  strokeWidth: 3,
                ),
              )
            else if (authState is AuthUnauthenticated)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSizes.spaceXL),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: AppSizes.buttonHeightLarge,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textOnPrimary,
                          foregroundColor: AppColors.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.radiusSM),
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(proceedToOnboardingProvider.notifier)
                              .proceed();
                          ref.read(navigationStreamProvider).notify();
                        },
                        child: Text(
                          'Get Started',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceLG),
                    Text(
                      'Trusted care, just a tap away',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.textOnPrimary.withAlpha(156),
                          ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
