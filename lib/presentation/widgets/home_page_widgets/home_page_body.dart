import 'package:dn_app/application/login/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatelessWidget {

  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email = FirebaseAuth.instance.currentUser?.email;
    print(FirebaseAuth.instance.currentUser);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                'Welcome \n $email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 20,
                      child: const Center(
                        child: Text('Logout'),
                      )),
                  disabledColor: Colors.blueAccent.withOpacity(0.6),
                  color: Colors.blueAccent,
                  onPressed: () => context.read<LoginCubit>().signOut()),
            ]));
      },
    );
  }
}
