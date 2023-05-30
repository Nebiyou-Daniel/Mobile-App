import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/auth/bloc/auth_event.dart';
import 'package:frontend/auth/bloc/auth_state.dart';

import '../auth/bloc/auth_bloc.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({super.key});

  @override
  LoginFormFieldState createState() => LoginFormFieldState();
}

class LoginFormFieldState extends State<LoginFormField> {
  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail() {
    if (_emailController.text.isEmpty) {
      return 'Please enter your email';
    }
    // You can add more validation logic for the email format if needed
    return null;
  }

  String? _validatePassword() {
    if (_passwordController.text.isEmpty) {
      return 'Please enter your password';
    }
    // You can add more validation logic for the password if needed
    return null;
  }

  void _submitForm() {
    if (_loginformKey.currentState!.validate()) {
      final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);

      bloc.add(AuthLoginEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginformKey,
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.info),
                  ),
              
                  Expanded(
                    child: Text(
                      "Fill the following information to Login.",
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  return _validateEmail();
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  return _validatePassword();
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _submitForm(),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
