import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth.dart';

class LoginFormField extends StatefulWidget {
  const LoginFormField({super.key});

  @override
  LoginFormFieldState createState() => LoginFormFieldState();
}

class LoginFormFieldState extends State<LoginFormField> {
  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String roleSelection = 'trainer';

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
    return null;
  }

  String? _validatePassword() {
    if (_passwordController.text.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  void _submitForm() {
    if (_loginformKey.currentState!.validate()) {
      final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);

      bloc.add(AuthLoginEvent(
        email: _emailController.text,
        password: _passwordController.text,
        role: roleSelection,
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

              // password input
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

              // Role selection dropdown
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: DropdownButton<String>(
                  value: roleSelection,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      roleSelection = newValue!;
                    });
                  },
                  // I removed the admin from the signup roles
                  // only trainer and trainee roles are allowed to signup now
                  items: <String>['trainee', 'trainer', 'admin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toUpperCase()),
                    );
                  }).toList(),
                ),
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
