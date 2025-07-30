import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    int day = now.day;
    String month = DateFormat.MMMM().format(now);
    int year = now.year;
    final int totalDays = DateUtils.getDaysInMonth(now.year, now.month);
    final int firstWeekDay = DateTime(now.year, now.month, 1).weekday;

    final int leadingEmptyCells = firstWeekDay % 7;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Calendar"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(32, 10, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$month $year',
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.onTertiaryFixedVariant,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_left, size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_right, size: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "S",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 44),
                    Text("M", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 44),
                    Text("T", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 45),
                    Text("W", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 44),
                    Text("T", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 47),
                    Text("F", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 46),
                    Text("S", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 1, height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: totalDays + leadingEmptyCells,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                if (index < leadingEmptyCells) {
                  return SizedBox();
                }
                int dayNum = index - leadingEmptyCells + 1;
                bool isToday = dayNum == day;
                bool isSunday = index % 7 == 0;

                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: isToday
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .colorScheme
                              .primary, // background color for the circle
                        )
                      : null,
                  child: Text(
                    '$dayNum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: isToday ? FontWeight.bold : FontWeight.w600,
                      color: isToday
                          ? Colors.white
                          : isSunday
                          ? Colors.red
                          : Theme.of(context).colorScheme.secondary,
                    ),
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
