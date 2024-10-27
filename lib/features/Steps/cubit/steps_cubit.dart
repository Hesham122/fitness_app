import 'package:final_project/core/notification/notification_service.dart';
import 'package:final_project/features/Steps/cubit/steps_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepsCubit extends Cubit<StepsStates> {
  StepsCubit() : super(InitialState());

  static StepsCubit get(context) => BlocProvider.of(context);


// The callback function that triggers the notification
   Future<void> sendNotification() async {
    await NotificationService()
        .showNotification(
      'steps_channel',
      'You reaches',
      'Channel for Steps Notifications',
      'Steps',
      'You achieved your goal 8000 Steps for today👏',
    ).then((val) {
     
    });
  }
}
