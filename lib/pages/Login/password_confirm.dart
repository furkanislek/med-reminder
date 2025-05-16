import 'package:mr/pages/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Confirm extends StatelessWidget {
  Confirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            height: 1.sh,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/confirm.svg',
                  height: 180.h,
                  width: double.infinity,
                ),
                SizedBox(height: 30.h),
                Text(
                  "auth.checkEmail".tr,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0E254D),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "auth.resetPasswordInfo".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
                SizedBox(height: 40.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => const Login());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8256DF),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 100.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Text(
                      "general.confirm".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
