import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final bool? enabled;
  final String label;
  final Function(String)? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final String? value;
  final int? multiline;
  final Function(String)? onSubmitted;
  final AutovalidateMode? autovalidateMode;
  final bool isNumber;

  const InputField(
    this.label, {
    this.onChanged,
    super.key,
    this.validator,
    this.enabled,
    this.onTapOutside,
    this.value,
    this.multiline,
    this.onSubmitted,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.isNumber = false,
  });

  @override
  State<InputField> createState() => _InputField();
}

class _InputField extends State<InputField> {
  _InputField();
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black87.withOpacity(0.05),
        borderRadius: BorderRadiusDirectional.circular(20),
        border: Border.all(color: const Color.fromRGBO(234, 237, 238, 1)),
      ),
      child: TextFormField(
        keyboardType: (widget.isNumber)
            ? const TextInputType.numberWithOptions(decimal: false)
            : null,
        initialValue: widget.value,
        maxLines: widget.multiline,
        minLines: widget.multiline,
        onTapOutside: widget.onTapOutside,
        onFieldSubmitted: widget.onSubmitted,
        enabled: widget.enabled,
        autovalidateMode: widget.autovalidateMode,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: widget.label,
          hoverColor: Theme.of(context).colorScheme.primary,
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.grey,
              ),
        ),
        onChanged: widget.onChanged,
        validator: widget.validator,
      ),
    );
  }
}
