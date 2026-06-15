// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zenith_care/core/widgets/loading_dialog.dart';
import 'package:zenith_care/core/widgets/success_dialog.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/labeled_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.prefillMail});

  final String prefillMail;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    _showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(context).pop();
      _showSuccessDialog();
    }
  }

  void _showLoadingDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ZcLoadingDialog(
        message: 'Setting up your account',
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => ZcSuccessDialog(
        title: 'Awesome',
        description: const Text('You have successfully signed up.'),
        buttonLabel: 'Next',
        onButtonTap: () {
          Navigator.of(dialogContext).pop();
          context.go(AppRoutes.login);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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

              // ── Screen heading ─────────────────────────────────────
              Text(
                'Create Account',
                style: AppTextStyles.headlineLarge.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSizes.spaceXS),

              Text(
                'Fill in the accurate info to continue',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: AppSizes.space3XL),

              // ── Form fields ────────────────────────────────────────
              ZcLabeledField(
                label: 'Full Name',
                hint: 'Enter your first name',
                controller: _fullNameCtrl,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: AppSizes.spaceXL),

              ZcLabeledField(
                label: 'Email',
                hint: 'Enter your email address',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
              ),

              const SizedBox(height: AppSizes.spaceXL),

              ZcLabeledField(
                label: 'Password',
                hint: 'Enter your preferred password',
                controller: _passwordCtrl,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.next,
                suffixIcon: _VisibilityToggle(
                  isObscured: _obscurePassword,
                  onToggle: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),

              const SizedBox(height: AppSizes.spaceXL),

              ZcLabeledField(
                label: 'Confirm Password',
                hint: 'Enter your preferred password',
                controller: _confirmPasswordCtrl,
                obscureText: _obscureConfirmPassword,
                textInputAction: TextInputAction.done,
                suffixIcon: _VisibilityToggle(
                  isObscured: _obscureConfirmPassword,
                  onToggle: () => setState(
                    () => _obscureConfirmPassword = !_obscureConfirmPassword,
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceXL),

              // ── Terms checkbox ─────────────────────────────────────
              _TermsRow(
                value: _agreedToTerms,
                onChanged: (v) => setState(() => _agreedToTerms = v ?? false),
              ),

              const SizedBox(height: AppSizes.space3XL),

              // ── Sign Up button ─────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: AppSizes.buttonHeightLarge,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    'Sign up',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceLG),

              // ── Sign In link ───────────────────────────────────────
              Center(
                child: _SignInLink(
                  onTap: () => context.go(AppRoutes.login),
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
      // Remove the default IconButton splash padding so the icon
      // sits flush with the field edge.
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 20,
    );
  }
}

class _TermsRow extends StatelessWidget {
  const _TermsRow({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Checkbox ─────────────────────────────────────────────────
        SizedBox(
          width: 22,
          height: 22,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),

        const SizedBox(width: AppSizes.spaceSM),

        // ── Terms text with tappable links ────────────────────────────
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
              children: [
                const TextSpan(text: 'I have read and agreed to the '),
                TextSpan(
                  text: 'Terms of Use',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // ignore: todo
                      // TODO: Navigate to Terms of Use screen
                      // context.push(AppRoutes.termsOfUse);
                    },
                ),
                const TextSpan(text: ' and\n'),
                TextSpan(
                  text: 'Privacy policy',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // ignore: todo
                      // TODO: Navigate to Privacy Policy screen
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SignInLink extends StatelessWidget {
  const _SignInLink({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textPrimary,
        ),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Sign In',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
