import 'package:app_mcip/app/core/ui/theme_extension.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';

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

  var _idSelected = 0;
  var _empresaSelected = '';

  @override
  void initState() {
    widget.loginController.getCustomers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = (MediaQuery.of(context).size.height / 2) * .60;

    return BlocListener<LoginController, LoginState>(
      bloc: widget.loginController,
      listener: (context, state) {
        // Logged
        if (state is LoginStateLoginChecked) {
          Modular.to.pushReplacementNamed('/home');
        }
        // Access Invalid
        if (state is LoginStateError) {
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              confirmBtnText: 'OK',
              text: 'Usuário/Senha Inválidos! Tente Novamente');
        }
        // Access Not Permited
        if (state is LoginStateUserInvalid) {
          QuickAlert.show(
              context: context,
              confirmBtnText: 'OK',
              type: QuickAlertType.error,
              text: 'Acesso Não Permitido! Contacte o Administrador');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.primaryColor,
                      context.primaryColorLight.withOpacity(.5)
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, _height, 20, 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * .50,
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
                        const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          BlocBuilder<LoginController, LoginState>(
                              bloc: widget.loginController,
                              builder: (context, state) {
                                if (state is LoginStateLoaded) {
                                  return DropdownSearch<String>(
                                    popupProps: const PopupProps.menu(
                                      fit: FlexFit.tight,
                                      menuProps: MenuProps(
                                        elevation: 5,
                                      ),
                                      showSelectedItems: true,
                                    ),
                                    onChanged: (value) {
                                      if (value != null) {
                                        final c = value.split('-');

                                        _idSelected = int.tryParse(c[0]) ?? 0;
                                        _empresaSelected = c[1];
                                      }
                                    },
                                    items: state.listCustomer
                                        .map((e) => e.id + '-' + e.razaoSocial)
                                        .toList(),
                                  );
                                }
                                return DropdownSearch<String>();
                              }),
                          const SizedBox(height: 7),
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
                              "Master Business @${DateTime.now().year}",
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
      ),
    );
  }

  Widget inputUserName() {
    return CustomTextFormField(
      hint: 'Usuário',
      controller: _emailEC,
    );
  }

  Widget inputPassword() {
    return CustomTextFormField(
      hint: 'Senha',
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
          'Esqueceu a Senha?',
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
            await widget.loginController.signIn(
                _emailEC.text, _passwordEC.text, _idSelected.toString());
          }
        },
        label: 'LOGIN',
      ),
    );
  }
}
