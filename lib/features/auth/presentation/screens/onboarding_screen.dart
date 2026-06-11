import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenith_care/core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../data/datasources/slide_data.dart';
import '../notifiers/onboarding_notifier.dart';
import '../widgets/dot_indactor.dart';
import '../widgets/next_button.dart';
import '../widgets/slide_page.dart';

const List<SlideData> _slides = [
  SlideData(
    title: 'Expert Speciliast',
    description:
        'Connect with verified doctors accorss multiple specilities in real time',
    imagePath: 'assets/images/onboard_one.webp',
  ),
  SlideData(
    title: 'Expert Speciliast',
    description:
        'Connect with verified doctors accorss multiple specilities in real time',
    imagePath: 'assets/images/onboard_two.webp',
  ),
  SlideData(
    title: 'Expert Speciliast',
    description:
        'Connect with verified doctors accorss multiple specilities in real time',
    imagePath: 'assets/images/onboard_three.webp',
  ),
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  bool isSwipeInProgress = false;

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
    final isLastPage = currentPage == _slides.length - 1;
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            //SKip Buttopn
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: AppSizes.screenHorizontalPadding,
                    top: AppSizes.spaceMD),
                child: AnimatedOpacity(
                  opacity: isLastPage ? 0 : 1,
                  duration: const Duration(milliseconds: 200),
                  child: TextButton(
                    onPressed: () =>
                        ref.read(onboardingProvider.notifier).skip(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.textSecondary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceMD,
                        vertical: AppSizes.spaceXS,
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                physics: null,
                onPageChanged: (index) {
                  isSwipeInProgress = true;
                  ref.read(onboardingProvider.notifier).jumpToPage(index);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    isSwipeInProgress = false;
                  });
                },
                itemBuilder: (context, index) {
                  return SlidePage(slide: _slides[index]);
                },
              ),
            ),

            const SizedBox(height: AppSizes.spaceLG),

            // ── Bottom row: Skip | Dots | Next ───────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.screenHorizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ── Dots (centre) ──────────────────────────────────
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _slides.length,
                      (index) => DotIndicator(isActive: index == currentPage),
                    ),
                  ),

                  SizedBox(
                    width: 120,
                    child: NextButton(
                      label: isLastPage ? 'Get Started' : 'Next',
                      onTap: () => ref
                          .read(onboardingProvider.notifier)
                          .nextPage(totalPages: _slides.length),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.space3XL),
          ],
        ),
      ),
    );
  }
}
