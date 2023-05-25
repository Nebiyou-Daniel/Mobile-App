import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Custom_Widgets/header_banner.dart';
import 'package:frontend/Custom_Widgets/signup_field_form.dart';
import 'package:go_router/go_router.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_event.dart';
import '../../auth/bloc/auth_state.dart';
import 'loading.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: <Widget>[
          const HeaderBanner(),
          Container(
            padding: const EdgeInsets.all(39.5),
            child: const SignupHandler(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    context.go("/login");
                  },
                  child: const Text('Login'))
            ],
          )
        ]))));
  }
}

class SignupHandler extends StatelessWidget {
  const SignupHandler({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    final state = bloc.state;

    if (state is AuthInitial) {
      return const SignUpFieldForm();
    }
    if (state is AuthSigningUp) {
      return const LoadingScreen();
    }

    if (state is AuthSignupSuccess) {
      if (state.user.role == "trainer") {
        context.go("/trainer/homePage");
        // return const Text("Trainer Signup Success");
      } else if (state.user.role == "trainee") {
        context.go("/trainee/homePage");
        // return const Text("Trainee Signup Success");
      }
    }

    if (state is AuthSignupError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(
          content: Text(state.error),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return const SignUpFieldForm();
  }
}
