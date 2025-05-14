import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; // Placeholder, will add to pubspec
import 'package:mr/models/blog_model.dart';
import 'package:get/get.dart'; // For localization
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import for ScreenUtil

class BlogDetailPage extends StatefulWidget {
  final Blog? blog;
  final Color? categoryColor;
  final Color? secondaryCategoryColor;
  final Color? textCategoryColor;

  const BlogDetailPage({
    super.key,
    this.blog,
    this.categoryColor,
    this.secondaryCategoryColor,
    this.textCategoryColor,
  });

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage>
    with SingleTickerProviderStateMixin {
  final PageController controller = PageController();
  int currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuad),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  List<String> parseHtmlContent(String htmlContent) {
    final RegExp h2StartRegex = RegExp(r'<h2>', caseSensitive: false);
    final matches = h2StartRegex.allMatches(htmlContent).toList();

    if (matches.isEmpty) {
      return [htmlContent];
    }

    final List<String> parts = [];

    for (int i = 0; i < matches.length; i++) {
      final startIndex = matches[i].start;
      final endIndex =
          (i < matches.length - 1) ? matches[i + 1].start : htmlContent.length;

      parts.add(htmlContent.substring(startIndex, endIndex));
    }

    return parts;
  }

  @override
  Widget build(BuildContext context) {
    final currentLocaleTag = Get.locale?.toString() ?? 'en_US';
    final articleContent = widget.blog?.getArticle(currentLocaleTag) ?? '';
    final htmlContents = parseHtmlContent(articleContent);

    return Scaffold(
      backgroundColor: widget.categoryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: widget.secondaryCategoryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index % htmlContents.length;
          });
          // Yeni sayfa görüntülendiğinde animasyonu sıfırla ve başlat
          _animationController.reset();
          _animationController.forward();
        },
        itemCount: htmlContents.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                left: 20.w,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < htmlContents.length; i++)
                        buildProgressIndicator(i, currentIndex),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 20.w, top: 100.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return FadeTransition(
                          opacity: _opacityAnimation,

                          child: Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: widget.secondaryCategoryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  color: widget.textCategoryColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),

                    Expanded(
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _opacityAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: child,
                            ),
                          );
                        },
                        child: SingleChildScrollView(
                          child: Html(
                            data: htmlContents[index],
                            style: {
                              "h2": Style(
                                fontSize: FontSize(28.sp),
                                fontWeight: FontWeight.bold,
                                color: widget.textCategoryColor,
                                margin: Margins.only(bottom: 20.h),
                              ),
                              "p": Style(
                                fontSize: FontSize(16.sp),
                                lineHeight: LineHeight.em(1.5),
                                color: widget.textCategoryColor,
                                margin: Margins.only(bottom: 16.h),
                              ),
                              "ul": Style(margin: Margins.only(left: 0.w)),
                              "li": Style(
                                fontSize: FontSize(16.sp),
                                lineHeight: LineHeight.em(1.5),
                                color: widget.textCategoryColor,
                                margin: Margins.only(bottom: 8.h),
                              ),
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                right: 10.w,
                bottom: 10.h,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: _opacityAnimation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        child: SvgPicture.asset(
                          widget.blog?.category == "pills"
                              ? "assets/svg/pillBlog.svg"
                              : widget.blog?.category == "health"
                              ? "assets/svg/healthBlog.svg"
                              : "assets/svg/lifestyleBlog.svg",
                          height: 250.h,
                          width: 50.w,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildProgressIndicator(int index, int currentIndex) {
    final bool isActive = index == currentIndex;
    final bool isPast = index < currentIndex;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      width: 5.w,
      height: 15.h,
      decoration: BoxDecoration(
        color:
            isActive
                ? widget.textCategoryColor
                : isPast
                ? widget.textCategoryColor!.withOpacity(0.6)
                : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}
