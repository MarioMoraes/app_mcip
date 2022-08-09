import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWithLoader<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final BlocWidgetSelector<S, bool> selector;
  final B bloc;
  final VoidCallback onPressed;
  final String label;

  const ButtonWithLoader({
    Key? key,
    required this.selector,
    required this.bloc,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: BlocSelector<B, S, bool>(
        bloc: bloc,
        selector: selector,
        builder: (context, showLoading) {
          if (!showLoading) {
            return Text(label);
          }
          return Stack(
            children: const [
              Align(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
