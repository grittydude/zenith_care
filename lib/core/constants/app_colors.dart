import 'package:flutter/material.dart';

abstract final class AppColors {
  //--- Brand Colors
  static const Color primary = Color(0xFFE53935);
  static const Color primaryDark = Color(0xFFC62828);
  static const Color primaryDarker = Color.fromARGB(255, 156, 12, 12);
  static const Color primaryLight = Color(0xFFFF6659);
  static const Color primarySurface = Color(0xFFFFF5F5);

  //--- Text Colors
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textLink = Color(0xFFE53935);

  //Surface and border colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF9FAFB);
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocus = Color(0xFFE53935);
  static const Color divider = Color(0xFFF3F4F6);

//--- Semantic Colors
  static const Color success = Color(0xFF22C55E);
  static const Color successSurface = Color(0xFFDCFCE7);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningSurface = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFEF4444);
  static const Color errorSurface = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoSurface = Color(0xFFEFF6FF);

  //---Appointment  status badges
  static const Color badgeUpcomingBg = Color(0xFFE8F5E9);
  static const Color badgeUpcomingFg = Color(0xFF2E7D32);
  static const Color badgePendingBg = Color(0xFFFFF3E0);
  static const Color badgePendingFg = Color(0xFFE65100);
  static const Color badgeCancelledBg = Color(0xFFFCE4EC);
  static const Color badgeCancelledFg = Color(0xFFC62828);
  static const Color badgeCompletedBg = Color(0xFFE0F2FE);
  static const Color badgeCompletedFg = Color(0xFF0277BD);
}
