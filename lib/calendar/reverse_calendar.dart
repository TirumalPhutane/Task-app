import 'package:flutter/material.dart';

class ReverseCalendar extends StatefulWidget {
  const ReverseCalendar({super.key});

  @override
  State<ReverseCalendar> createState() => _ReverseCalendarState();
}

class _ReverseCalendarState extends State<ReverseCalendar> {
  final _totalDaysInputController = TextEditingController();
  final _firstDayInputController = TextEditingController();

  int _totalDays = 31;
  int _firstWeekday = 6;

  @override
  void dispose() {
    _totalDaysInputController.dispose();
    _firstDayInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final DateTime currentMonth = DateTime(2025, 3);
    final dayLabels = <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    final calendarSlots = List<dynamic>.filled(42, null);

    var date = 1;
    var emptyCells = _firstWeekday;

    for (var i = 0; i < calendarSlots.length; i++) {
      final row = i % 7;
      final column = i ~/ 7;
      var x = _totalDays - (35 - emptyCells);

      final index = row * 6 + column;

      if (column == 0) {
        calendarSlots[index] = dayLabels[row];
      } else if (emptyCells > 0) {
        if (x > 0) {
          calendarSlots[index] = _totalDays - x + 1;
          --x;
        }
        emptyCells--;
      } else if (date <= _totalDays) {
        calendarSlots[index] = date++;
      }
      //print("${calendarSlots.toString()}");
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Kalnirnay'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _totalDaysInputController,
                  decoration: const InputDecoration(
                    label: Text('Enter total days in month'),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _firstDayInputController,
                  decoration: const InputDecoration(
                    label: Text('Enter first day'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final daysInput = int.tryParse(_totalDaysInputController.text)!;
              final firstDayInput =
                  int.tryParse(_firstDayInputController.text)! - 1;

              if (daysInput >= 28 &&
                  daysInput <= 31 &&
                  firstDayInput >= 0 &&
                  firstDayInput < 7) {
                setState(() {
                  _totalDays = daysInput;
                  _firstWeekday = firstDayInput;
                });
              } else {
                const snackBarDemo = SnackBar(
                  content: Text(
                    'Enter days between 28–31 and first day between 1–7',
                  ),
                  backgroundColor: Colors.deepPurple,
                  elevation: 10,
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(5),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBarDemo);
              }
            },
            child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: calendarSlots.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = calendarSlots[index];
                final isDayInitial = index % 6 == 0;

                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: isDayInitial
                        ? Colors.blue.shade50
                        : Colors.grey.shade200,
                  ),
                  child: item != null
                      ? Text(
                          '$item',
                          style: TextStyle(
                            fontWeight: isDayInitial
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        )
                      : const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
