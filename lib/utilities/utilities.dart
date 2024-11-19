import 'package:intl/intl.dart';
import 'package:jio_works/utilities/library.dart';

String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

String getFormattedDate() {
  final now = DateTime.now();
  // Format: "Day, Date Month"
  return DateFormat('EEEE, d MMMM').format(now);
}

Widget divider({
  double width = 220,
  double height = 0.5,
}) {
  return Container(
    width: width,
    height: height,
    color: Colors.grey[400],
  );
}

Future<DateTime?> selectCustomDate({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  DateTime? selectedDate = initialDate ?? DateTime.now();

  return await showDialog<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Select Date"),
        content: SizedBox(
          height: 300,
          child: CalendarDatePicker(
            initialDate: selectedDate,
            firstDate: firstDate ?? DateTime(2000),
            lastDate: lastDate ?? DateTime(2100),
            onDateChanged: (DateTime date) {
              selectedDate = date;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, null); // Cancel
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, selectedDate); // Confirm
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}