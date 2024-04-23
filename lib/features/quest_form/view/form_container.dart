import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sidequest/core/models/mngr_system.dart';
import 'package:sidequest/core/widgets/form_controls.dart';
import 'package:sidequest/features/quest_form/view/quest_form.dart';
import 'package:sidequest/features/quest_form/view/quest_form_details.dart';
import 'package:sidequest/features/quest_form/view/quest_payment_details.dart';

class QuestFormContainer extends StatelessWidget {
  QuestFormContainer({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final SystemManager manager = SystemManager.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                QuestForm(formKey: _formKey, manager: manager),
                const Divider(height: 0),
                QuestFormDetails(formKey: _formKey, manager: manager),
                const Divider(height: 0),
                const QuestPaymentDetails(),
              ],
            ),
          ),
        ),
        FormControls(
          loading: false,
          submitLabel: 'SAVE',
          onSubmit: () {
            final valid = _formKey.currentState?.saveAndValidate();
            final values = _formKey.currentState?.value;

            debugPrint(values.toString());

            if ((valid ?? false) && values != null) {
              // context
              //     .read<LoginCubit>()
              //     .logInWithEmailAndPassword(values);
            }
          },
        ),
      ],
    );
  }
}
