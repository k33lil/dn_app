import 'package:dn_app/application/login/login_cubit.dart';
import 'package:dn_app/presentation/widgets/sign_in_page_widgets/constant_texts.dart';
import 'package:dn_app/presentation/widgets/sign_in_page_widgets/forgot_password.dart';
import 'package:dn_app/presentation/widgets/sign_in_page_widgets/login_with_email_buttons.dart';
import 'package:dn_app/presentation/widgets/sign_in_page_widgets/sign_in_page_input_fields.dart';
import 'package:dn_app/presentation/widgets/sign_in_page_widgets/social_sign_in_buttons.dart';
import 'package:dn_app/presentation/widgets/snackbar_widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../widgets/auth_custom_paint.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (p, c) => p.status != c.status,
            listener: (context, state) {
              if (state.status.isSubmissionFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(snackBarWhenFailure(snackBarFailureText: state.exceptionError));
              } else if (state.status.isSubmissionSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarWhenSuccess());
              }
            },
            builder: (context, state) => Stack(children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(38.0, 0, 38.0, 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * .25,
                              child: CustomPaint(
                                size: Size.infinite,
                                foregroundPainter: AuthCustomPaint(color: Colors.blueAccent),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const LoginText(),
                            const SizedBox(height: 20),
                            EmailInputField(state: state),
                            PasswordInputField(state: state),
                            const SizedBox(height: 20),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Login(),
                                  const SizedBox(height: 10),
                                  SignUpButton(),
                                  ForgotPassword(),
                                ]),
                            const SizedBox(height: 20),
                            Column(children: const [
                              SeperatedText(),
                              SignInWithGoogle(),
                            ])
                          ]),
                    ),
                  ),
                  state.status.isSubmissionInProgress
                      ? const Positioned(
                          child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container()
                ])));
  }
}
