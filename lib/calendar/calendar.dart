import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key}) : currentMonth = DateTime(2025, 3);
  final DateTime currentMonth;

  @override
  Widget build(BuildContext context) {
    final totalDays = DateUtils.getDaysInMonth(
      currentMonth.year,
      currentMonth.month,
    );
    final firstDay = DateTime(
      currentMonth.year,
      currentMonth.month,
    );
    final firstWeekday = firstDay.weekday % 7;
    final leadingEmptyCells = firstWeekday;
    const totalCells = 35;

    // Fill calendar slots
    final calendarSlots = List<int?>.filled(totalCells, null);
    for (var i = 0; i < totalDays; i++) {
      final targetIndex = i + leadingEmptyCells;
      if (targetIndex < totalCells) {
        calendarSlots[targetIndex] = i + 1;
      } else {
        // Overflow day, try to fill into correct weekday column in leading
        //empty cells
        final weekdayOfOverflow = (i + firstWeekday) % 7;
        for (var j = 0; j < leadingEmptyCells; j++) {
          if (j % 7 == weekdayOfOverflow && calendarSlots[j] == null) {
            calendarSlots[j] = i + 1;
            break;
          }
        }
      }
    }

    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.yMMMM().format(currentMonth)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                  .map(
                    (e) => Text(
                      e,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                  .toList(),
            ),
          ),
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
                final dayNum = calendarSlots[index];
                final isToday =
                    dayNum != null &&
                    today.day == dayNum &&
                    today.month == currentMonth.month &&
                    today.year == currentMonth.year;
                final isSunday = index % 7 == 0;

                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isToday
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  child: dayNum != null
                      ? Text(
                          '$dayNum',
                          style: TextStyle(
                            color: isToday
                                ? Colors.white
                                : isSunday
                                ? Colors.red
                                : Colors.black,
                            fontWeight: FontWeight.bold,
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
