import 'package:fit_master/src/component/primary_button.dart';
import 'package:fit_master/src/features/login/viewmodel/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Consumer<SignUpViewmodel>(builder: (_, model, child) {
      if (model.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(LucideIcons.chevron_left),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.goNamed('welcome');
              }
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 164 / 2,
                      height: 164 / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/logo/fitmaster_logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign Up",
                          style: textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username", style: textTheme.bodyLarge),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: "e.g. username123",
                                  hintStyle: textTheme.bodyLarge?.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text("Email", style: textTheme.bodyLarge),
                          //     const SizedBox(height: 8),
                          //     TextFormField(
                          //       controller: _usernameController,
                          //       decoration: InputDecoration(
                          //         hintText: "e.g. example@gmail.com",
                          //         hintStyle: textTheme.bodyLarge?.copyWith(
                          //           color:
                          //               colorScheme.onSurface.withOpacity(0.5),
                          //         ),
                          //         border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(12),
                          //         ),
                          //       ),
                          //       validator: (value) {
                          //         if (value == null || value.isEmpty) {
                          //           return 'Please enter your username';
                          //         }
                          //         return null;
                          //       },
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password", style: textTheme.bodyLarge),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "*******",
                                  hintStyle: textTheme.bodyLarge?.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Re-enter Password",
                                  style: textTheme.bodyLarge),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _rePasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "*******",
                                  hintStyle: textTheme.bodyLarge?.copyWith(
                                    color:
                                        colorScheme.onSurface.withOpacity(0.5),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter same with your password';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  PrimaryButton(
                    label: "Sign up",
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? true) {}
                      if (_passwordController.text !=
                          _rePasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Password and Re-enter Password must be the same'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        return;
                      } else {
                        model.signUp(
                          _usernameController.text,
                          _passwordController.text,
                          context,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
