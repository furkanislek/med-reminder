import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr/Introduction/page_1.dart';
import 'package:mr/Introduction/page_2.dart';
import 'package:mr/Introduction/page_3.dart';
import 'package:mr/pages/Menu/menu.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                isLastPage = value == 2;
              });
            },
            controller: _controller,
            children: [Page1(), Page2(), Page3()],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Get.off(() => Menu());
                  },
                  child: Text("introduction.skip".tr),
                ),
                SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(dotWidth: 15),
                  controller: _controller,
                  count: 3,
                ),
                isLastPage
                    ? TextButton(
                      onPressed: () {
                        Get.off(() => Menu());
                      },
                      child: Text("introduction.done".tr),
                    )
                    : TextButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text("introduction.next".tr),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
