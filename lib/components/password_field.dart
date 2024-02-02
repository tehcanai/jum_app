import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const PasswordField(this.label, {this.onChanged, this.validator, super.key});
  @override
  State<PasswordField> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  late bool isVisible = true;
  late Icon visibilityIcon =
      const Icon(Icons.visibility_off_outlined, color: Colors.grey);
  _PasswordField();

  void _setVisibility() {
    setState(() {
      if (isVisible) {
        isVisible = false;
        visibilityIcon =
            const Icon(Icons.visibility_outlined, color: Colors.grey);
      } else if (isVisible == false) {
        isVisible = true;
        visibilityIcon =
            const Icon(Icons.visibility_off_outlined, color: Colors.grey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 8, right: 16),
      decoration: BoxDecoration(
        color: Colors.black87.withOpacity(0.05),
        borderRadius: BorderRadiusDirectional.circular(20),
        border: Border.all(color: const Color.fromRGBO(234, 237, 238, 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: isVisible,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
          ),
          IconButton(
            icon: visibilityIcon,
            onPressed: _setVisibility,
          )
        ],
      ),
    );
  }
}
