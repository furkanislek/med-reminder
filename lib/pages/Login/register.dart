import 'package:mr/pages/Login/login.dart';
import 'package:mr/pages/Login/register_confirm.dart';
import 'package:mr/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var errorMessage = ''.obs;
  var selectedImage = Rx<File?>(null);

  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      errorMessage.value = "register.password_not_match".tr;
      return;
    } else if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        surnameController.text.isEmpty) {
      errorMessage.value = "register.fill_all_fields".tr;
    }
    try {
      await Auth().registerUser(
        email: emailController.text,
        password: passwordController.text,
        firstName: nameController.text,
        surname: surnameController.text,
        profileImage: selectedImage.value,
      );

      errorMessage.value = '';
      Get.off(() => RegisterConfirm());
    } on FirebaseAuthException catch (e) {
      print("E $e");
      errorMessage.value = e.message ?? 'register.error_occurred'.tr;
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print("image: $image");
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/register.svg',
                height: 150.h,
                width: double.infinity,
              ),
              Text(
                "register.register_to_medreminder_app".tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () => Get.to(() => const Login()),
                child: RichText(
                  text: TextSpan(
                    text: "register.already_have_an_account".tr,
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    children: [
                      TextSpan(
                        text: "register.sign_in".tr,
                        style: TextStyle(
                          color: const Color(0xFF0996C7),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              _buildTextField(
                controller.nameController,
                "register.full_name".tr,
                Icons.person,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                controller.surnameController,
                "register.surname".tr,
                Icons.person,
              ),
              SizedBox(height: 15.h),
              _buildTextField(
                controller.emailController,
                "register.your_email".tr,
                Icons.email,
              ),
              SizedBox(height: 15.h),

              _buildPasswordField(
                controller.passwordController,
                "register.type_your_password".tr,
                controller.isPasswordVisible,
                controller.togglePasswordVisibility,
              ),
              SizedBox(height: 15.h),
              _buildPasswordField(
                controller.confirmPasswordController,
                "register.re_type_your_password".tr,
                controller.isConfirmPasswordVisible,
                controller.toggleConfirmPasswordVisibility,
              ),
              SizedBox(height: 15.h),
              Obx(
                () =>
                    controller.errorMessage.isNotEmpty
                        ? Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: Text(
                            controller.errorMessage.value,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
              GestureDetector(
                onTap: () => controller.pickImage(),
                child: Obx(
                  () =>
                      controller.selectedImage.value != null
                          ? Image.file(
                            controller.selectedImage.value!,
                            height: 150.h,
                          )
                          : Icon(
                            Icons.add_a_photo,
                            size: 150.h,
                            color: Colors.grey,
                          ),
                ),
              ),
              SizedBox(height: 25.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.registerUser(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0996C7),
                    padding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 100.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    "register.register".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 1.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey, size: 20.sp),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    String hintText,
    RxBool isVisible,
    Function toggleVisibility,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 1.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Obx(
        () => TextField(
          controller: controller,
          obscureText: !isVisible.value,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 20.sp),
            suffixIcon: IconButton(
              onPressed: () => toggleVisibility(),
              icon: Icon(
                isVisible.value ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
                size: 20.sp,
              ),
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
