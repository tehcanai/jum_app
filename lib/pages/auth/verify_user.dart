import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jum_app/components/form_field.dart';
import 'package:jum_app/components/submit_button.dart';
import 'package:jum_app/components/text_button.dart';
import 'package:jum_app/utils/validators.dart';

class VerifyUserPage extends StatefulWidget {
  const VerifyUserPage({super.key});

  @override
  State<VerifyUserPage> createState() => _VerifyUserPageState();
}

class _VerifyUserPageState extends State<VerifyUserPage> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? phone;
  bool? isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    phone = '+60';
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
                    Text('Sign up for Jum!',
                        style: Theme.of(context).textTheme.displayLarge),
                    const SizedBox(height: 20),
                    InputField(
                      'Email *',
                      validator: Validators.email,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      'Phone *',
                      value: phone,
                      validator: Validators.phone,
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SubmitButton(
                        text: 'Send',
                        function: () {
                          if (!_formKey.currentState!.validate()) return;
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
