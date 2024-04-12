import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';
import 'package:sidequest/features/auth/bloc/login/login_cubit.dart';
import 'package:sidequest/injection.dart';
import 'package:sidequest/repositories/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(gt<AuthRepository>()),
      child: BrandScaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go('/auth/register'),
              style: TextButton.styleFrom(
                minimumSize: const Size(
                  double.minPositive,
                  double.minPositive,
                ),
              ),
              child: const Text('Sign Up'),
            ),
          ),
        ),
        child: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication failed'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text('Enter your credentials to continue.'),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                FormBuilderTextField(
                  key: const Key('loginForm_emailInput_textField'),
                  name: 'email',
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    prefixIconConstraints: BoxConstraints(maxHeight: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(LineIcons.envelope),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  key: const Key('loginForm_passwordInput_textField'),
                  name: 'password',
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIconConstraints: BoxConstraints(maxHeight: 20),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(LineIcons.lock),
                    ),
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 30),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    final isLoading = state.status.isInProgress;

                    return ElevatedButton(
                      key: const Key('loginForm_submit_raisedButton'),
                      onPressed: isLoading
                          ? null
                          : () {
                              final valid =
                                  _formKey.currentState?.saveAndValidate();
                              final values = _formKey.currentState?.value;

                              if ((valid ?? false) && values != null) {
                                context
                                    .read<LoginCubit>()
                                    .logInWithEmailAndPassword(values);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 45),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 3))
                          : const Text("SIGN IN"),
                    );
                  },
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () => context.push('/auth/forgot-password'),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(
                      double.minPositive,
                      double.minPositive,
                    ),
                  ),
                  child: const Text('Forgot password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
