import 'package:dn_app/application/login/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Text('Forgot Password?'),
        disabledColor: Colors.blueAccent.withOpacity(0.6),
        color: Colors.blueAccent,
        onPressed: () {
          context.read<LoginCubit>().resetPassword();
        },
      ),
    );
  }
}
