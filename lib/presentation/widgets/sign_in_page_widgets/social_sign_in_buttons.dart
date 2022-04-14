import 'package:dn_app/application/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SignInButton(Buttons.Google, onPressed: () => context.read<LoginCubit>().signInWithGoogle()));
  }
}
