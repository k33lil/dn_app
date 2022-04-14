import 'package:dn_app/application/login/login_cubit.dart';
import 'package:dn_app/presentation/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Text('Login'),
        disabledColor: Colors.blueAccent.withOpacity(0.6),
        color: Colors.blueAccent,
        onPressed: () => {
          context.read<LoginCubit>().logInWithCredentials()
        },
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Text('Sign Up'),
        disabledColor: Colors.blueAccent.withOpacity(0.6),
        color: Colors.blueAccent,
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPage()),
          )
        },
      ),
    );
  }
}
