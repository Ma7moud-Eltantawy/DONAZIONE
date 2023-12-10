import 'dart:convert';
import 'dart:io';

import 'package:blood_donar/core/entities/UserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/binaryauthorization/v1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/Models/moreinfomodel.dart';
import '../../core/Models/userdatamodel.dart';
import '../../core/constants.dart';
import '../../core/enums.dart';
import '../../core/networking/request_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as path;

abstract class BaseAuthDataSource{
  Future <void>sendOTP({required String number});
  Future<RequestResult<UserCredential>>SignUp({
    required String email,
    required String pass,

});
  Future<RequestResult<UserCredential>>login({
    required String email,
    required String pass,
  });
  Future<RequestResult<OAuthCredential>>loginwithgoogle();
  Future<RequestResult<Userdatamodel>>Getuserdata({required String id});
  Future<RequestResult<RequestState>>uploaduserdata({required Userdatamodel user});
  Future<RequestResult<moreinfodatamodel>> Getmoreinformationuser({required String id});

  Future<void>SaveuserinDB({required Userdatamodel user});
  Future<RequestResult<String>>Uploadimgtostorage({required XFile img});
  Future<RequestResult<RequestState>> uploadmoreinformationdata({required String id,required moreinfodatamodel user});


  Future<RequestResult<Userdatamodel>>getuserfromDB();
  Future<void>cleanDB();

  Future<void> logout();
}

class AuthRemoteDataSource implements BaseAuthDataSource{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Future<RequestResult<UserCredential>> SignUp(
      {required String email, required String pass}) async {
    late UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return RequestResult(
        requestState: RequestState.success,
        data: credential,
      );
    } on FirebaseAuthException catch (e) {
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.message,
      );
    }
  }

  @override
  Future<RequestResult<UserCredential>> login({required String email, required String pass}) async{
    late UserCredential credential;
    try{
      credential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
      return RequestResult(requestState: RequestState.success,data: credential);
    }
    on FirebaseAuthException catch(e)
    {
      return RequestResult(requestState: RequestState.failed,errorMessage: e.message);

    }
  }

  @override
  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userdata');
    currentuserdata=null;
    currentusermoreinfo=null;

  }

  @override
  Future<RequestResult<OAuthCredential>> loginwithgoogle() async{
    final GoogleSignIn googleSignIn = await GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    late  OAuthCredential credential;
    try{
      credential= GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(credential.toString());
      return RequestResult(requestState: RequestState.success,data: credential);
    }
    on FirebaseAuthException catch(e)
    {

      return RequestResult(requestState: RequestState.failed,errorMessage: e.message);

    }
  }
  @override
  Future<void> sendOTP({required String number}) async{
    // TODO: implement sendOTP
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-verification if the SMS code is detected automatically
        await auth.signInWithCredential(credential);
        print("mahmoud");
        print(credential.smsCode);
        // Handle successful verification
      },
      verificationFailed: (FirebaseAuthException e) {
        print("exeption $e");
        // Handle verification failure
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID and show the OTP input UI
        // You can use the verification ID to manually enter the OTP
        print("ver id$verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
        print("ver id 2$verificationId");
      },
    );
  }

  @override
  Future<RequestResult<RequestState>> uploaduserdata({required Userdatamodel user}) async {

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try{
     await _firestore.collection("user_data").doc("${user.id}").set(user.toJson(),);
      return RequestResult(requestState: RequestState.success,data: RequestState.success);
    }
    catch(e)
    {
      return RequestResult(requestState: RequestState.success,data: RequestState.failed);


    }


  }
  @override
  Future<RequestResult<RequestState>> uploadmoreinformationdata({required String id,required moreinfodatamodel user}) async {

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try{
      await _firestore.collection("user_data").doc(id).collection("moreinfo").doc(id).set(user.toJson(),);
      return RequestResult(requestState: RequestState.success,data: RequestState.success);
    }
    catch(e)
    {
      return RequestResult(requestState: RequestState.success,data: RequestState.failed);


    }


  }



  @override
  Future<RequestResult<Userdatamodel>> Getuserdata({required String id}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Userdatamodel? userdata;

    try {
      final snapshot = await _firestore.collection("user_data").doc(id).get();

      if (snapshot.exists) {
        userdata = Userdatamodel.fromJson(snapshot.data() as Map<String, dynamic>);
        print(userdata.email);
        //print(userdata.imglink);
        Getmoreinformationuser(id: userdata.id!);

        return RequestResult(requestState: RequestState.success, data: userdata);
      } else {
        // User not found
        return RequestResult(requestState: RequestState.failed, errorMessage: "User not found");
      }
    } catch (e) {
      print(e);
      return RequestResult(requestState: RequestState.failed, errorMessage: e.toString());
    }
  }


  @override
  Future<void> SaveuserinDB({required Userdatamodel user}) async {
    print("try to save in db");
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String jsonstring=json.encode(user.toJson());
      prefs.setString('userdata', jsonstring);
    }
    catch(e)
    {
      print(e);
    }


  }

  @override
  Future<RequestResult<Userdatamodel>> getuserfromDB() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonString =await prefs.getString('userdata');
      Map<String, dynamic> jsonMap = json.decode(jsonString!);
      currentuserdata=Userdatamodel.fromJson(jsonMap);


      return RequestResult(requestState: RequestState.success,data:Userdatamodel.fromJson(jsonMap));
    }
    catch(e)
    {
      return RequestResult(requestState: RequestState.failed,errorMessage: e.toString());
    }

  }



  @override
  Future<void> cleanDB() async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('userdata');
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<RequestResult<moreinfodatamodel>> Getmoreinformationuser ({required String id}) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      DocumentSnapshot document2 = await _firestore
          .collection("user_data")
          .doc(id)
          .collection("moreinfo")
          .doc(id)
          .get();

      if (document2.exists) {
        moreinfodatamodel usermoreinfo = moreinfodatamodel.fromJson(
            document2.data() as Map<String, dynamic>);
        currentusermoreinfo=usermoreinfo;
        print(usermoreinfo.platelets.toString());
        print("---------------------");
        return RequestResult(requestState: RequestState.success, data: usermoreinfo);
      } else {
        print("Document not found");
        return RequestResult(requestState: RequestState.failed, errorMessage: "Document not found");
      }
    } catch (error) {
      // Handle error appropriately, e.g., log it
      print("Error fetching user information: $error");
      return RequestResult(requestState: RequestState.failed, errorMessage: error.toString());
    }
  }
  @override
  Future<RequestResult<String>> Uploadimgtostorage({required XFile img}) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    try{
      final String fileName = path.basename(img.path);
      print(fileName);
      final imagefile=File(img.path);
      print(imagefile);
      print("object");

        var StorageTaskSnapshot = await storage.ref(fileName).putFile(
            imagefile);
        print(StorageTaskSnapshot.toString());
        String url = await StorageTaskSnapshot.ref.getDownloadURL();
        return RequestResult(requestState: RequestState.success,data: url);


    }
    catch(e){
      return RequestResult(requestState: RequestState.success,errorMessage: e.toString());
    }
  }






}