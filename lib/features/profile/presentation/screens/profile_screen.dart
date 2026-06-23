// lib/features/profile/presentation/screens/profile_screen.dart
//
// Minimal profile screen for testing sign out.
// Full profile implementation comes in a later phase.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../auth/presentation/notifiers/auth_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    final user = authState is AuthAuthenticated ? authState.user : null;
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.spaceLG),

              // ── Screen title ─────────────────────────────────────────
              Text(
                'Profile',
                style: AppTextStyles.headlineLarge.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSizes.space3XL),

              // ── User avatar and info ─────────────────────────────────
              Center(
                child: Column(
                  children: [
                    // Avatar circle with initials
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: AppColors.primarySurface,
                      child: Text(
                        _getInitials(user?.fullName),
                        style: AppTextStyles.headlineMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceMD),

                    // Full name
                    Text(
                      user?.fullName ?? 'User',
                      style: AppTextStyles.titleLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceXS),

                    // Email
                    Text(
                      user?.email ?? '',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.space4XL),

              // ── Profile options ──────────────────────────────────────
              // Placeholder options — will be built in the profile phase
              _ProfileOption(
                icon: Icons.person_outline_rounded,
                label: 'Edit Profile',
                onTap: () {
                  // TODO: Navigate to edit profile screen
                },
              ),

              _ProfileOption(
                icon: Icons.notifications_outlined,
                label: 'Notifications',
                onTap: () {
                  // TODO: Navigate to notifications screen
                },
              ),

              _ProfileOption(
                icon: Icons.lock_outline_rounded,
                label: 'Change Password',
                onTap: () {
                  // TODO: Navigate to change password screen
                },
              ),

              _ProfileOption(
                icon: Icons.help_outline_rounded,
                label: 'Help & Support',
                onTap: () {
                  // TODO: Navigate to help screen
                },
              ),

              const Spacer(),

              // ── Sign Out button ──────────────────────────────────────
              // This is the only button on this screen that has
              // production functionality right now.
              _SignOutButton(
                onTap: () => _handleSignOut(context, ref),
              ),

              const SizedBox(height: AppSizes.spaceLG),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await _showSignOutConfirmation(context);
    if (!confirmed) return;

    await ref.read(authProvider.notifier).signOut();
  }

  Future<bool> _showSignOutConfirmation(BuildContext context) async {
    // showDialog returns null if dismissed by tapping outside.
    // The ?? false handles that case — treat dismiss as "no".
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLG),
        ),
        title: Text(
          'Sign Out',
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          'Are you sure you want to sign out?',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          // Cancel — dismiss dialog, do nothing
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(
              'Cancel',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          // Sign Out — confirm and proceed
          ElevatedButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: const StadiumBorder(),
            ),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Extracts initials from a full name.
  /// "Ikeys Doe" → "ID"
  /// "Ikeys" → "I"
  /// null → "?"
  String _getInitials(String? fullName) {
    if (fullName == null || fullName.isEmpty) return '?';
    final parts =
        fullName.trim().split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

// ── Private widgets ─────────────────────────────────────────────────────────

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.spaceMD,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                borderRadius: BorderRadius.circular(AppSizes.radiusSM),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: AppSizes.iconMD,
              ),
            ),
            const SizedBox(width: AppSizes.spaceMD),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _SignOutButton extends StatelessWidget {
  const _SignOutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeightLarge,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: const Icon(
          Icons.logout_rounded,
          color: AppColors.primary,
        ),
        label: Text(
          'Sign Out',
          style: AppTextStyles.labelLarge.copyWith(
            color: AppColors.primary,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
