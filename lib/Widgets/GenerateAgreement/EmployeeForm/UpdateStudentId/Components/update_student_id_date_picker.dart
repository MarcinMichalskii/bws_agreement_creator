import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final studentIdExpiryDateProvider =
    StateProvider.autoDispose<DateTime?>((ref) => null);

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({
    super.key,
    required this.placeholder,
  });

  final String placeholder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(studentIdExpiryDateProvider);
    final dateFormatter = DateFormat('dd.MM.yyyy'); //

    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate:
              selectedDate ?? DateTime.now().add(const Duration(days: 7)),
          firstDate: DateTime.now().add(const Duration(days: 7)),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          ref.read(studentIdExpiryDateProvider.notifier).state = pickedDate;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          selectedDate != null
              ? '${'expiryDate'.tr()}: ${dateFormatter.format(selectedDate)}'
              : placeholder,
          style: const TextStyle(fontSize: 16, color: CustomColors.gray),
        ),
      ),
    );
  }
}
