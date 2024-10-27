import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/caching/caching_helper.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  String? name;
  String? email;
  bool userFound = true;

  Future<void> getUserData() async {
    User? user = _auth.currentUser;
   
    // set user name value
    name = user?.displayName ?? "";
    email = user?.email ?? "";
    if (user != null) userFound = true;
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Update the user's display name
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();
      // Print user details
      User? user = _auth.currentUser;
 
      // set user name value
      name = user?.displayName ?? "";
      email = user?.email ?? "";
      userFound = true;
     
      CachingHelper.instance?.writeData("firstTime", "yes");
      CachingHelper.instance?.writeData("stepsCalories", 0.0);
      CachingHelper.instance?.writeData("workoutCalories", 0.0);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      // Login with email and password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Print user details
      User? user = _auth.currentUser;
   
      // set user name value
      name = user?.displayName ?? "";
      email = user?.email ?? "";
      userFound = true;
 
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
     
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  // Future<void> addData({
  //   required String image,
  //   required String eq,
  //   required String exname,
  // }) async {
  //   var db = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //   final exercise = <String, String>{
  //     "image": image,
  //     "equip": eq,
  //     "exName": exname
  //   };
  //
  //   db.collection("uuser").doc(user?.uid).collection("fav").add(exercise);
  // }
  Future<void> addTrain({
    required String title,
    required String schudualTime,
    required String currentTime,
    required String focusDay,
  }) async {
   
    User? user = _auth.currentUser;
    CollectionReference userTrain = FirebaseFirestore.instance
        .collection('test')
        .doc(user!.uid)
        .collection("d${focusDay.toString()}");
    final exercise = <String, String>{
      "schud_title": title,
      "schudualtime": schudualTime,
      "currenttime": currentTime
    };

    // Add the new exercise to Firestore
    await userTrain.add(exercise);

    
    // users.doc(user!.uid).set({
    //   "schud_title": title,
    //   "schudualtime": schudualTime,
    //   "currenttime": currentTime
    // });
  }
Future<void> removeTrain({
    required String documentId,
    required String focusDay,
  }) async {
   
    User? user = _auth.currentUser;
    CollectionReference userTrain = FirebaseFirestore.instance
        .collection('test')
        .doc(user!.uid)
        .collection("d${focusDay.toString()}");

    // Remove the specified exercise from Firestore
    await userTrain.doc(documentId).delete();
    
  }

  Future<void> addData({
    required String image,
    required String eq,
    required String exname,
    required String indexx,
  }) async {
    var db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is authenticated
    if (user == null) {
     
      return;
    }

    // Reference to the user's fav collection
    CollectionReference favCollection =
        db.collection("uuser").doc(user.uid).collection("fav");

    // Query Firestore to check if the item already exists
    QuerySnapshot querySnapshot = await favCollection
        .where("image", isEqualTo: image)
        .where("equip", isEqualTo: eq)
        .where("exName", isEqualTo: exname)
        .where("index", isEqualTo: indexx)
        .get();

    // If no matching document is found, add the new exercise
    if (querySnapshot.docs.isEmpty) {
      final exercise = <String, String>{
        "image": image,
        "equip": eq,
        "exName": exname,
        "index": indexx,
      };

      // Add the new exercise to Firestore
      await favCollection.add(exercise);
     
    }  
  }

  Future<void> removeData({
    required String image,
    required String eq,
    required String exname,
    required String indexx,
  }) async {
    var db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is authenticated
    if (user == null) {
     
      return;
    }

    // Reference to the user's fav collection
    CollectionReference favCollection =
        db.collection("uuser").doc(user.uid).collection("fav");

    // Query Firestore to find the document with matching fields
    QuerySnapshot querySnapshot = await favCollection
        .where("image", isEqualTo: image)
        .where("equip", isEqualTo: eq)
        .where("exName", isEqualTo: exname)
        .where("index", isEqualTo: indexx)
        .get();

    // If a matching document is found, delete it
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
       
      }
    }  
  }

  Future<QuerySnapshot> checkIfExists({
    required String image,
    required String eq,
    required String exname,
    required String indexx,
  }) async {
    var db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
     
      throw Exception("User is not authenticated");
    }

    CollectionReference favCollection =
        db.collection("uuser").doc(user.uid).collection("fav");

    return await favCollection
        .where("image", isEqualTo: image)
        .where("equip", isEqualTo: eq)
        .where("exName", isEqualTo: exname)
        .where("index", isEqualTo: indexx)
        .get();
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await _auth.signOut();
      userFound = false;
      emit(AuthSignedOut());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An unknown error occurred'));
    }
  }

  Stream<User?> authStateChanges() {
    emit(AuthSuccess());
    return _auth.authStateChanges();
  }

  Future<User?> checkUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Optionally, you can check if the user is signed in with a valid token
      // String token = await user.getIdToken();
    }
    return user;
  }
}
