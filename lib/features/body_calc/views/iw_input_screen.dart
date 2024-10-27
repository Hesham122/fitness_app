import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_cubit.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_states.dart';
import 'package:final_project/features/body_calc/views/iw_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/constant_var.dart';
import '../widgets/calculate_button.dart';
import '../widgets/gender_card_content.dart';
import '../widgets/reusable_card.dart';


class IwInputScreen extends StatefulWidget {
  const IwInputScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IwInputScreenState createState() => _IwInputScreenState();
}

class _IwInputScreenState extends State<IwInputScreen> {


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
        title: const Text('IBW CALCULATOR', style: TextStyle(color: Colors.white),),
         leading: InkWell(onTap: (){Navigator.pop(context);},
             child: const Icon(FontAwesomeIcons.arrowLeft, color: Colors.white,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded( // male + female cards
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
                    colour: cubit.isMale ? kChosenGenderColor : kReusableCardColor,
                    cardChild: const GenderCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                    ),
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
                    colour: cubit.isMale ? kReusableCardColor : kChosenGenderColor,
                    cardChild: const GenderCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded( // height slider card
            child: ReusableCard(
              colour: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        cubit.height.toString(),
                        style: kLabelNumberStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith( // use context and get theme of nearest slider to modify
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Colors.deepOrange[500],
                      activeTrackColor: Colors.white,
                      overlayColor: Colorsapp.liteOrange.withOpacity(0.2),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: cubit.height.toDouble(),
                      min: 60,
                      max: 230,
                      onChanged: (double newValue) {
                        setState(() {
                          cubit.height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              cubit.calculateIBW();
              //BMICalculator calc = BMICalculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IwResultsPage(),)
              );
            },
          ),
        ],
      ),
    );
      },
    );
  }
}

