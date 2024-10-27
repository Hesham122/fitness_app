import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/caching/caching_helper.dart';
import 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {

  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);


  int steps = 0;
  int water = 0;
  int sleepHours = 0;
  int sleepQuality = 0;
  double stepsCalories = 0;
  double workoutCalories = 0;
  int calories = 0;
  int totalCalories = 0;

  void initProfile() {
    steps = CachingHelper.instance?.readInteger("savedTodaySteps") ?? 0;
    water = CachingHelper.instance?.readInteger('savedDrunkWater') ?? 0;
    sleepHours = CachingHelper.instance?.readInteger('savedSleepHours') ?? 0;
    sleepQuality = CachingHelper.instance?.readInteger('savedSleepQuality') ?? 0;
    stepsCalories = CachingHelper.instance?.readDouble('stepsCalories') ?? 0.0;
    workoutCalories = CachingHelper.instance?.readDouble('workoutCalories') ?? 0.0;
    calories = (stepsCalories.toInt() + workoutCalories).toInt();
    totalCalories = ((stepsCalories.toInt() + workoutCalories)/2000).toInt();
   
    emit(ProfileLoading());
  }
}
