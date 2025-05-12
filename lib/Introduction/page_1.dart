import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: size.height * 0.1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Üst boşluk

          // Ana görsel
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(30),
            child: SvgPicture.asset('assets/svg/int1.svg', fit: BoxFit.contain),
          ),

          SizedBox(height: 10),

          // Başlık
          Text(
            "introduction.page1.title".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),

          SizedBox(height: size.height * 0.025),

          // Açıklama
          Text(
            "introduction.page1.description".tr,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: size.height * 0.016,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.5,
            ),
          ),

          SizedBox(height: size.height * 0.05),
          // İpucu bilgisi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.lightbulb_outline,
                    color: Color(0xFF42C2C2),
                    size: 24,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "introduction.page1.tip".tr,
                    style: TextStyle(
                      fontSize: size.height * 0.016,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
