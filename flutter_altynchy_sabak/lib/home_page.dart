import 'package:flutter/material.dart';
import 'package:flutter_altynchy_sabak/circular_button.dart';
import 'package:flutter_altynchy_sabak/constants.dart';
import 'package:flutter_altynchy_sabak/enums.dart';
import 'package:flutter_altynchy_sabak/icon_widget.dart';
import 'package:flutter_altynchy_sabak/result_screen.dart';
import 'package:flutter_altynchy_sabak/reusable_widget.dart';
import 'package:flutter_altynchy_sabak/weight_haight_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE, UNKNOWN }

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender = Gender.UNKNOWN;
  WeightOrAge weightOrAge;

  double _height = 120;
  int _weight = 45;
  int _age = 16;

  void _decrement(WeightOrAge chosenType) {
    if (chosenType == WeightOrAge.WEIGHT) {
      _weight--;
    } else {
      _age--;
    }
    setState(() {});
  }

  void _increment(WeightOrAge chosenType) {
    if (chosenType == WeightOrAge.WEIGHT) {
      _weight++;
    } else {
      _age++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 35.0),
                      Row(
                        children: [
                          ReUsablWidget(
                            onTap: () => chooseGender(Gender.MALE),
                            bgColor: gender == Gender.MALE
                                ? activeIconColor
                                : inActiveIconColor,
                            child: IconWidget(
                              icon: FontAwesomeIcons.mars,
                              text: 'ЭРКЕК',
                              allPaddingSize: 32.0,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          const SizedBox(
                            width: 25.0,
                          ),
                          ReUsablWidget(
                            onTap: () => chooseGender(Gender.FEMALE),
                            bgColor: gender == Gender.FEMALE
                                ? activeIconColor
                                : inActiveIconColor,
                            child: IconWidget(
                              icon: FontAwesomeIcons.venus,
                              text: 'АЯЛ',
                              allPaddingSize: 32.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      ReUsablWidget(
                        onTap: null,
                        bgColor: activeIconColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                'БОЙ',
                                style: titleTextStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  // const SizedBox(
                                  //   width: 5.0,
                                  // ),
                                  Text(
                                    _height.round().toString(),
                                    style: numberTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'см',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 2.0,
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.grey,
                                thumbColor: Colors.red,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 18.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                                overlayColor: Color(0x29EB1555),
                              ),
                              child: Slider(
                                value: _height,
                                min: 50,
                                max: 240,
                                onChanged: (double ozgorgonSan) {
                                  setState(() {
                                    _height = ozgorgonSan;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          ReUsablWidget(
                            onTap: null,
                            bgColor: activeIconColor,
                            child: WeightHaightWidget(
                              title: 'САЛМАК',
                              weight: _weight.toString(),
                              increment: () => _increment(WeightOrAge.WEIGHT),
                              decrement: () => _decrement(WeightOrAge.WEIGHT),
                            ),
                          ),
                          const SizedBox(
                            width: 25.0,
                          ),
                          ReUsablWidget(
                            onTap: null,
                            bgColor: activeIconColor,
                            child: WeightHaightWidget(
                              title: 'ЖАШ',
                              age: _age.toString(),
                              increment: () => _increment(WeightOrAge.AGE),
                              decrement: () => _decrement(WeightOrAge.AGE),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                child: Text(
                  'ЭСЕПТЕГИЧ',
                  style: buttonTextStyle,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              height: _height,
                              weight: _weight.toDouble(),
                            )),
                  );
                },
                buttonColor: buttonColor,
                constraints: BoxConstraints(
                  minHeight: 72,
                  minWidth: MediaQuery.of(context).size.width,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  chooseGender(Gender chosenGender) {
    setState(() {
      gender = chosenGender;
    });
  }
}
