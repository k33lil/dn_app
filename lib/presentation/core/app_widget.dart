import 'package:dn_app/application/auth/auth_cubit.dart';
import 'package:dn_app/presentation/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: BlocProvider(
          lazy: false,
          create: (_) => AuthCubit(),
          child: const LandingPage(),
        ));
  }
}
