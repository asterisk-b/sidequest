import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sidequest/core/widgets/brand_card.dart';
import 'package:sidequest/core/widgets/brand_scaffold.dart';
import 'package:sidequest/core/widgets/form_controls.dart';
import 'package:sidequest/core/widgets/separated_column.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BrandScaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: SeparatedColumn(
                separatorBuilder: (_, index) => const SizedBox(height: 30),
                children: [
                  const CircleAvatar(radius: 60),
                  TextFormField(
                    enabled: false,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      prefix: Text('@'),
                      prefixIcon: Icon(LineIcons.userLock, size: 18),
                      helperText: 'Modified on 01/22/1994',
                      label: Text('Username'),
                    ),
                    initialValue: 'asterisk',
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 100,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(LineIcons.user, size: 18),
                      labelText: 'Full Name',
                      helperText: 'Your birth-given name.',
                    ),
                    initialValue: 'Sample Name',
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: null,
                    maxLength: 3000,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(LineIcons.alignLeft, size: 18),
                      labelText: 'Bio',
                      helperText: 'Write a simple description about yourself.',
                    ),
                  ),
                  BrandCard(
                    padding: const EdgeInsets.all(15),
                    child: SeparatedColumn(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (_, index) => const SizedBox(height: 7),
                      children: const [
                        Text(
                          'Note',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox.shrink(),
                        Text('1. Username can be changed only once.'),
                        Text(
                            '2. Your full name should be your birth-given name.'),
                        Text(
                            '3. Username should comply with applicable laws and regulations and respect others. If found violating the rules above, We will modify it or even mute or block the account.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          FormControls(
            loading: false,
            submitLabel: 'SAVE',
            onReset: () {},
            onSubmit: () {
              // final valid = _formKey.currentState?.saveAndValidate();
              // final values = _formKey.currentState?.value;
              //
              // debugPrint(values.toString());
              //
              // if ((valid ?? false) && values != null) {
              //   context
              //       .read<LoginCubit>()
              //       .logInWithEmailAndPassword(values);
              // }
            },
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     ElevatedButton(onPressed: () {}, child: const Text('Reset')),
          //     ElevatedButton(onPressed: () {}, child: const Text('Save')),
          //   ],
          // )
        ],
      ),
    );
  }
}
