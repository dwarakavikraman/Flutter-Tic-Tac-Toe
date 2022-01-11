import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/theme.dart';

class SelectableCard extends StatelessWidget {
  const SelectableCard(
      {Key? key,
      required this.child,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final Widget child;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: isSelected
              ? Border.all(
                  color: MyColors.darkerRed,
                  width: 1.0,
                )
              : null,
        ),
        child: Padding(padding: const EdgeInsets.all(8.0), child: child),
      ),
    );
  }
}
