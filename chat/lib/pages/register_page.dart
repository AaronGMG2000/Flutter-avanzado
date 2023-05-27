import 'package:chat/pages/login_page.dart';
import 'package:chat/widgets/index.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = 'RegisterPage';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(text: 'Registro'),
                  _Form(),
                  Labels(
                    routeName: LoginPage.routeName,
                    question: '¿Ya tienes una cuenta?',
                    textButton: 'Ingresa ahora',
                  ),
                  Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200))
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          InputText(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.name,
            textController: _nameController,
          ),
          InputText(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: _emailController,
          ),
          InputText(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.text,
            textController: _passwordController,
            isPassword: true,
          ),
          CustomButton(onPressed: () {}, text: 'Registrarse'),
        ],
      ),
    );
  }
}
