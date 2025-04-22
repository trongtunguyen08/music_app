import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/core/theme/app_pallete.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/core/widgets/loader_widget.dart';
import 'package:music_app/features/auth/view/pages/signup_page.dart';
import 'package:music_app/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:music_app/features/auth/view/widgets/custom_text_field.dart';
import 'package:music_app/features/auth/view_model/auth_view_model.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController(
    text: "trongtunguyen08@icloud.com",
  );
  final passwordController = TextEditingController(text: "1234@Tps");
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authViewModelProvider, (_, next) {
      next?.when(
        data: (data) {},
        error: (error, _) {
          showSnackbar(context, error.toString());
        },
        loading: () {
          return const LoaderWidget();
        },
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              CustomTextField(
                placeholderText: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 15.0),
              CustomTextField(
                placeholderText: "Password",
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20.0),
              AuthGradientButton(
                buttonText: "Login",
                onButtonPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await ref
                        .read(authViewModelProvider.notifier)
                        .loginUser(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                },
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupPage();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.titleMedium,
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
