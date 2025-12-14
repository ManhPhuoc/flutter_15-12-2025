import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

/* ================= BUỔI 6 ================= */

class Buoi6Screen extends StatefulWidget {
  const Buoi6Screen({super.key});

  @override
  State<Buoi6Screen> createState() => _Buoi6ScreenState();
}

class _Buoi6ScreenState extends State<Buoi6Screen> {
  Widget _currentDemo = const ChangeColorDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "STATEFULWIDGET",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _menu(),
          const Divider(),
          Expanded(child: _currentDemo),
        ],
      ),
    );
  }

  Widget _menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _btn("Demo 1", const ChangeColorDemo()),
        _btn("Demo 2", const CountTimeDemo()),
        _btn("Demo 3", const CounterNumberDemo()),
      ],
    );
  }

  Widget _btn(String text, Widget demo) {
    return TextButton(
      onPressed: () {
        setState(() {
          _currentDemo = demo;
        });
      },
      child: Text(text),
    );
  }
}

/* ================= DEMO 1 ================= */

class ChangeColorDemo extends StatefulWidget {
  const ChangeColorDemo({super.key});

  @override
  State<ChangeColorDemo> createState() => _ChangeColorDemoState();
}

class _ChangeColorDemoState extends State<ChangeColorDemo> {
  Color bgColor = Colors.purple;

  void _change() {
    setState(() {
      bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Center(
        child: ElevatedButton(onPressed: _change, child: const Text("Đổi màu")),
      ),
    );
  }
}

/* ================= DEMO 2 ================= */

class CountTimeDemo extends StatefulWidget {
  const CountTimeDemo({super.key});

  @override
  State<CountTimeDemo> createState() => _CountTimeDemoState();
}

class _CountTimeDemoState extends State<CountTimeDemo> {
  int time = 10;
  Timer? timer;

  void _start() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
      if (time > 0) {
        setState(() => time--);
      }
    });
  }

  void _reset() {
    timer?.cancel();
    timer = null;
    setState(() => time = 10);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time.toString(), style: const TextStyle(fontSize: 50)),
          ElevatedButton(onPressed: _start, child: const Text("Start")),
          SizedBox(height: 10),
          ElevatedButton(onPressed: _reset, child: const Text("Reset")),
        ],
      ),
    );
  }
}

/* ================= DEMO 3 ================= */

class CounterNumberDemo extends StatefulWidget {
  const CounterNumberDemo({super.key});

  @override
  State<CounterNumberDemo> createState() => _CounterNumberDemoState();
}

class _CounterNumberDemoState extends State<CounterNumberDemo> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value.toString(), style: const TextStyle(fontSize: 50)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => setState(() => value--),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => setState(() => value++),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
