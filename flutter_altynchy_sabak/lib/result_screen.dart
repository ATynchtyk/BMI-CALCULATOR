import 'package:flutter/material.dart';
import 'package:flutter_altynchy_sabak/circular_button.dart';
import 'package:flutter_altynchy_sabak/constants.dart';
import 'package:flutter_altynchy_sabak/home_page.dart';
import 'package:flutter_altynchy_sabak/logic/calculation_brain.dart';
import 'package:flutter_altynchy_sabak/reusable_widget.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key key, this.height, this.weight}) : super(key: key);

  final double height;
  final double weight;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();

    calculationBrain.calculateBMI(widget.height, widget.weight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Text(
          'ДЕН-СООЛУК ТИРКЕМЕСИ',
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 35.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Text(
                      ' ЖЫЙЫНТЫК',
                      style: resultTitle,
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    ReUsablWidget(
                      bgColor: activeIconColor,
                      child: Container(
                        width: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              calculationBrain.getResult(),
                              style: resultSubTitle,
                            ),
                            Text(
                              calculationBrain.getResultNumber(),
                              style: resultNumber,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                calculationBrain.getInterpretation(),
                                style: titleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
                child: Text(
                  'КАЙРА-БАШЫНАН',
                  style: buttonTextStyle,
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                },
                buttonColor: buttonColor,
                constraints: BoxConstraints(
                  minHeight: 72,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
          ],
        ),
      ),
    );
  }
}
