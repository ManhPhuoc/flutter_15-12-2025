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
        backgroundColor: Colors.blue.shade900,
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
  int time = 0;
  Timer? timer;
  final TextEditingController _controller = TextEditingController();

  void _start() {
    if (time <= 0) return;

    timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
      if (time > 0) {
        setState(() => time--);
      } else {
        timer?.cancel();
        timer = null;
      }
    });
  }

  void _reset() {
    timer?.cancel();
    timer = null;
    setState(() {
      time = 0;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// LABEL
          const Text(
            "Nhập số giây cần đếm",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          /// INPUT (HẸP)
          SizedBox(
            width: 200,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  time = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          /// TIME
          Text(time.toString(), style: const TextStyle(fontSize: 50)),

          const SizedBox(height: 20),

          /// BUTTONS SONG SONG
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _start,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Bắt đầu"),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Đặt lại"),
              ),
            ],
          ),
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
