import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../auth/auth.dart';
import '../../custom_widgets/header_banner.dart';
import '../../custom_widgets/login_field_form.dart';
import 'loading.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                child: LoginHandler(),
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

class LoginHandler extends StatelessWidget {
  LoginHandler({super.key});
  final LocalDataProvider localDataProvider = LocalDataProvider();


  void navigateToPage(BuildContext context, String route) {
    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthBloc>();
    final state = bloc.state;
    print(state);

    if (state is AuthInitial) {
      return const LoginFormField();
    }
    if (state is AuthLoggingIn) {
      return const LoadingScreen();
    }
    if (state is AuthLoginSuccess) {
      if (state.role == "admin") {
        print("Navigating to admin home page");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateToPage(context, "/admin/homePage");
        });
        return const SizedBox();
      } else if (state.role == "trainer") {
        print("Navigating to trainer home page");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateToPage(context, "/trainer/homePage");
        });
        return const SizedBox();
      } else if (state.role == "trainee") {
        print("Navigating to trainee home page");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateToPage(context, "/trainee/homePage");
        });

        return const SizedBox();
      }
    }

    if (state is AuthLoginError) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final snackBar = SnackBar(
          content: Text(state.error),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      return const LoginFormField();
    }

    return const LoginFormField();
  }
    getLocalDataProvider() async {
    try {
      final token = await localDataProvider.getAccessToken();
      print('Access Token: $token');
      // Do something with the access token
    } catch (e) {
      print('Error: $e');
      // Handle the error
    }
  }
}
