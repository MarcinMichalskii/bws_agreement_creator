import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class DefaultListElement extends StatelessWidget {
  const DefaultListElement({
    super.key,
    this.locked = false,
    required this.onElementTapped,
    required this.onElementDelete,
    required this.passed,
    required this.title,
    this.isReordering = false,
  });

  final bool locked;
  final bool passed;
  final String title;
  final bool isReordering;

  final VoidCallback onElementTapped;
  final VoidCallback? onElementDelete;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: locked ? 0.5 : 1,
      child: TouchableOpacity(
        onTap: locked ? null : onElementTapped,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: CustomColors.almostBlack2,
            child: Row(
              children: [
                Icon(Icons.book,
                    color: passed ? CustomColors.green : CustomColors.darkGray),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 20, color: CustomColors.gray)),
                  ),
                ),
                const Spacer(),
                if (isReordering)
                  const Icon(Icons.drag_handle, color: CustomColors.darkGray),
                if (onElementDelete != null)
                  TouchableOpacity(
                      onTap: onElementDelete,
                      child: const Icon(Icons.delete,
                          color: CustomColors.darkGray)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
