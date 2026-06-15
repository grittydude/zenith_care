import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zenith_care/features/auth/presentation/notifiers/auth_notifier.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/labeled_text_field.dart';
import '../../../../core/widgets/loading_dialog.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    // UI-only: show loading, simulate 2s network delay, navigate to home.
    // In the real implementation this calls authNotifier.signIn().
    _showLoadingDialog();
    // ignore: inference_failure_on_instance_creation
    await ref.read(authProvider.notifier).signInWithFakeUser();
  }

  void _showLoadingDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const ZcLoadingDialog(
        message: 'Signing you into your account',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next is AuthAuthenticated) {
        // Dismiss the loading dialog.
        // At this moment the LoginScreen is still mounted and
        // the dialog is still on the navigator stack above it.
        // This is the safe moment to pop it.
        if (mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        // Do NOT navigate here — the GoRouter redirect handles it.
      }
    });
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontalPadding,
            vertical: AppSizes.screenVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.space3XL),
              // ── Logo ────────────────────────────────────────────────

              Image.asset(
                'assets/images/logo-red.png',
                height: 70,
              ),

              const SizedBox(height: AppSizes.space2XL),

              // ── Heading ──────────────────────────────────────────────
              Text(
                'Welcome Back',
                style: AppTextStyles.headlineLarge.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSizes.spaceXS),

              Text(
                'Sign in to continue',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: AppSizes.space3XL),

              // ── Email field ──────────────────────────────────────────
              ZcLabeledField(
                label: 'Email',
                hint: 'Enter your email address',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
              ),

              const SizedBox(height: AppSizes.spaceXL),

              // ── Password field ───────────────────────────────────────
              ZcLabeledField(
                label: 'Password',
                hint: 'Enter your preferred password',
                controller: _passwordCtrl,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                suffixIcon: _VisibilityToggle(
                  isObscured: _obscurePassword,
                  onToggle: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),

              // ── Forgot Password link ─────────────────────────────────
              // Right-aligned, sits between password field and Sign In button.
              // Align widget pushes it to the right without affecting the column.
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push(AppRoutes.forgotPassword),
                  // Remove default TextButton padding so it sits flush
                  // with the right edge of the screen content.
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.spaceSM,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceLG),

              // ── Sign In button ───────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: AppSizes.buttonHeightLarge,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Sign In',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceLG),

              // ── Sign Up link ─────────────────────────────────────────
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    children: [
                      const TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign Up',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.go(AppRoutes.register),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceLG),
            ],
          ),
        ),
      ),
    );
  }
}

// ── _VisibilityToggle ─────────────────────────────────────────────────────
// The eye-slash icon for the password field.
// Private to this file — if you already have this in core/widgets
// as a shared widget, import it from there instead.

class _VisibilityToggle extends StatelessWidget {
  const _VisibilityToggle({
    required this.isObscured,
    required this.onToggle,
  });

  final bool isObscured;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: AppColors.textSecondary,
        size: AppSizes.iconMD,
      ),
      onPressed: onToggle,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 20,
    );
  }
}
