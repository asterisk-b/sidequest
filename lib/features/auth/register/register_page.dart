import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';
import 'package:sidequest/features/auth/register/bloc/register/register_cubit.dart';
import 'package:sidequest/injection.dart';
import 'package:sidequest/repositories/auth_repository.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(gt<AuthRepository>()),
      child: BrandScaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => context.go('/auth/login'),
              style: TextButton.styleFrom(
                minimumSize: const Size(
                  double.minPositive,
                  double.minPositive,
                ),
              ),
              child: const Text('Sign In'),
            ),
          ),
        ),
        child: _RegisterForm(),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  _RegisterForm();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == UIStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Registration failed'),
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
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text('Fill-in your information to continue.'),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                FormBuilderTextField(
                  key: const Key('registerForm_nameInput_textField'),
                  name: 'full_name',
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(LineIcons.user),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Please enter your full name',
                    ),
                    FormBuilderValidators.min(
                      4,
                      errorText: 'At least 4 characters long',
                    ),
                  ]),
                ),
                const SizedBox(height: 25),
                FormBuilderTextField(
                  key: const Key('registerForm_emailInput_textField'),
                  name: 'email',
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(LineIcons.envelope),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Enter your email address',
                    ),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 25),
                FormBuilderTextField(
                  key: const Key('registerForm_passwordInput_textField'),
                  name: 'password',
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(LineIcons.lock),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Please enter your password',
                    ),
                    FormBuilderValidators.minLength(
                      6,
                      errorText: 'Password must be at least 6 characters long',
                    )
                  ]),
                ),
                const SizedBox(height: 25),
                FormBuilderTextField(
                  key: const Key('registerForm_confirmPasswordInput_textField'),
                  name: 'confirm_password',
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(LineIcons.lock),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Please confirm your password',
                    ),
                    (value) {
                      final current = _formKey.currentState?.fields['password'];

                      if (current?.value != value) {
                        return 'Passwords did not matched.';
                      }

                      return null;
                    }
                  ]),
                ),
                const SizedBox(height: 30),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    final isLoading = state.status == UIStatus.loading;

                    return ElevatedButton(
                      key: const Key('registerForm_submit_raisedButton'),
                      onPressed: isLoading
                          ? null
                          : () {
                              final valid =
                                  _formKey.currentState?.saveAndValidate();
                              final values = _formKey.currentState?.value;

                              if ((valid ?? false) && values != null) {
                                context
                                    .read<RegisterCubit>()
                                    .registerWithEmailAndPassword(values);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 45),
                      ),
                      // icon: const CircularProgressIndicator(strokeWidth: 3),
                      child: isLoading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 3))
                          : const Text("SIGN UP"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
