import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenith_care/core/router/app_routes.dart';
import 'package:zenith_care/core/router/splash_onboarding_trigger.dart';
import 'package:zenith_care/features/auth/presentation/notifiers/onboarding_notifier.dart';
import 'package:zenith_care/features/auth/presentation/screens/otp_verify_screen.dart';
import 'package:zenith_care/features/specialists/domain/entities/specialist.dart';
import '../../features/appointments/domain/entities/appointment.dart';
import '../../features/appointments/presentation/screens/appointment_detail_screen.dart';
import '../../features/appointments/presentation/screens/appointment_screen.dart';
import '../../features/auth/presentation/notifiers/auth_notifier.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/booking/domain/entities/booking_draft.dart';
import '../../features/booking/presentation/screens/booking_confirm_screen.dart';
import '../../features/booking/presentation/screens/booking_slot_screen.dart';
import '../../features/booking/presentation/screens/booking_success_screen.dart';
import '../../features/booking/presentation/screens/payment_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/messages/messages_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/profile/presentation/screens/help_support_screen.dart';
import '../../features/profile/presentation/screens/notification_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/specialists/presentation/screens/specialist_detail_screen.dart';
import '../../features/specialists/presentation/screens/specialist_list_screend.dart';
import '../widgets/app_scaffold.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authProvider);
  final hasStartedOnboarding = ref.watch<bool>(splashOnboardingTriggerProvider);
  final hasCompletedOnboarding = ref.watch(hasCompletedOnboardingProvider).when(
        data: (value) => value,
        loading: () => false,
        error: (_, __) => false,
      );

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (BuildContext context, GoRouterState state) {
      final isLoggedIn = authState is AuthAuthenticated;
      final isInitializing = authState is AuthInitial;

      // Destinations
      final destination = state.matchedLocation;
      final isOnAuthRoute = destination.startsWith('/auth');
      final isOnSplash = destination == '/';
      final isOnOnboarding = destination == AppRoutes.onboarding;

      //Case 1: App is initializing, show splash screen
      if (isInitializing) {
        return AppRoutes.splash;
      }

      //Case 2: User completed onboarding and is not logged in
      if (!isLoggedIn &&
          hasCompletedOnboarding &&
          (isOnSplash || isOnOnboarding)) {
        return AppRoutes.login;
      }

      //Case 3: User tapped Get Started on splash and should start onboarding
      if (!isLoggedIn && isOnSplash && hasStartedOnboarding) {
        return AppRoutes.onboarding;
      }

      //Case 4: user is not logged in and trying to reach a protect screen
      if (!isLoggedIn && !isOnAuthRoute && !isOnSplash && !isOnOnboarding) {
        return AppRoutes.login;
      }

      //Case 5: User is logged in but is on n auth screen or the splash
      if (isLoggedIn && (isOnAuthRoute || isOnSplash || isOnOnboarding)) {
        return AppRoutes.home;
      }

      return null; // no redirection
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
          final prefillEmail = state.extra as String? ?? '';
          return RegisterScreen(prefillMail: prefillEmail);
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

          // -- Branch 3: Messages
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.messages,
                builder: (context, state) => const MessagesScreen(),
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

    //-- Error page
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Page not found!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              state.error?.message ?? 'Unknown error',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go home'),
            )
          ],
        ),
      ),
    ),
  );
}
