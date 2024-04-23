import 'package:flutter/material.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      appBar: AppBar(),
      child: const Center(child: Text("Forgot")),
    );
  }
}
