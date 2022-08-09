import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/widgets/button_with_loader.dart';
import '../../core/widgets/custom_text_form_field.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  final LoginController loginController;

  const LoginPage({Key? key, required this.loginController}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = (MediaQuery.of(context).size.height / 2) * .60;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [context.primaryColor, Colors.white],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
/*
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 100),
              child: Center(
                child: Image.asset(
                  '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
*/
            Padding(
              padding: EdgeInsets.fromLTRB(20, _height, 20, 20),
              child: Container(
                height: MediaQuery.of(context).size.height * .45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        inputUserName(),
                        const SizedBox(height: 7),
                        inputPassword(),
                        const SizedBox(height: 12),
                        buttonForgotPassword(),
                        const SizedBox(height: 20),
                        buttonLogin(),
                        const SizedBox(height: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "MasterBusiness @${DateTime.now().year}",
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputUserName() {
    return CustomTextFormField(
      hint: 'Email',
      controller: _emailEC,
    );
  }

  Widget inputPassword() {
    return CustomTextFormField(
      hint: 'Password',
      controller: _passwordEC,
      obscureText: true,
    );
  }

  Widget buttonForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget buttonLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ButtonWithLoader<LoginController, LoginState>(
        bloc: widget.loginController,
        selector: (state) => state == LoginStatus.loading,
        onPressed: () async {
          final formValid = _formKey.currentState?.validate() ?? false;

          if (formValid) {
            Modular.to.pushReplacementNamed('/home');
          }
        },
        label: 'LOGIN',
      ),
    );
  }
}
