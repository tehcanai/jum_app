import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jum_app/components/form_field.dart';
import 'package:jum_app/components/password_field.dart';
import 'package:jum_app/components/snackbars.dart';
import 'package:jum_app/components/submit_button.dart';
import 'package:jum_app/components/text_button.dart';
import 'package:jum_app/controllers/auth.dart';
import 'package:jum_app/controllers/user.dart';
import 'package:jum_app/utils/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final auth = Get.find<AuthController>();

  String? _email;
  String? _password;
  String? _confirmPassword;
  bool? isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Text('Create an account',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 10),
                    Text('Sign up for an account @ jum!',
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 20),
                    InputField(
                      'Email *',
                      validator: Validators.email,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      'Password *',
                      validator: Validators.password,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      'Confirm password *',
                      validator: Validators.password,
                      onChanged: (value) {
                        setState(() {
                          _confirmPassword = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SubmitButton(
                        text: 'Sign up',
                        isLoading: isLoading!,
                        function: () async {
                          if (!_formKey.currentState!.validate()) return;

                          if (_password != _confirmPassword) {
                            AppSnackBar.std(
                                'Try again', 'Passwords do not match!');
                            return;
                          }

                          try {
                            setState(() {
                              isLoading = true;
                            });

                            var response =
                                await auth.register(_email!, _password!);
                            if (response['success']) {
                              UserController user = Get.put(UserController());

                              user.credential = response['user'];
                              Get.offAllNamed('/home');
                            } else {
                              AppSnackBar.std(
                                  'Unable to Sign up', response['error']);
                              setState(() {
                                isLoading = false;
                              });
                              return;
                            }
                          } catch (e) {
                            AppSnackBar.std(
                                'Try again', 'Please check your connection');
                            setState(() {
                              isLoading = false;
                            });
                            return;
                          }
                        }),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    TextStyleButton(
                        text: "Already have an account?",
                        function: () {
                          Get.toNamed('/login');
                        }),
                  ],
                ),
              )),
        ));
  }
}
