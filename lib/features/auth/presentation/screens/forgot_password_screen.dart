// lib/features/auth/presentation/screens/forgot_password_screen.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/widgets/labeled_text_field.dart';
import '../../../../core/widgets/success_dialog.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailCtrl = TextEditingController();

  // Whether the email field has any text.
  // Drives the button enabled/disabled visual state.
  bool _hasEmail = false;

  @override
  void initState() {
    super.initState();
    // Listen to the controller so we can rebuild when text changes.
    // addListener fires every time the text changes — on every keystroke.
    // We use setState to trigger a rebuild so the button updates.
    _emailCtrl.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    // Only call setState if the hasEmail state actually changed.
    // This prevents unnecessary rebuilds when the user types but
    // the emptiness/non-emptiness of the field has not changed.
    final nowHasEmail = _emailCtrl.text.trim().isNotEmpty;
    if (nowHasEmail != _hasEmail) {
      setState(() => _hasEmail = nowHasEmail);
    }
  }

  @override
  void dispose() {
    // Remove the listener before disposing the controller.
    // If we dispose the controller first, removeListener would
    // try to modify a disposed object.
    _emailCtrl.removeListener(_onEmailChanged);
    _emailCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleSend() async {
    // UI-only: simulate sending the email, then show success dialog.
    // In the real implementation this calls authNotifier.sendPasswordReset().

    // Capture the email before the async gap.
    // After await, the user could have changed the field content.
    // Capturing it now ensures the dialog shows the email that was submitted.
    final submittedEmail = _emailCtrl.text.trim();

    // Small simulated delay — in production the API call goes here.
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      _showSuccessDialog(submittedEmail);
    }
  }

  void _showSuccessDialog(String email) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => ZcSuccessDialog(
        title: 'Awesome!',

        // The description has mixed typography:
        // regular grey text + bold dark email address.
        // We pass RichText as the description widget.
        description: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            children: [
              const TextSpan(
                text: 'A password reset link has been sent to ',
              ),
              // The email address is bold and dark to draw attention
              // to the specific address the link was sent to.
              TextSpan(
                text: email,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        buttonLabel: 'Go to Login',
        onButtonTap: () {
          Navigator.of(dialogContext).pop(); // dismiss dialog
          // go() to login replaces the stack.
          // The user should not be able to press back from login
          // to the forgot password screen after resetting.
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

              // ── Heading ──────────────────────────────────────────────
              Text(
                'Forgot Password?',
                style: AppTextStyles.headlineLarge.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSizes.spaceXS),

              Text(
                'Enter your registered email address',
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
                textInputAction: TextInputAction.done,
                autocorrect: false,
              ),

              const SizedBox(height: AppSizes.space3XL),

              // ── Send verification email button ────────────────────────
              // The button is visually disabled when the email field is empty.
              // Passing null to onPressed triggers Flutter's disabled style.
              // We set disabledBackgroundColor to a light pink tint that
              // matches the washed-out appearance in the design.
              SizedBox(
                width: double.infinity,
                height: AppSizes.buttonHeightLarge,
                child: ElevatedButton(
                  // null when no email → disabled state
                  // handler when email present → active state
                  onPressed: _hasEmail ? _handleSend : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    // Light pink shown when button is disabled (empty field).
                    // withOpacity(0.35) on the primary red produces the
                    // washed-out pink visible in the design.
                    disabledBackgroundColor:
                        AppColors.primary.withValues(alpha: 0.35),
                    disabledForegroundColor:
                        AppColors.primary.withValues(alpha: 0.60),
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Send verification email'),
                ),
              ),

              const SizedBox(height: AppSizes.spaceLG),

              // ── Resend link ──────────────────────────────────────────
              // "Didn't get link? Resend Link"
              // UI-only — Resend Link tap has no action yet.
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      const TextSpan(text: "Didn't get link? "),
                      TextSpan(
                        text: 'Resend Link',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // UI-only: no action yet.
                            // Real implementation will call
                            // authNotifier.resendPasswordReset()
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
