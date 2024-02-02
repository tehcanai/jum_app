import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final Function? function;
  final bool isLoading;
  const SubmitButton({
    this.isLoading = false,
    this.text = 'Submit',
    this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => {function!()},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          foregroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.inversePrimary),
          shadowColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.inversePrimary),
        ),
        child: isLoading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  strokeWidth: 3,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
