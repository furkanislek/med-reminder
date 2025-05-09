import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mr/components/home/medicine_card.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/pages/AddPill/add_pill.dart';
import 'package:mr/pages/Profile/profile.dart';
import 'package:mr/services/data_service.dart';
import 'package:mr/services/services.dart';

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

  @override
  Widget build(BuildContext context) {
    dataService.getMedicinesStream();
    return Scaffold(
      appBar: AppBar(
        title: Text('home.title'.tr),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => ProfileScreen());
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child:
                    isLoading
                        ? CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blueAccent,
                          ),
                        )
                        : profileImageBase64 != null &&
                            profileImageBase64!.isNotEmpty
                        ? CircleAvatar(
                          radius: 60,
                          backgroundImage: _getProfileImage(),
                        )
                        : photoUrl != null
                        ? CircleAvatar(
                          radius: 60,
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                hintText: 'filter.searchHint'.tr,
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
              onChanged: (value) {
                controller.updateSearchQuery(value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                'home.addMedicine'.tr,
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
              ),
              onPressed: () {
                Get.to(() => AddPillScreen());
              },
            ),
            const SizedBox(height: 20),
            Expanded(child: MedicineListView(controller: controller)),
          ],
        ),
      ),
    );
  }
}
