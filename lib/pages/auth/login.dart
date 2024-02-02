import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:jum_app/components/form_field.dart';
import 'package:jum_app/components/password_field.dart';
import 'package:jum_app/components/snackbars.dart';
import 'package:jum_app/components/submit_button.dart';
import 'package:jum_app/components/text_button.dart';
import 'package:jum_app/controllers/auth.dart';
import 'package:jum_app/controllers/user.dart';
import 'package:jum_app/utils/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = Get.find<AuthController>();

  final _formKey = GlobalKey<FormState>();
  bool? isLoading;

  String? _uid;
  String? _password;

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
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Text('Jum!',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 40)),
                      const SizedBox(height: 10),
                      Text('Sign in with your email or username',
                          style: Theme.of(context).textTheme.labelSmall),
                      const SizedBox(height: 20),
                      InputField(
                        'Email / Username',
                        validator: Validators.required,
                        onChanged: (value) {
                          _uid ??= '';
                          setState(() {
                            _uid = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      PasswordField(
                        'Password',
                        validator: Validators.required,
                        onChanged: (value) {
                          _password ??= '';
                          setState(() {
                            _password = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      SubmitButton(
                          text: 'Sign in',
                          isLoading: isLoading!,
                          function: () async {
                            if (!_formKey.currentState!.validate()) return;

                            setState(() {
                              isLoading = true;
                            });

                            try {
                              var response =
                                  await auth.login(_uid!, _password!);

                              if (response['success']) {
                                UserController user = Get.put(UserController());

                                user.credential = response['user'];
                                Get.offAllNamed('/home');
                              } else {
                                AppSnackBar.std(
                                    'Unable to Sign in', response['error']);
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              AppSnackBar.std(
                                  'Try again', 'Please check your connection.');
                            }
                          }),
                      const SizedBox(height: 20),
                      TextStyleButton(
                          text: "Don't have an account?",
                          function: () {
                            Get.offAllNamed('/register');
                          }),
                    ],
                  ),
                ),
              )),
        ));
  }
}
