import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Auth',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF7FF),
        fontFamily: 'Arial',
      ),
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// ==========================================================
// WIDGETS COMMUNS
// ==========================================================

class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final int maxLines;

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines > 1 ? 54 : 48,
      child: TextField(
        obscureText: obscureText,
        maxLines: obscureText ? 1 : maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFFB8B3B8),
            fontSize: 13,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: Color(0xFFAAA4AA),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
            borderSide: const BorderSide(
              color: Color(0xFFFF6845),
              width: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}

class OrangeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const OrangeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFFFF6845),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

Widget movieLogo() {
  return const Center(
    child: Text(
      '🎬',
      style: TextStyle(
        fontSize: 105,
      ),
    ),
  );
}

// ==========================================================
// SIGN IN
// ==========================================================

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                movieLogo(),

                const SizedBox(height: 30),

                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF282128),
                  ),
                ),

                const SizedBox(height: 18),

                const AppTextField(
                  hint: 'email',
                ),

                const SizedBox(height: 14),

                const AppTextField(
                  hint: 'password',
                  obscureText: true,
                ),

                const SizedBox(height: 28),

                OrangeButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/profile',
                    );
                  },
                ),

                const SizedBox(height: 10),

                OrangeButton(
                  text: 'CREATE AN ACCOUNT',
                  color: const Color(0xFFFF3B35),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/signup',
                    );
                  },
                ),

                const SizedBox(height: 28),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xFF393039),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFFF6845),
                      size: 22,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// SIGN UP
// ==========================================================

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),

                movieLogo(),

                const SizedBox(height: 25),

                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF282128),
                  ),
                ),

                const SizedBox(height: 18),

                const AppTextField(
                  hint: 'username',
                ),

                const SizedBox(height: 14),

                const AppTextField(
                  hint: 'email',
                ),

                const SizedBox(height: 14),

                const AppTextField(
                  hint: 'password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Already have an account ?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF393039),
                      ),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFFFF6845),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                OrangeButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      '/signin',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// PROFILE SETTINGS
// ==========================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                const SizedBox(height: 15),

                const Text(
                  'Profile settings',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF332B33),
                  ),
                ),

                const SizedBox(height: 55),

                // Avatar similaire à la capture
                Container(
                  width: 95,
                  height: 95,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFB052),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 75,
                    color: Color(0xFF7D4AA8),
                  ),
                ),

                const SizedBox(height: 48),

                const AppTextField(
                  hint: 'Current password',
                  obscureText: true,
                ),

                const SizedBox(height: 14),

                const AppTextField(
                  hint: 'New password',
                  obscureText: true,
                ),

                const SizedBox(height: 14),

                const AppTextField(
                  hint: 'Address',
                  maxLines: 2,
                ),

                const SizedBox(height: 20),

                OrangeButton(
                  text: 'SAVE',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile saved'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}