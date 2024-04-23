import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum _CopyState { idle, success, error, loading }

class CopyText extends StatefulWidget {
  const CopyText({super.key, required this.label, required this.copyable});

  final String label;
  final String copyable;

  @override
  State<CopyText> createState() => _CopyTextState();
}

class _CopyTextState extends State<CopyText> {
  _CopyState _copyState = _CopyState.idle;

  Future<void> _handleCopy() async {
    if (!mounted) return;

    setState(() => _copyState = _CopyState.loading);

    try {
      await Clipboard.setData(ClipboardData(text: widget.copyable));

      setState(() => _copyState = _CopyState.success);
    } catch (e) {
      setState(() => _copyState = _CopyState.error);
    } finally {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() => _copyState = _CopyState.idle);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _copyState != _CopyState.idle ? null : _handleCopy,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(widget.label, overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 10),
          _renderIcon(),
        ],
      ),
    );
  }

  Widget _renderIcon() {
    switch (_copyState) {
      case _CopyState.idle:
        return Icon(
          Icons.copy,
          size: 12,
          color: Theme.of(context).colorScheme.primary,
        );
      case _CopyState.success:
        return Icon(
          Icons.check,
          size: 12,
          color: Theme.of(context).colorScheme.primary,
        );
      case _CopyState.error:
        return Icon(
          Icons.error_outline,
          size: 12,
          color: Theme.of(context).colorScheme.error,
        );
      case _CopyState.loading:
        return const SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(strokeWidth: 2),
        );
    }
  }
}
