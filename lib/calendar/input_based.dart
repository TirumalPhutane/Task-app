import 'package:flutter/material.dart';

class InputBasedCalendar extends StatefulWidget {
  const InputBasedCalendar({super.key});

  @override
  State<InputBasedCalendar> createState() => _InputBasedCalendarState();
}

class _InputBasedCalendarState extends State<InputBasedCalendar> {
  final _totalDaysInputController = TextEditingController();
  final _firstDayInputController = TextEditingController();

  int _totalDays = 30;
  int _firstWeekday = 0;

  @override
  void dispose() {
    _totalDaysInputController.dispose();
    _firstDayInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final DateTime currentMonth = DateTime(2025, 3);
    final dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    final leadingEmptyCells = _firstWeekday;

    final calendarSlots = List<dynamic>.filled(42, null);

    for (var i = 0; i < 7; i++) {
      calendarSlots[i] = dayLabels[i];
    }

    for (var i = 0; i < _totalDays; i++) {
      final targetIndex = i + leadingEmptyCells + 7;
      if (targetIndex < 42) {
        calendarSlots[targetIndex] = i + 1;
      } else {
        final weekdayOfOverflow = (i + _firstWeekday) % 7;
        for (var j = 7; j < 7 + leadingEmptyCells; j++) {
          if (j % 7 == weekdayOfOverflow && calendarSlots[j] == null) {
            calendarSlots[j] = i + 1;
            break;
          }
        }
      }
    }

    //final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: const Text(''), centerTitle: true),
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
                    label: Text('Enter value from 1 to 7'),
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
                crossAxisCount: 7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = calendarSlots[index];

                if (index < 7) {
                  return Center(
                    child: Text(
                      item as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                if (item == null) {
                  return const SizedBox.shrink();
                }

                final dayNum = item;

                //final isSunday = index % 7 == 0;

                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '$dayNum',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('$leadingEmptyCells'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
