import 'package:flutter/material.dart';

import 'package:appsize/appsize.dart';
import 'package:flutter_challenge/services/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:flutter_challenge/providers/providers.dart';
import 'package:flutter_challenge/theme/theme.dart';
import 'package:flutter_challenge/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const name = 'login';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardContainer(
                  Column(
                    children: [
                      Text(
                        'Bienvenido',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 20.sp),
                      ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: const LoginForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final productsService = Provider.of<ProductsService>(context);

    return Form(
      // TODO: fijar tamaño on error
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'usuario',
            label: 'Usuario',
            keyboardType: TextInputType.text,
            onChanged: (value) => loginForm.user = value,
            height: 50.sp,
            width: 230.sp,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su usuario';
              }
              return null;
            },
            icon: Icon(
              Icons.person,
              size: 22.sp,
              color: myThemeLight.primaryColor,
            ),
          ),
          SizedBox(height: 20.sp),
          CustomTextField(
            hint: '********',
            label: 'Contraseña',
            keyboardType: TextInputType.visiblePassword,
            obscure: true,
            onChanged: (value) => loginForm.password = value,
            height: 50.sp,
            width: 230.sp,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese su contraseña';
              }
              return null;
            },
            icon: Icon(
              Icons.lock,
              size: 20.sp,
              color: myThemeLight.primaryColor,
            ),
          ),
          SizedBox(height: 30.sp),
          CustomButton(
            text: loginForm.isLoading ? 'Espere...' : 'Ingresar',
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    // TODO: manejar login
                    FocusScope.of(context).requestFocus(FocusNode());
                    final bool login = await productsService.loginUser(
                      loginForm.user,
                      loginForm.password,
                    );

                    if (!loginForm.isValidForm() || !login) return;
                    loginForm.isLoading = true;

                    // ignore: use_build_context_synchronously
                    if (!context.mounted) return;
                    context.pushReplacementNamed('home');
                  },
          ),
        ],
      ),
    );
  }
}
