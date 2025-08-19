import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/app/router/app_router.dart';
import 'package:frontend/app/theme/colors.dart';
import 'package:frontend/core/widgets/buttons/glowy_button.dart';
import 'package:frontend/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget implements AutoRouteWrapper {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": Assets.images.onboardingBackgrounds.bg1.path,
      "title": "Welcome to StackFit: Your Own Gym Bro",
      "subtitle":
          "Easily track your workouts, set goals, and crush them like a pro",
    },
    {
      "image": Assets.images.onboardingBackgrounds.bg2.path,
      "title": "Stay Motivated Every Single Day",
      "subtitle":
          "Receive daily reminders, track streaks, and stay consistent effortlessly",
    },
    {
      "image": Assets.images.onboardingBackgrounds.bg3.path,
      "title": "Visualize Your Progress and Achievements",
      "subtitle":
          "Upload progress pics, view analytics, and enjoy every milestone",
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: 500.ms,
        curve: Curves.easeInOut,
      );
    } else {
      context.router.replace(DashboardRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBase,
      body: SafeArea(
        child: Stack(
          children: [
            // PageView with content
            PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (_, index) {
                final item = _onboardingData[index];
                return Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      bottom: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item["image"]!),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Enhanced gradient overlays
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.cyberGrape.withOpacity(0.2),
                              Colors.transparent,
                              AppColors.darkBase.withOpacity(0.7),
                              AppColors.darkBase.withOpacity(0.95),
                            ],
                            stops: const [0.0, 0.3, 0.7, 1.0],
                          ),
                        ),
                      ),
                    ),

                    // Subtle electric violet accent gradients
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.bottomCenter,
                            radius: 1.5,
                            colors: [
                              AppColors.electricViolet.withOpacity(0.15),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.8],
                          ),
                        ),
                      ),
                    ),

                    // Content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 32.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Enhanced title with gradient text and text shadow
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.8),
                                      blurRadius: 15.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.primaryText,
                                      AppColors.electricViolet,
                                      AppColors.primaryText,
                                    ],
                                    stops: const [0.0, 0.6, 1.0],
                                  ).createShader(bounds),
                                  child: Text(
                                    item["title"]!,
                                    style: GoogleFonts.inter(
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      letterSpacing: -0.8,
                                      height: 1.1,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          offset: Offset(0, 2.h),
                                          blurRadius: 8.r,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                                  .animate()
                                  .fadeIn(duration: 800.ms)
                                  .slideY(begin: 0.3, end: 0, duration: 600.ms),

                              SizedBox(height: 16.h),

                              // Enhanced subtitle with text shadow
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      blurRadius: 10.r,
                                      offset: Offset(0, 1.h),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  item["subtitle"]!,
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondaryText,
                                    height: 1.4,
                                    letterSpacing: 0.2,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.8),
                                        offset: Offset(0, 1.h),
                                        blurRadius: 6.r,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                                  .animate(delay: 200.ms)
                                  .fadeIn(duration: 800.ms)
                                  .slideY(begin: 0.2, end: 0, duration: 600.ms),

                              SizedBox(height: 32.h),

                              // Enhanced button with additional glow
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.electricViolet
                                          .withOpacity(0.4),
                                      blurRadius: 25.r,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: GlowyButton(
                                  text:
                                      _currentPage == _onboardingData.length - 1
                                          ? "Start Your Journey"
                                          : "Continue",
                                  onPressed: _nextPage,
                                  verticalPadding: 20,
                                ),
                              )
                                  .animate(delay: 400.ms)
                                  .fadeIn(duration: 600.ms)
                                  .slideY(begin: 0.2, end: 0, duration: 600.ms)
                                  .scale(
                                      begin: Offset(0.9, 0.9),
                                      end: Offset(1, 1)),
                            ],
                          ),
                        ),

                        // Add some space for the external page indicators
                        SizedBox(height: 80.h),
                      ],
                    ),
                  ],
                );
              },
            ),

            // Page indicators positioned outside the PageView
            Positioned(
              bottom: 40.h,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.cyberGrape.withOpacity(0.15),
                    border: Border.all(
                      color: AppColors.electricViolet.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.electricViolet.withOpacity(0.1),
                        blurRadius: 10.r,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (i) => AnimatedContainer(
                        duration: 300.ms,
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        width: _currentPage == i ? 24.w : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          gradient: _currentPage == i
                              ? LinearGradient(
                                  colors: [
                                    AppColors.electricViolet,
                                    AppColors.cyberGrape,
                                  ],
                                )
                              : null,
                          color: _currentPage == i
                              ? null
                              : AppColors.secondaryDark.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: _currentPage == i
                              ? [
                                  BoxShadow(
                                    color: AppColors.electricViolet
                                        .withOpacity(0.5),
                                    blurRadius: 8.r,
                                    spreadRadius: 1.r,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ).animate(delay: 600.ms).fadeIn(duration: 400.ms),
            ),
          ],
        ),
      ),
    );
  }
}
