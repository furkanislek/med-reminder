import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mr/components/home/medicine_card.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/controller/menu/bottom_navigator.dart';
import 'package:mr/pages/AddPill/add_pill.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.find<HomeController>();
  final DataService dataService = Get.find<DataService>();

  bool isLoading = true;
  String? profileImageBase64;
  String? photoUrl;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _refreshMedicines();
  }

  Future<void> _fetchUserData() async {
    try {
      final userData = await Auth().fetchUser();
      if (userData != null) {
        setState(() {
          profileImageBase64 = userData['profileImage'];
          photoUrl = userData['photo'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  ImageProvider _getProfileImage() {
    if (profileImageBase64 != null && profileImageBase64!.isNotEmpty) {
      return MemoryImage(base64Decode(profileImageBase64!));
    } else if (photoUrl != null) {
      return NetworkImage(photoUrl!);
    } else {
      return const AssetImage('assets/avatar.png');
    }
  }

  Future<void> _refreshMedicines() async {
    await dataService.getMedicinesStream().first;
    controller.update();
    controller.calculateNextDose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home.title'.tr),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                final BottomNavigationController bottomController =
                    Get.find<BottomNavigationController>();
                bottomController.changeTabIndex(3);
              },
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.white,
                child:
                    isLoading
                        ? CircularProgressIndicator(
                          strokeWidth: 2.w,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blueAccent,
                          ),
                        )
                        : profileImageBase64 != null &&
                            profileImageBase64!.isNotEmpty
                        ? CircleAvatar(
                          radius: 60.r,
                          backgroundImage: _getProfileImage(),
                        )
                        : photoUrl != null
                        ? CircleAvatar(
                          radius: 60.r,
                          backgroundImage: NetworkImage(photoUrl!),
                        )
                        : SvgPicture.asset('assets/svg/pill.svg'),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            TextField(
              decoration: InputDecoration(
                hintText: 'filter.searchHint'.tr,
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20.sp),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.w),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16.w,
                ),
              ),
              onChanged: (value) {
                controller.updateSearchQuery(value);
              },
            ),
            SizedBox(height: 20.h),
            ElevatedButton.icon(
              icon: Icon(Icons.add, color: Colors.white, size: 20.sp),
              label: Text(
                'home.addMedicine'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14.sp,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 2,
              ),
              onPressed: () {
                Get.to(() => AddPillScreen());
              },
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshMedicines,
                child: MedicineListView(controller: controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
