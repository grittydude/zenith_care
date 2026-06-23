// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zenith_care/core/constants/auth_error_fields.dart';
import 'package:zenith_care/core/widgets/loading_dialog.dart';
import 'package:zenith_care/core/widgets/success_dialog.dart';
import 'package:zenith_care/features/auth/presentation/notifiers/auth_notifier.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/labeled_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;

  String? _fullNameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  bool _isDialogShowing = false;

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  // --- Handler
  void _clearErrors() {
    setState(() {
      _fullNameError = null;
      _emailError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });
  }

  Future<void> _handleSignUp() async {
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please agree to the Terms of Servcie to continue'),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    _clearErrors();

    //Call notifier
    ref.read(authProvider.notifier).signUp(_fullNameCtrl.text, _emailCtrl.text,
        _passwordCtrl.text, _confirmPasswordCtrl.text);
  }

  void _showLoadingDialog() {
    if (_isDialogShowing) return;
    _isDialogShowing = true;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ZcLoadingDialog(
        message: 'Setting up your account',
      ),
    ).then((_) => _isDialogShowing = false);
  }

  void _showSuccessDialog(VoidCallback onButtonTap) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => ZcSuccessDialog(
        title: 'Awesome',
        description: const Text('You have successfully signed up.'),
        buttonLabel: 'Next',
        onButtonTap: () => Navigator.of(dialogContext).pop(),
      ),
    ).then((_) {
      if (mounted) onButtonTap();
    });
  }

  void _dismissDialog() {
    if (_isDialogShowing && mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  //field error routing
  void _handleFieldError(AuthUnauthenticated state) {
    switch (state.errorField) {
      case AuthErrorFields.fullName:
        setState(() => _fullNameError = state.errorMessage);
      case AuthErrorFields.email:
        setState(() => _emailError = state.errorMessage);
      case AuthErrorFields.password:
        setState(() => _passwordError = state.errorMessage);
      case AuthErrorFields.confirmPassword:
        setState(() => _confirmPasswordError = state.errorMessage);
      default:
        if (state.errorMessage != null && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage!),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ));
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      switch (next) {
        case AuthLoading():
          _showLoadingDialog();
          break;

        case AuthSignupSuccess():
          _dismissDialog();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              _showSuccessDialog(() {
                debugPrint('success button clicked');
                debugPrint('Going to: ${AppRoutes.login}');

                if (!mounted) return;
                context.go(AppRoutes.login);
              });
            }
          });
          break;

        case AuthAuthenticated():
          _dismissDialog();
          break;

        case AuthUnauthenticated():
          _dismissDialog();
          _handleFieldError(next);
          break;

        case AuthInitial():
          break;
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
                errorText: _fullNameError,
                onChanged: (value) {
                  if (_fullNameError != null) {
                    setState(() => _fullNameError = null);
                  }
                },
              ),

              const SizedBox(height: AppSizes.spaceXL),

              ZcLabeledField(
                label: 'Email',
                hint: 'Enter your email address',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                errorText: _emailError,
                onChanged: (value) {
                  if (_emailError != null) {
                    setState(() => _emailError = null);
                  }
                },
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
                errorText: _passwordError,
                onChanged: (value) {
                  if (_passwordError != null) {
                    setState(() => _passwordError = null);
                  }
                },
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
                errorText: _confirmPasswordError,
                onChanged: (value) {
                  if (_confirmPasswordError != null) {
                    setState(() => _confirmPasswordError = null);
                  }
                },
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
