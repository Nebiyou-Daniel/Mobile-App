import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/auth/bloc/auth_bloc.dart';
import 'package:frontend/auth/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../Custom_Widgets/header_banner.dart';
import '../../auth/bloc/auth_event.dart';
import '../../custom_widgets/login_field_form.dart';
import 'loading.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: SingleChildScrollView(
                    child: Column(children: <Widget>[
              const HeaderBanner(),
              Container(
                padding: const EdgeInsets.all(39.5),
                child: const LoginWidget(),
              ),
              Container(
                  padding: const EdgeInsets.all(39.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          context.go("/signup");
                        },
                        child: const Text("Sign Up"),
                      )
                    ],
                  ))
            ])))));
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    final state = bloc.state;

    if (state is AuthInitial) {
      return const LoginFormField();
    }
    if (state is AuthLoggingIn) {
      return const LoadingScreen();
    }
    if (state is AuthLoginSuccess) {
      if (state.user.role == "admin") {
        context.go("/admin/homePage");
        // return const Text("Admin login Success");
      } else if (state.user.role == "trainer") {
        context.go("/trainer/homePage");
        // return const Text("Trainer login Success");
      } else if (state.user.role == "trainee") {
        context.go("/trainee/homePage");
        // return const Text("Trainee login Success");
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

    // bloc.add(AuthInitialEvent());
    return const Text("Login Failed");
  }
}
