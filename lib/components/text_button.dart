import 'package:flutter/material.dart';

class TextStyleButton extends StatelessWidget {
  final String text;
  final Function? function;
  final bool isLoading;
  const TextStyleButton({
    this.text = 'text button here',
    this.isLoading = false,
    this.function,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => {function!()},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    )),
            (isLoading)
                ? Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                      strokeWidth: 3,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
