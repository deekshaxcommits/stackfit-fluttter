import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/app/router/app_router.dart';
import 'package:frontend/app/theme/colors.dart';
import 'package:frontend/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class SplashScreen extends StatefulWidget implements AutoRouteWrapper {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  void _navigateToDashboard() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    context.router.replace(OnboardingRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBase,
      body: Container(
        decoration: BoxDecoration(
            // gradient: RadialGradient(
            //   center: Alignment.center,
            //   radius: 1.2,
            //   colors: [
            //     AppColors.neonPurple.withOpacity(0.1),
            //     AppColors.darkBase,
            //     AppColors.darkBase,
            //   ],
            //   stops: const [0.0, 0.3, 1.0],
            // ),
            ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Enhanced logo container with glow effect
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyberGrape.withOpacity(0.3),
                      blurRadius: 30.r,
                      spreadRadius: 2.r,
                    ),
                    BoxShadow(
                      color: AppColors.neonPurple.withOpacity(0.1),
                      blurRadius: 60.r,
                      spreadRadius: 10.r,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.cyberGrape.withOpacity(0.2),
                      width: 2.w,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      Assets.images.logo.path,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.fill,
                    )
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .shimmer(
                          duration: 1500.ms,
                          color: AppColors.neonPurple,
                        )
                        .then()
                        .shake(
                          duration: 200.ms,
                          hz: 4,
                        ),
                  ),
                ),
              ).animate().scale(
                    duration: 600.ms,
                    curve: Curves.elasticOut,
                  ),

              SizedBox(height: 24.h),

              // Enhanced text with gradient and animations
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyberGrape.withOpacity(0.15),
                      blurRadius: 15.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      AppColors.secondaryText,
                      AppColors.cyberGrape.withOpacity(0.8),
                      AppColors.secondaryText,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ).createShader(bounds),
                  child: FittedBox(
                    child: Text(
                      "StackFit",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1.0,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              )
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.3, end: 0, duration: 600.ms)
                  .then()
                  .shimmer(
                    duration: 2000.ms,
                    color: AppColors.cyberGrape.withOpacity(0.5),
                  ),

              SizedBox(height: 40.h),

              // Loading indicator
              SizedBox(
                width: 40.w,
                height: 3.h,
                child: LinearProgressIndicator(
                  backgroundColor: AppColors.cyberGrape.withOpacity(0.2),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.cyberGrape),
                ),
              )
                  .animate(delay: 800.ms)
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: -1, end: 0, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
