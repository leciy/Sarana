import 'package:flutter/material.dart';
import 'package:sarana/Style/color.dart';
import 'package:sarana/pages/forgot_password_page.dart';
import 'package:sarana/pages/register_page.dart';
import 'package:sarana/services/auth_services.dart';
import 'package:sarana/widget/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showError("Email dan password tidak boleh kosong.");
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await _authService.login(
        username: email,
        password: password,
      );

      print("📥 Login response: $result");

      if (result['fulfilled'] == 1) {
        final prefs = await SharedPreferences.getInstance();
        final token = result['data']?['token'];

        if (token != null) {
          await prefs.setString('token', token);
          print("✅ Token berhasil disimpan: $token");
        } else {
          print("⚠️ Token tidak ditemukan dalam 'data'.");
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
      } else {
        print("❌ Login gagal: fulfilled != 1. Pesan: ${result['messages']}");
        _showError(
            "Login gagal: ${result['messages'] ?? 'Periksa kembali data Anda.'}");
      }
    } catch (e) {
      _showError("Terjadi kesalahan: ${e.toString()}");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/intro_logo.png", width: 150, height: 150),
              const Text(
                "Let's Sign In.",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email Address",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          filled: true,
                          fillColor: Colors.grey[300],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off),
                            onPressed: _toggleVisibility,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorTheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _isLoading ? null : _handleLogin,
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white)
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Sign In",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white)),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_forward,
                                        color: Colors.white)
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        icon: Image.asset(
                          'assets/google_24.png',
                          height: 24,
                          width: 24,
                        ),
                        label: const Text(
                          'Login dengan Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        onPressed: () {
                          print('Google button pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Doesn't Have Account? ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage()),
                          );
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
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
