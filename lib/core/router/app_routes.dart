
abstract class AppRoutes {
  // ----- Splash & Onboarding -----
  static const String splash = '/';
  static const String onboarding = '/onboarding';

  // ----- Authentication -----
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String verifyOtp = '/auth/verify-otp';

  // ----- Main Shell (Bottom Nav tabs) -----
  static const String home = '/home';
  static const String appointments = '/appointments';
  static const String profile = '/profile';

  //Specialist
  static const String specialists = '/specialists';
  static const String specialistDetail = '/specialist/:id'; //: declares a path parameter

  // Appointments
  static const String appointmentDetail = '/appointment/:id';

  //Profile
  static const String editProfile = '/profile/edit';
  static const String changePassword = '/profile/change-password';
  static const String notifications = '/profile/notifications';
  static const String helpSupport = '/profile/help';

  //Booking
  static const String booking = '/booking';
  static const String bookingSlot = '/booking/:specialistId/slot';
  static const String bookingConfirm = '/booking/:specialistId/confirm';
  static const String bookingPayment = '/booking/:specialistId/payment';
  static const String bookingSuccess = '/booking/success';
  
}
