import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class SelectDateButton extends HookWidget {
  const SelectDateButton(
      {super.key,
      required this.dateText,
      required this.headerText,
      required this.onDateSelected});
  final DateTime dateText;
  final String headerText;
  final void Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final onPress = useCallback(() async {
      final value = await showDatePicker(
          context: context,
          initialDate: dateText,
          firstDate: DateTime.now().add(const Duration(days: -365 * 100)),
          lastDate: DateTime.now().add(const Duration(days: 365 * 100)));

      if (value != null) {
        onDateSelected(value);
      }
    }, [dateText, onDateSelected]);
    return FormButtonUI(
        title: DateFormat('dd.MM.yyyy').format(dateText),
        headerText: headerText,
        hasHeader: headerText.isNotEmpty,
        onPress: onPress,
        icon:
            const Icon(Icons.calendar_month, color: CustomColors.almostBlack));
  }
}

class FormButtonUI extends StatelessWidget {
  const FormButtonUI(
      {super.key,
      required this.title,
      required this.headerText,
      required this.onPress,
      required this.icon,
      this.textColor = CustomColors.almostBlack,
      this.textSize = 15,
      this.fontWeight = FontWeight.normal,
      this.hasHeader = true});
  final String title;
  final Icon icon;
  final String headerText;
  final VoidCallback onPress;
  final Color textColor;
  final bool hasHeader;
  final double textSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasHeader) FormContainerHeader(headerText: headerText),
        DecoratedBox(
          decoration: BoxDecoration(
              color: CustomColors.applicationColorMain,
              borderRadius: BorderRadius.circular(5)),
          child: _FormButtonContent(
              dateText: title,
              onPress: onPress,
              icon: icon,
              textColor: textColor,
              textSize: textSize,
              fontWeight: fontWeight),
        ),
      ],
    );
  }
}

class _FormButtonContent extends StatelessWidget {
  const _FormButtonContent(
      {required this.dateText,
      required this.onPress,
      required this.icon,
      required this.textColor,
      required this.fontWeight,
      required this.textSize});

  final String dateText;
  final VoidCallback onPress;
  final Icon icon;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onTap: onPress,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(margin: const EdgeInsets.only(left: 8), child: icon),
              Flexible(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 18, 16, 16),
                    child: Text(dateText,
                        style: TextStyle(
                            color: textColor,
                            fontSize: textSize,
                            fontWeight: fontWeight))),
              )
            ]),
          ),
        ));
  }
}

class FormContainerHeader extends StatelessWidget {
  const FormContainerHeader({
    super.key,
    required this.headerText,
  });

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 8, 0, 2),
      child: Text(
        headerText,
        style: const TextStyle(color: CustomColors.gray, fontSize: 12),
      ),
    );
  }
}
