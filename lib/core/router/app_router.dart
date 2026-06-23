import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/appointments/domain/entities/appointment.dart';
import '../../features/appointments/presentation/screens/appointment_detail_screen.dart';
import '../../features/appointments/presentation/screens/appointment_screen.dart';
import '../../features/auth/presentation/notifiers/auth_notifier.dart';
import '../../features/auth/presentation/notifiers/onboarding_notifier.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/otp_verify_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/booking/domain/entities/booking_draft.dart';
import '../../features/booking/presentation/screens/booking_confirm_screen.dart';
import '../../features/booking/presentation/screens/booking_slot_screen.dart';
import '../../features/booking/presentation/screens/booking_success_screen.dart';
import '../../features/booking/presentation/screens/payment_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/profile/presentation/screens/help_support_screen.dart';
import '../../features/profile/presentation/screens/notification_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/specialists/domain/entities/specialist.dart';
import '../../features/specialists/presentation/screens/specialist_detail_screen.dart';
import '../../features/specialists/presentation/screens/specialist_list_screend.dart';
import '../widgets/app_scaffold.dart';
import 'app_routes.dart';


part 'app_router.g.dart';

// ── RouterNotifier ─────────────────────────────────────────────────────────
// A ChangeNotifier that bridges Riverpod providers to GoRouter.
// GoRouter calls notifyListeners() whenever this fires, which causes
// it to re-evaluate the redirect callback.
// This replaces GoRouterRefreshStream entirely.

class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(this._ref) {
    // Listen to auth state changes
    _ref.listen<AuthState>(authProvider, (_, __) => notifyListeners());

    // Listen to onboarding completion
    _ref.listen<AsyncValue<bool>>(
      hasCompletedOnboardingProvider,
      (_, __) => notifyListeners(),
    );
  }

  final Ref _ref;
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  // Create the notifier that bridges Riverpod → GoRouter
  final notifier = _RouterNotifier(ref);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,

    // This fires whenever auth state OR onboarding state changes.
    // GoRouter then re-runs the redirect callback below.
    refreshListenable: notifier,

    redirect: (context, state) {
      // Read current values at redirect evaluation time
      final authState = ref.read(authProvider);
      final onboardingAsync = ref.read(hasCompletedOnboardingProvider);

      final isLoggedIn = authState is AuthAuthenticated;
      final isInitializing = authState is AuthInitial;
      final seenOnboarding = onboardingAsync.when(
        data: (value) => value,
        loading: () => false,
        error: (_, __) => false,
      );

      final loc = state.matchedLocation;
      final isOnSplash = loc == AppRoutes.splash;
      final isOnOnboarding = loc == AppRoutes.onboarding;
      final isOnAuthRoute = loc.startsWith('/auth');

      debugPrint(
          '🔁 Redirect called — seenOnboarding: $seenOnboarding, loc: $loc, isLoggedIn: $isLoggedIn');

      // Authenticated users never see splash or auth screens
      if (isLoggedIn && isOnSplash) return AppRoutes.home;
      if (isLoggedIn && isOnAuthRoute) return AppRoutes.home;

      // Still checking session — hold on splash
      if (isInitializing) return AppRoutes.splash;

      // On onboarding — leave them if not seen it, send to login if done
      if (isOnOnboarding) {
        return seenOnboarding ? AppRoutes.login : null;
      }

      // Logged out on a protected screen — gate them
      if (!isLoggedIn && !isOnSplash && !isOnOnboarding && !isOnAuthRoute) {
        return seenOnboarding ? AppRoutes.login : AppRoutes.onboarding;
      }

      return null;
    },

    routes: [
      // ── Splash ──────────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // ── Onboarding ──────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // ── Auth routes ──────────────────────────────────────────────────────
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        // extra is for passing complex objects that cannot be encoded in the URL.
        // The register screen needs to know the email pre-filled from the login screen.
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.verifyOtp,
        builder: (context, state) {
          final phoneNumber = state.extra as String? ?? '';
          return OtpVerifyScreen(phoneNumber: phoneNumber);
        },
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffold(
            navigationShell: navigationShell,
          );
        },
        branches: [
          // -- Branch 0: Home
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const HomeScreen(),
            ),
          ]),

          // -- Branch 1: Specialist & Booking
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.specialists,
                builder: (context, state) => const SpecialistListScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final specialistId = state.pathParameters['id']!;
                      final specialist = state.extra as Specialist?;
                      return SpecialistDetailScreen(
                        specialistId: specialistId,
                        specialist: specialist,
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'book/slot',
                        builder: (context, state) {
                          final specialist = state.extra as Specialist?;
                          return BookingSlotScreen(
                            specialist: specialist,
                          );
                        },
                      ),
                      GoRoute(
                        path: 'book/confirm',
                        builder: (context, state) {
                          final bookingDraft = state.extra as BookingDraft?;
                          return BookingConfirmScreen(
                            booking: bookingDraft,
                          );
                        },
                      ),
                      GoRoute(
                        path: 'book/payment',
                        builder: (context, state) {
                          final bookingDraft = state.extra as BookingDraft?;
                          return PaymentScreen(
                            booking: bookingDraft,
                          );
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),

          // -- Branch 2: Appointments
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.appointments,
                builder: (context, state) => const AppointmentScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    builder: (context, state) {
                      final appointmentId = state.pathParameters['id']!;
                      return AppointmentDetailScreen(
                        appointmentId: appointmentId,
                      );
                    },
                  ),
                ],
              )
            ],
          ),

          // -- Branch 4: Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    builder: (context, state) => const EditProfileScreen(),
                  ),
                  GoRoute(
                    path: 'notification',
                    builder: (context, state) => const NotificationScreen(),
                  ),
                  GoRoute(
                    path: 'help',
                    builder: (context, state) => const HelpScreen(),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.bookingSuccess,
        builder: (context, state) {
          final appointment = state.extra as Appointment?;
          return BookingSuccessScreen(appointment: appointment);
        },
      )

    ],
  );
}
