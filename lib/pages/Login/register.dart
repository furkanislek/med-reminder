import 'package:mr/pages/Login/login.dart';
import 'package:mr/pages/Login/register_confirm.dart';
import 'package:mr/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width / 13,
            vertical: height / 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/register.svg',
                height: height / 6,
                width: double.infinity,
              ),
              Text(
                "register.register_to_medreminder_app".tr,
                style: TextStyle(
                  fontSize: height / 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: height / 50),
              GestureDetector(
                onTap: () => Get.to(() => const Login()),
                child: RichText(
                  text: TextSpan(
                    text: "register.already_have_an_account".tr,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height / 60,
                    ),
                    children: [
                      TextSpan(
                        text: "register.sign_in".tr,
                        style: TextStyle(color: const Color(0xFF0996C7)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 30),
              _buildTextField(
                controller.nameController,
                "register.full_name".tr,
                Icons.person,
                width,
                height,
              ),
              SizedBox(height: height / 60),
              _buildTextField(
                controller.surnameController,
                "register.surname".tr,
                Icons.person,
                width,
                height,
              ),
              SizedBox(height: height / 60),
              _buildTextField(
                controller.emailController,
                "register.your_email".tr,
                Icons.email,
                width,
                height,
              ),
              SizedBox(height: height / 60),

              _buildPasswordField(
                controller.passwordController,
                "register.type_your_password".tr,
                controller.isPasswordVisible,
                controller.togglePasswordVisibility,
                height,
              ),
              SizedBox(height: height / 60),
              _buildPasswordField(
                controller.confirmPasswordController,
                "register.re_type_your_password".tr,
                controller.isConfirmPasswordVisible,
                controller.toggleConfirmPasswordVisibility,
                height,
              ),
              SizedBox(height: height / 60),
              Obx(
                () =>
                    controller.errorMessage.isNotEmpty
                        ? Padding(
                          padding: EdgeInsets.only(top: height / 50),
                          child: Text(
                            controller.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
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
                            height: height / 6,
                          )
                          : Icon(
                            Icons.add_a_photo,
                            size: height / 6,
                            color: Colors.grey,
                          ),
                ),
              ),
              SizedBox(height: height / 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.registerUser(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0996C7),
                    padding: EdgeInsets.symmetric(
                      vertical: height / 56,
                      horizontal: width / 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "register.register".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 50,
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
    double width,
    double height,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height / 150, horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
          prefixIcon: Icon(icon, color: Colors.grey),
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
    double height,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height / 150, horizontal: 1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
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
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible.value ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () => toggleVisibility(),
            ),
          ),
        ),
      ),
    );
  }
}
