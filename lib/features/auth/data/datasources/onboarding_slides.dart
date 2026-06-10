import 'package:flutter/material.dart';
import 'package:zenith_care/features/auth/domain/entities/onboarding_slide.dart';

const slides = [
  OnboardingSlide(
    title: 'Expert Specialists',
    description: 'Connect with verified doctors across multiple specialties',
    icon: Icons.medical_services_outlined,
  ),
  OnboardingSlide(
    title: 'Consult from Anywhere',
    description: 'Book appointments and consult securely at any time',
    icon: Icons.videocam_outlined,
  ),
  OnboardingSlide(
    title: 'Your Health, Our Priority',
    description: 'Personalised care and continuous support for a healthier you',
    icon: Icons.favorite_outline,
  ),
];
