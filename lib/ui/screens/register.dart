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
    return Form(
      child: Column(
        children: [
          const FlutterLogo(size: 150),
          const CustomTextFormField(
            label: 'User name',
          ),
          const SizedBox(height: 15),
          const CustomTextFormField(
            label: 'Email',
          ),
          const SizedBox(height: 15),
          const CustomTextFormField(
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 15),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined),
            label: const Text('Create user'),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
