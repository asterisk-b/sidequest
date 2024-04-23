import 'package:flutter/material.dart';

class FormControls extends StatelessWidget {
  const FormControls({
    super.key,
    required this.onSubmit,
    this.onReset,
    this.loading = false,
    this.submitLabel = 'SUBMIT',
    this.extra,
  });

  final VoidCallback? onReset;
  final VoidCallback onSubmit;
  final bool loading;
  final String submitLabel;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    final isSubmitOnly = onReset == null && extra == null;
    final extraAsLeading = onReset == null && extra != null;

    return Column(
      children: [
        const Divider(indent: 0, height: 0),
        SizedBox(
          height: 45,
          width: double.maxFinite,
          child: isSubmitOnly
              ? _getSubmitButton()
              : _getExtraWidget(context, extraAsLeading),
        ),
      ],
    );
  }

  Widget _getSubmitButton() {
    return ElevatedButton(
      onPressed: loading ? null : onSubmit,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.infinite,
        shape: const RoundedRectangleBorder(),
      ),
      child: loading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2.5))
          : Text(submitLabel),
    );
  }

  Widget _getExtraWidget(BuildContext context, bool extraAsLeading) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: extraAsLeading
              ? extra!
              : ElevatedButton(
                  onPressed: loading ? null : onReset,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.infinite,
                    foregroundColor: Theme.of(context).hintColor,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text('RESET'),
                ),
        ),
        !extraAsLeading && extra != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 10),
                  extra!,
                  const SizedBox(width: 10),
                ],
              )
            : const VerticalDivider(width: 1),
        Expanded(child: _getSubmitButton()),
      ],
    );
  }
}
