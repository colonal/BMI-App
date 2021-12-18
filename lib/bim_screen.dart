import 'package:bmi_app/model.dart';
import 'package:bmi_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

// ignore: must_be_immutable
class BIMScreen extends StatefulWidget {
  BIMScreen({Key? key}) : super(key: key);
  Color fColor = const Color.fromRGBO(3, 9, 23, 0.5);
  Color mColor = const Color.fromRGBO(3, 9, 23, 0.5);
  int height = 160;
  int width = 60;
  int age = 20;
  String gender = "";

  double result = 0.0;
  String healthines = "";
  @override
  _BIMScreenState createState() => _BIMScreenState();
}

class _BIMScreenState extends State<BIMScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Body Mass Index",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
          elevation: 0.0,
        ),
        body: BackgroundScreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GenderButton(
                        text: "Male",
                        image: "assets/images/male.svg",
                        color: widget.mColor,
                        onPressed: () => clickGender(1),
                      ),
                      GenderButton(
                        text: "Female",
                        image: "assets/images/female.svg",
                        color: widget.fColor,
                        onPressed: () => clickGender(0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: width,
                    height: height / 4,
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(191, 191, 191, 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            "Height",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              widget.height.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "CM",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Slider(
                            min: 0,
                            max: 210,
                            divisions: 210,
                            activeColor: Colors.pink[700],
                            value: widget.height.toDouble(),
                            onChanged: (val) {
                              setState(() {
                                widget.height = val.toInt();
                              });
                            })
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NewWidget(widget: widget, text: "Weight"),
                      NewWidget(widget: widget, text: "Age"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: () {
                    if (widget.gender != "") {
                      widget.result = widget.width /
                          ((widget.height / 100) * (widget.height / 100));
                      if (widget.result < 18.5) {
                        widget.healthines = "Underweight";
                      } else if (widget.result > 18.5 && widget.result < 24.9) {
                        widget.healthines = "Normal";
                      } else if (widget.result > 25 && widget.result < 29.9) {
                        widget.healthines = "Overweight";
                      } else {
                        widget.healthines = "Obese";
                      }

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => ResultScreen(
                                gender: widget.gender,
                                result: widget.result,
                                healthines: widget.healthines,
                                age: widget.age,
                              )));
                    } else {
                      showTopSnackBar(
                        context,
                        const CustomSnackBar.error(
                          message: "Select Gender",
                        ),
                      );
                    }
                  },
                  color: const Color.fromRGBO(153, 204, 255, 0.3),
                  minWidth: width,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    // side: const BorderSide(color: Colors.red)
                  ),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white.withOpacity(1),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void clickGender(int g) {
    if (g == 1) {
      setState(() {
        widget.mColor = const Color.fromRGBO(25, 15, 23, 1);
        widget.fColor = const Color.fromRGBO(3, 9, 23, 0.5);
        widget.gender = "Male";
      });
    } else {
      setState(() {
        widget.fColor = const Color.fromRGBO(25, 15, 23, 1);
        widget.mColor = const Color.fromRGBO(3, 9, 23, 0.5);
        widget.gender = "Female";
      });
    }
  }
}
