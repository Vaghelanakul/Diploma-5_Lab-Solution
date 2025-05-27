import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String result = ""; // To store result

  void calculate(String operator) {
    double val1 = double.tryParse(num1.text) ?? 0;
    double val2 = double.tryParse(num2.text) ?? 0;
    double res = 0;

    switch (operator) {
      case "+":
        res = val1 + val2;
        break;
      case "-":
        res = val1 - val2;
        break;
      case "*":
        res = val1 * val2;
        break;
      case "/":
        if (val2 != 0) {
          res = val1 / val2;
        } else {
          setState(() {
            result = "Cannot divide by zero";
          });
          return;
        }
        break;
    }

    setState(() {
      result = "Result: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter first number",
                labelText: "Num1",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter second number",
                labelText: "Num2",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => calculate("+"), child: const Text("+")),
                ElevatedButton(
                    onPressed: () => calculate("-"), child: const Text("-")),
                ElevatedButton(
                    onPressed: () => calculate("*"), child: const Text("*")),
                ElevatedButton(
                    onPressed: () => calculate("/"), child: const Text("/")),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
