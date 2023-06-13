import 'package:flutter/material.dart';
import 'package:forms_app/ui/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User'),
      ),
      body: const _RegisterView(),
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

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String username = '';
    String email = '';
    String password = '';
    return Form(
      key: formKey,
      child: Column(
        children: [
          const FlutterLogo(size: 150),
          CustomTextFormField(
            label: 'User name',
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.isEmpty) return 'Campo requerido';
              if (value.trim().length <= 6) return 'Más de seis letras';
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Campo requerido';
              if (value.isEmpty) return 'Campo requerido';
              if (value.trim().length <= 6) return 'Más de seis letras';
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: (value) => password = value,
          ),
          const SizedBox(height: 15),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = formKey.currentState!.validate();
              if (!isValid) return;
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
