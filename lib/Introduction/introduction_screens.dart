import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr/Introduction/page_1.dart';
import 'package:mr/Introduction/page_2.dart';
import 'package:mr/Introduction/page_3.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({super.key});

  @override
  State<IntroductionScreens> createState() => _IntroductionScreensState();
}

class _IntroductionScreensState extends State<IntroductionScreens> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF42C2C2), Color.fromARGB(255, 122, 228, 228)],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Üst kısımdaki logo alanı
              Positioned(
                top: 20.h,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "PocketPath",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Ana içerik alanı
              PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [Page1(), Page2(), Page3()],
              ),

              // Alt kısımdaki kontroller
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      // Sayfa indikatörü
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.white,
                          dotColor: Colors.white.withOpacity(0.4),
                          dotHeight: 9.h,
                          dotWidth: 9.w,
                          spacing: 10.w,
                          expansionFactor: 3,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      // Butonlar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Geri/Atla butonu
                          TextButton(
                            onPressed: () {
                              isLastPage
                                  ? _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  )
                                  : Get.off(() => Menu());
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 10.h,
                              ),
                            ),
                            child: Text(
                              isLastPage
                                  ? "introduction.back".tr
                                  : "introduction.skip".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          // İleri/Başla butonu
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.white, Color(0xFFE0F7F7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                isLastPage
                                    ? Get.off(() => Menu())
                                    : _controller.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              elevation: 0,
                              highlightElevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.w,
                                vertical: 15.h,
                              ),
                              child: Text(
                                isLastPage
                                    ? "introduction.start".tr
                                    : "introduction.next".tr,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF42C2C2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
