import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GlowyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double verticalPadding;

  const GlowyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.verticalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.electricViolet.withOpacity(0.6),
            blurRadius: 20.r,
            spreadRadius: 2.r,
          ),
          BoxShadow(
            color: AppColors.electricViolet.withOpacity(0.3),
            blurRadius: 40.r,
            spreadRadius: 4.r,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.electricViolet,
          padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryText,
            ),
          ),
        ),
      ),
    );
  }
}
