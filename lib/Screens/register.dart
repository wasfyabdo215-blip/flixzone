import 'package:flixzone/Screens/login.dart';
import 'package:flutter/material.dart';
// 1. استيراد مكتبة الـ Provider والملف بتاعك
import 'package:provider/provider.dart';
import 'package:flixzone/provider/UserProvide.dart' as custom;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Username
                      _buildTextField(userController, "Username", Icons.person),
                      const SizedBox(height: 20),

                      // Email
                      _buildTextField(emailController, "Email", Icons.email),
                      const SizedBox(height: 20),

                      // Password
                      _buildTextField(passwordController, "Password", Icons.lock,
                          isPassword: true,
                          obscure: _obscurePassword,
                          onToggle: () => setState(() => _obscurePassword = !_obscurePassword)
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password
                      _buildTextField(confirmController, "Confirm Password", Icons.lock,
                          isPassword: true,
                          obscure: _obscureConfirm,
                          onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm)
                      ),
                      const SizedBox(height: 30),

                      // زر التسجيل
                      ElevatedButton(
                        onPressed: () {
                          // التحقق من أن كلمة المرور متطابقة
                          if (passwordController.text == confirmController.text && passwordController.text.isNotEmpty) {

                            // 💡 2. حفظ البيانات في الـ Provider قبل الانتقال
                            context.read<custom.Userprovide>().registerUser(
                              userController.text,
                              emailController.text,
                              passwordController.text,
                            );

                            // الانتقال لصفحة الـ Login
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Login()));
                          } else {
                            // إظهار تنبيه لو الباسورد مش متطابق
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Passwords do not match!")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text("Register", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة لتقليل تكرار الكود في الـ TextFields
  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isPassword = false, bool obscure = false, VoidCallback? onToggle}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: isPassword
            ? IconButton(icon: Icon(obscure ? Icons.visibility : Icons.visibility_off, color: Colors.white70), onPressed: onToggle)
            : null,
        filled: true,
        fillColor: const Color(0xFF2C2C3A).withOpacity(0.8),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.white24)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.red, width: 2)),
      ),
    );
  }
}