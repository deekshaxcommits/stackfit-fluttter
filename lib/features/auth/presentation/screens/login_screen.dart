import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/app/router/app_router.dart';
import 'package:frontend/app/theme/colors.dart';
import 'package:frontend/core/widgets/buttons/glowy_button.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => this;
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleEmailLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate login process
      await Future.delayed(2.seconds);

      setState(() => _isLoading = false);
      context.router.replace(DashboardRoute());
    }
  }

  void _handleSocialLogin(String provider) async {
    // Handle social login
    HapticFeedback.lightImpact();
    setState(() => _isLoading = true);

    await Future.delayed(1.5.seconds);

    setState(() => _isLoading = false);
    context.router.replace(DashboardRoute());
  }

  Widget _buildSocialIcon({
    required String iconPath,
    required VoidCallback onPressed,
    double size = 50,
  }) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.electricViolet.withOpacity(0.2),
            blurRadius: 15.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Material(
        color: AppColors.secondaryDark,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: _isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.electricViolet.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Image.asset(
              iconPath,
              width: (size * 0.5).w,
              height: (size * 0.5).h,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppleSocialIcon({
    required VoidCallback onPressed,
    double size = 50,
  }) {
    return Container(
      width: size.w,
      height: size.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.electricViolet.withOpacity(0.2),
            blurRadius: 15.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Material(
        color: AppColors.secondaryDark,
        borderRadius: BorderRadius.circular(12.r),
        child: InkWell(
          onTap: _isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.electricViolet.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Image.asset(
              "assets/icons/apple.png", // Use a white version of the Apple icon
              width: (size * 0.5).w,
              color: Colors.white,
              height: (size * 0.5).h,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.electricViolet.withOpacity(0.1),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: AppColors.electricViolet,
            size: 22.r,
          ),
          suffixIcon: suffixIcon,
          labelStyle: GoogleFonts.inter(
            fontSize: 14.sp,
            color: AppColors.secondaryText,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: GoogleFonts.inter(
            fontSize: 14.sp,
            color: AppColors.secondaryText.withOpacity(0.7),
          ),
          filled: true,
          fillColor: AppColors.secondaryDark.withOpacity(0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.electricViolet.withOpacity(0.3),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.electricViolet.withOpacity(0.3),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColors.electricViolet,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.7),
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 16.w,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBase,
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.cyberGrape.withOpacity(0.15),
                      AppColors.darkBase,
                      AppColors.darkBase,
                    ],
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),

            // Subtle accent gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topRight,
                    radius: 1.2,
                    colors: [
                      AppColors.electricViolet.withOpacity(0.08),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.7],
                  ),
                ),
              ),
            ),

            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h),

                    // Logo/App name
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.electricViolet.withOpacity(0.3),
                            blurRadius: 20.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Text(
                        "StackFit",
                        style: GoogleFonts.inter(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryText,
                          letterSpacing: -1,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: -0.2, end: 0),

                    SizedBox(height: 4.h),

                    Text(
                      "Welcome back, let's get you signed in",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryText,
                        height: 1.3,
                      ),
                      textAlign: TextAlign.center,
                    )
                        .animate(delay: 200.ms)
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.1, end: 0),

                    SizedBox(height: 40.h),

                    // Social icons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(
                          iconPath: "assets/icons/google.png",
                          onPressed: () => _handleSocialLogin("google"),
                        )
                            .animate(delay: 300.ms)
                            .fadeIn(duration: 600.ms)
                            .slideX(begin: -0.2, end: 0),
                        SizedBox(width: 16.w),
                        if (Platform.isIOS) ...[
                          _buildAppleSocialIcon(
                            onPressed: () => _handleSocialLogin("apple"),
                          )
                              .animate(delay: 400.ms)
                              .fadeIn(duration: 600.ms)
                              .slideX(begin: -0.2, end: 0),
                          SizedBox(width: 16.w),
                        ],
                        _buildSocialIcon(
                          iconPath: "assets/icons/metamask.png",
                          onPressed: () => _handleSocialLogin("metamask"),
                        )
                            .animate(delay: 500.ms)
                            .fadeIn(duration: 600.ms)
                            .slideX(begin: 0.2, end: 0),
                      ],
                    ),

                    SizedBox(height: 32.h),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  AppColors.electricViolet.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            "or",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  AppColors.electricViolet.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate(delay: 600.ms).fadeIn(duration: 400.ms),

                    SizedBox(height: 32.h),

                    // Email/Password form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: _emailController,
                            label: "Email",
                            hint: "Enter your email",
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          )
                              .animate(delay: 700.ms)
                              .fadeIn(duration: 600.ms)
                              .slideX(begin: 0.2, end: 0),

                          SizedBox(height: 16.h),

                          _buildTextField(
                            controller: _passwordController,
                            label: "Password",
                            hint: "Enter your password",
                            icon: Icons.lock_outline,
                            obscureText: _obscurePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.secondaryText,
                                size: 20.r,
                              ),
                              onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          )
                              .animate(delay: 800.ms)
                              .fadeIn(duration: 600.ms)
                              .slideX(begin: 0.2, end: 0),

                          SizedBox(height: 4.h),

                          // Forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              child: Text(
                                "Forgot Password?",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: AppColors.electricViolet,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ).animate(delay: 900.ms).fadeIn(duration: 400.ms),

                          SizedBox(height: 24.h),

                          // Login button
                          GlowyButton(
                            text: _isLoading ? "Signing in..." : "Sign In",
                            onPressed: _isLoading ? () {} : _handleEmailLogin,
                            verticalPadding: 18,
                          )
                              .animate(delay: 1000.ms)
                              .fadeIn(duration: 600.ms)
                              .slideY(begin: 0.2, end: 0)
                              .scale(
                                  begin: Offset(0.95, 0.95), end: Offset(1, 1)),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Sign up link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.push(SignUpRoute());
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: AppColors.electricViolet,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ).animate(delay: 1100.ms).fadeIn(duration: 400.ms),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
