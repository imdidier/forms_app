import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/widgets/widgets.dart';

import '../blocs/register/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            _RegisterForm(),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      // key: formKey,
      child: Column(
        children: [
          const FlutterLogo(size: 150),
          CustomTextFormField(
            label: 'User name',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,

            // onChanged: (value) {
            //registerCubit.usernameChanged(value);
            // formKey.currentState!.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo reuerido';
            //   if (value.isEmpty) return 'Campo requerido';
            //   if (value.trim().length <= 6) return 'Más de seis letras';
            //   return null;
            // },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            label: 'Email',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
            // onChanged: (value) {
            //   registerCubit.emailChanged(value);
            //   formKey.currentState!.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.isEmpty) return 'Campo requerido';
            //   final emailRegExp = RegExp(
            //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            //   );
            //   if (!emailRegExp.hasMatch(value)) return 'No es un correo válido';
            //   return null;
            // },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
            // onChanged: (value) {
            //   registerCubit.passwordChanged(value);
            //    formKey.currentState!.validate();
            // },
            // validator: (value) {
            //   if (value == null || value.isEmpty) return 'Campo requerido';
            //   if (value.isEmpty) return 'Campo requerido';
            //   if (value.trim().length <= 6) return 'Más de seis letras';
            //   return null;
            // },
          ),
          const SizedBox(height: 15),
          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = formKey.currentState!.validate();
              // if (!isValid) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save_outlined),
            label: const Text('Create user'),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
