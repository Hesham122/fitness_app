
class WorkoutPhotoMain {
  late String descrip;
  late String tphoto;
  late String tname;
}

List<WorkoutPhotoMain> allWorkoutPhoto = [
  WorkoutPhotoMain()
    ..tphoto = "assets/images/push.jpeg"
    ..descrip = "Upper Body Push Workout"..tname="Push",
  WorkoutPhotoMain()
    ..tphoto = "assets/images/back.jpeg"
    ..descrip = "Upper Back Strength Routine"..tname="Back",
  WorkoutPhotoMain()
    ..tphoto = "assets/images/legs.jpeg"
    ..descrip = "Comprehensive Leg Strength Routine"..tname="Legs",
  WorkoutPhotoMain()
    ..tphoto = "assets/images/triceps.jpeg"
    ..descrip = "Triceps Toning Exercise Program"..tname="Triceps",
  WorkoutPhotoMain()
    ..tphoto = "assets/images/biceps.jpeg"
    ..descrip = "Biceps Muscle Building Workout"..tname="Biceps",
];
