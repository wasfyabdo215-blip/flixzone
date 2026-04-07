import 'package:flixzone/Screens/login.dart';
import 'package:flutter/material.dart';
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
  bool _isLoading = false;

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

                      _buildTextField(userController, "Username", Icons.person),
                      const SizedBox(height: 20),

                      _buildTextField(emailController, "Email", Icons.email),
                      const SizedBox(height: 20),

                      _buildTextField(
                        passwordController,
                        "Password",
                        Icons.lock,
                        isPassword: true,
                        obscure: _obscurePassword,
                        onToggle: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                      const SizedBox(height: 20),

                      _buildTextField(
                        confirmController,
                        "Confirm Password",
                        Icons.lock,
                        isPassword: true,
                        obscure: _obscureConfirm,
                        onToggle: () =>
                            setState(() => _obscureConfirm = !_obscureConfirm),
                      ),
                      const SizedBox(height: 30),


                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.red)
                          : ElevatedButton(
                        onPressed: () async {

                          if (passwordController.text == confirmController.text &&
                              passwordController.text.isNotEmpty &&
                              userController.text.isNotEmpty &&
                              emailController.text.isNotEmpty) {

                            setState(() => _isLoading = true);

                            try {

                              await context.read<custom.Userprovide>().registerUser(
                                userController.text,
                                emailController.text,
                                passwordController.text,
                              );


                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Account created successfully!")),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Login()),
                                );
                              }
                            } catch (e) {

                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
                                );
                              }
                            } finally {
                              if (mounted) setState(() => _isLoading = false);
                            }

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please make sure all fields are correct!"),
                              ),
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
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
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

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      IconData icon, {
        bool isPassword = false,
        bool obscure = false,
        VoidCallback? onToggle,
      }) {
    return TextField(
      controller: controller,
      obscureText: obscure,

      keyboardType: label == "Email" ? TextInputType.emailAddress : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.white70,
          ),
          onPressed: onToggle,
        )
            : null,
        filled: true,
        fillColor: const Color(0xFF2C2C3A).withOpacity(0.8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}