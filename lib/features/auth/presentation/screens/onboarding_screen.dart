import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenith_care/core/constants/app_colors.dart';
import 'package:zenith_care/core/constants/app_sizes.dart';
import 'package:zenith_care/features/auth/presentation/notifiers/onboarding_notifier.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  static const _slides = [
    _OnboardingSlide(
      title: 'Expert Specialists',
      description: 'Connect with verified doctors across multiple specialties',
      icon: Icons.medical_services_outlined,
    ),
    _OnboardingSlide(
      title: 'Consult from Anywhere',
      description: 'Book appointments and consult securely at any time',
      icon: Icons.videocam_outlined,
    ),
    _OnboardingSlide(
      title: 'Your Health, Our Priority',
      description:
          'Personalised care and continuous support for a healthier you',
      icon: Icons.favorite_outline,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(onboardingProvider);

    ref.listen<int>(onboardingProvider, (previous, next) {
      if (previous != null && next != previous) {
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    final isLastPage = currentPage == _slides.length - 1;

    return Scaffold(
      backgroundColor: AppColors.textOnPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.spaceXL),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.spaceXL),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IgnorePointer(
                    ignoring: isLastPage,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: isLastPage ? 0 : 1,
                      child: TextButton(
                        onPressed: isLastPage
                            ? null
                            : () =>
                                ref.read(onboardingProvider.notifier).skip(),
                        child: Text(
                          'Skip',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _slides.length,
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppSizes.spaceXL,
                                vertical: AppSizes.spaceXL,
                              ),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primarySurface,
                              ),
                              padding: const EdgeInsets.all(AppSizes.spaceXL),
                              child: Center(
                                child: Icon(
                                  slide.icon,
                                  size: AppSizes.iconXL,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                slide.title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: AppSizes.spaceLG),
                              Text(
                                slide.description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSizes.spaceXL),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _slides.length,
                  (index) {
                    final isActive = index == currentPage;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceXS),
                      width: isActive ? AppSizes.space2XL : AppSizes.spaceSM,
                      height: AppSizes.spaceSM,
                      decoration: BoxDecoration(
                        color: isActive
                            ? AppColors.primary
                            : AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(AppSizes.spaceXS),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSizes.spaceXL),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: isLastPage
                          ? null
                          : () => ref.read(onboardingProvider.notifier).skip(),
                      child: Text(
                        'Skip',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: AppSizes.buttonHeightLarge,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.textOnPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.radiusSM),
                          ),
                        ),
                        onPressed: () => ref
                            .read(onboardingProvider.notifier)
                            .nextPage(totalPages: _slides.length),
                        child: Text(
                          isLastPage ? 'Get Started' : 'Next',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.textOnPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceXL),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingSlide {
  const _OnboardingSlide({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
