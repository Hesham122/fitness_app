import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_cubit.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/constant_var.dart';
import '../widgets/calculate_button.dart';
import '../widgets/gender_card_content.dart';
import '../widgets/reusable_card.dart';
import '../widgets/round_icon_button.dart';
import 'bf_result_screen.dart';

class BfInputScreen extends StatefulWidget {
  const BfInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BfInputScreenState createState() => _BfInputScreenState();
}

class _BfInputScreenState extends State<BfInputScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BodyCalcCubit, BodyCalcStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BodyCalcCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text(
              'BFP CALCULATOR',
              style: TextStyle(color: Colors.white),
            ),
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                )),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                // male + female cards
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            cubit.isMale = true;
                            cubit.changeGender();
                          });
                        },
                        colour: cubit.isMale
                            ? kChosenGenderColor
                            : kReusableCardColor,
                        cardChild: const GenderCardContent(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            cubit.isMale = false;
                            cubit.changeGender();
                          });
                        },
                        colour: cubit.isMale
                            ? kReusableCardColor
                            : kChosenGenderColor,
                        cardChild: const GenderCardContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                // bmi slider card
                child: ReusableCard(
                  colour: kReusableCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'BMI',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            cubit.bmi.toString(),
                            style: kLabelNumberStyle,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          // use context and get theme of nearest slider to modify
                          thumbShape:
                              const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Colors.deepOrange[500],
                          activeTrackColor: Colors.white,
                          overlayColor: Colorsapp.liteOrange.withOpacity(0.2),
                          inactiveTrackColor: const Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: double.parse(cubit
                              .bmi
                              .toStringAsFixed(1)),
                          min: 10,
                          max: 50,
                          onChanged: (double newValue) {
                            setState(() {
                              String inString =
                                  newValue.toStringAsFixed(1); // '2.35'
                              double inDouble = double.parse(inString); // 2.35
                              cubit.bmi = inDouble;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                // weight + age cards
                child: ReusableCard(
                  colour: kReusableCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        cubit.age.toString(),
                        style: kLabelNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (cubit.age > 1) {
                                  cubit.age--;
                                }
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                if (cubit.age < 120) {
                                  cubit.age++;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CalculateButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  cubit.calculateBFP();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BfResultScreen(),
                      ));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
