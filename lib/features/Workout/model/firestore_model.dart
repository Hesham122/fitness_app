// class UserModel {
//   final String image;
//   final String equip;
//   final String exName;

//   UserModel({
//     required this.image,
//     required this.equip,
//     required this.exName,
//   });

//   // Factory method to create a UserModel from a Firestore document snapshot
//   factory UserModel.fromFirestore(Map<String, dynamic> json) {
//     return UserModel(
//       image: json['image'] as String,
//       equip: json['equip'] as String,
//       exName: json['exName'] as String,
//     );
//   }

//   // Optionally, a method to convert your model to JSON (for writing back to Firestore)
//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'equip': equip,
//       'exName': exName,
//     };
//   }
// }
