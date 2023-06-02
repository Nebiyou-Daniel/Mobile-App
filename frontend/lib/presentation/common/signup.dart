import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/custom_widgets/header_banner.dart';
import 'package:frontend/presentation/custom_widgets/signup_field_form.dart';
import 'package:go_router/go_router.dart';
import '../../application/Theme/theme.dart';
import '../../application/auth/bloc/auth_bloc.dart';
import '../../application/auth/bloc/auth_event.dart';
import '../../application/auth/bloc/auth_state.dart';
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

class SignupHandler extends StatefulWidget {
  const SignupHandler({super.key});
  static const signUpFieldForm = SignUpFieldForm();
  void navigateToPage(BuildContext context, String route) {
    context.go(route);
  }

  @override
  State<SignupHandler> createState() => _SignupHandlerState();
}

class _SignupHandlerState extends State<SignupHandler> {
  static const signUpFieldForm = SignUpFieldForm();

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    final state = bloc.state;
    print(state);

    if (state is AuthInitial) {
      return signUpFieldForm;
    }
    if (state is AuthSigningUp) {
      return const LoadingScreen();
    }

    if (state is AuthSignupSuccess) {
      if (state.role == "admin") {
        print("onto admin page");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateToPage(context, "/admin/homePage");
        });
        // context.go("/admin/homePage");
        return const SizedBox();
      } else if (state.role == "trainer") {
        print("onto trainer page");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateToPage(context, "/trainer/homePage");
        });
        return const SizedBox();
      } else if (state.role == "trainee") {
        print("onto trainee page");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateToPage(context, "/trainee/homePage");
        });
        return const SizedBox();
      }
    }

    if (state is AuthSignupError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(
          content: Text(state.error),
          backgroundColor: Colors.red,
          // show on top of the screen
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return signUpFieldForm;
  }

  void navigateToPage(BuildContext context, String s) {
    context.go(s);
  }
}
