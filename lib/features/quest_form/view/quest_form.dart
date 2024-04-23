import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/constants.dart';
import 'package:sidequest/core/models/formatters/input.dart';
import 'package:sidequest/core/models/mngr_system.dart';
import 'package:sidequest/core/widgets/separated_column.dart';
import 'package:sidequest/features/quest_form/bloc/quest_form_cubit.dart';

class QuestForm extends StatelessWidget {
  const QuestForm({
    super.key,
    required this.formKey,
    required this.manager,
  });

  final GlobalKey<FormBuilderState> formKey;
  final SystemManager manager;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      onChanged: () {
        final value = formKey.currentState?.instantValue;
        context.read<QuestFormCubit>().setValues(value);
      },
      child: SeparatedColumn(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        mainAxisSize: MainAxisSize.min,
        separatorBuilder: (_, index) {
          return const SizedBox(height: kFormVerticalSpacing);
        },
        children: [
          FormBuilderTextField(
            name: 'title',
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Write me a poem...',
              helperText: 'A simple description about your quest.',
              prefixIcon: Icon(LineIcons.marker),
            ),
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'description',
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Description',
              helperText:
                  'Detailed information about your quest. What are the things that need to be done.',
              prefixIcon: Icon(LineIcons.clipboardList),
            ),
            validator: FormBuilderValidators.required(),
          ),
          FormBuilderTextField(
            name: 'level_required',
            maxLength: 3,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: 'Level Required',
              counter: const Offstage(),
              hintText: 'Max level ${manager.level.levelCap}',
              helperText: 'Minimum level needed to participate in this quest.',
              prefixIcon: const Icon(LineIcons.sortAmountUp),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.max(manager.level.levelCap),
            ]),
          ),
          FormBuilderTextField(
            name: 'max_questors',
            maxLength: 3,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              labelText: 'Max Questors',
              counter: Offstage(),
              hintText: 'Can accommodate up to 10 participants',
              helperText: 'Number of people who can participate in this quest.',
              prefixIcon: Icon(LineIcons.users),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.max(10),
            ]),
          ),
          FormBuilderTextField(
            name: 'currency_reward',
            maxLength: 10,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [DecimalTextInputFormatter(decimalDigits: 2)],
            decoration: const InputDecoration(
              labelText: 'Reward',
              counter: Offstage(),
              helperText:
                  'Price to be paid for each individual who successfully completes the quest.',
              prefixIcon: Icon(LineIcons.coins),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.min(1),
            ]),
          ),
        ],
      ),
    );
  }
}
