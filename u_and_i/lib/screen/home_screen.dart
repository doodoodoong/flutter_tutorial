import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();
  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
    setState(() {
      firstDay = firstDay.subtract(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            const _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;
  const _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'U&I',
          style: textTheme.displayLarge,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text(
          '${firstDay.year}. ${firstDay.month}. ${firstDay.day}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 16.0,
        ),
        IconButton(
          onPressed: onHeartPressed,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'd+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  const _CoupleImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'asset/img/middle_image.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}
