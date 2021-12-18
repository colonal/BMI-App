import 'package:bmi_app/bim_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;

  const BackgroundScreen({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    var heightAppBar = AppBar().preferredSize.height;
    print(heightAppBar);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(3, 9, 23, 1),
      ),
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/one8.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: 0,
            child: Container(
              width: width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/one8.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: 0,
            child: Container(
              width: width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/one8.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: -150,
            left: 0,
            child: Container(
              width: width,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/one8.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              width: width,
              height: height - heightAppBar,
              top: 0,
              child: child),
        ],
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({Key? key, required this.widget, required this.text})
      : super(key: key);

  final BIMScreen widget;
  final String text;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(191, 191, 191, 0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            widget.text,
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            widget.text == "Age"
                ? widget.widget.age.toString()
                : widget.widget.width.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () {
                  if (widget.text == "Age") {
                    setState(() {
                      if (widget.widget.age != 0) --widget.widget.age;
                    });
                  } else {
                    setState(() {
                      if (widget.widget.width != 0) --widget.widget.width;
                    });
                  }
                },
                child: const Text(
                  "-",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                ),
              ),
              ElevatedButton(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () {
                  if (widget.text == "Age") {
                    setState(() {
                      ++widget.widget.age;
                    });
                  } else {
                    setState(() {
                      ++widget.widget.width;
                    });
                  }
                },
                child: const Text(
                  "+",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(5),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String text;
  final String image;
  final Color color;
  final void Function()? onPressed;
  const GenderButton(
      {Key? key,
      required this.text,
      required this.image,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 160,
        padding: const EdgeInsets.all(0),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                //semanticsLabel: 'Acme Logo',
                width: 100,
              ),
              const SizedBox(height: 20),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.red)),
        onPressed: onPressed);
  }
}
