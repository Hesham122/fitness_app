import 'package:final_project/features/body_calc/cubit/body_calc_cubit.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/utils/constant_var.dart';
import '../widgets/calculate_button.dart';
import '../widgets/reusable_card.dart';

class IwResultsPage extends StatelessWidget {
  const IwResultsPage({super.key});


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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ideal Weight",
                    style: kResultsTextStyle,
                  ),
                  Text("${cubit.minWeight} : ${cubit.maxWeight}",
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  const Text("This your ideal Body weight range in kg",
                    style: kResultsBodyTextStyle,),
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
      },
    );
  }
}