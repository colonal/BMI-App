import 'package:bmi_app/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.age,
      required this.result,
      required this.healthines,
      required this.gender,
      Key? key})
      : super(key: key);

  final String gender;
  final double result;
  final String healthines;
  final int age;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
        leading: Container(),
      ),
      body: SafeArea(
        child: BackgroundScreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 160,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 15, 23, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      gender == "Male"
                          ? "assets/images/male.svg"
                          : "assets/images/female.svg",
                      //semanticsLabel: 'Acme Logo',
                      width: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      gender,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                width: width,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(191, 191, 191, 0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Result: " + result.toInt().toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Healthiness: " + healthines,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Age: " + age.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: const Color.fromRGBO(230, 0, 0, 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
