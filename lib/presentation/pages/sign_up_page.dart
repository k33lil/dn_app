import 'package:dn_app/application/sign_up/sign_up_cubit.dart';
import 'package:dn_app/presentation/forms/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Sign Up'),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
      ),
      backgroundColor: Colors.blueGrey[100],
      body: BlocProvider(
        create: (_) => SignUpCubit(),
        child: const SignUpForm(),
      ),
    );
  }
}
