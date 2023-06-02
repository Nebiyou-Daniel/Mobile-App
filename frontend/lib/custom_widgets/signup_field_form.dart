import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/auth/bloc/auth_bloc.dart';
import '../auth/bloc/auth_event.dart';

class SignUpFieldForm extends StatefulWidget {
  const SignUpFieldForm({Key? key}) : super(key: key);

  @override
  SignUpFieldFormState createState() => SignUpFieldFormState();
}

class SignUpFieldFormState extends State<SignUpFieldForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String roleSelection = 'trainer';

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }
  

  String? _validateEmail() {
    if (_emailController.text.isEmpty) {
      return 'Please enter your email';
    }
    // You can add more validation logic for the email format if needed
    return null;
  }

  String? _validateFullName() {
    if (_fullNameController.text.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validatePassword() {
    if (_passwordController.text.isEmpty) {
      return 'Please enter your password';
    }
    // You can add more validation logic for the password if needed
    return null;
  }

  String? _validateConfirmPassword() {
    if (_passwordController.text.isEmpty) {
      return 'Please confirm your password';
    }

    if (_confirmPasswordController.text != _passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
  }

  void _submitForm() {
    // just add only to the bloc
    final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);

    if (_formKey.currentState!.validate()) {
      bloc.add(
        AuthSignUpEvent(
            name: _fullNameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            role: roleSelection,
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Material(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.info),
                    ),
                    Expanded(
                      child: Text(
                        "Fill the following information to Signup.",
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  return _validateEmail();
                },
              ),
              Container(margin: const EdgeInsets.only(top: 20.0)),

              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_rounded),
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                ),
                validator: (value) {
                  return _validateFullName();
                },
              ),

              Container(margin: const EdgeInsets.only(top: 20.0)),

              Container(margin: const EdgeInsets.only(top: 20.0)),

              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                obscureText: true,
                validator: (value) => _validatePassword(),
              ),

              Container(margin: const EdgeInsets.only(top: 20.0)),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                ),
                obscureText: true,
                validator: (value) => _validateConfirmPassword(),
              ),

              Container(margin: const EdgeInsets.only(top: 40.0)),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 21),
                      child: Icon(Icons.info),
                    ),
                    Text("Select your role"),
                  ],
                ),
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
                  items: <String>['trainee', 'trainer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value.toUpperCase()),
                    );
                  }).toList(),
                ),
              ),

              Container(margin: const EdgeInsets.only(top: 20.0)),
              SizedBox(
                width: 300,
                height: 38,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Create Account'),
                ),
              ),

              Container(margin: const EdgeInsets.only(top: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
